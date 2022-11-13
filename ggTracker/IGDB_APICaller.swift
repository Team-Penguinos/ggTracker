//
//  IGDB_APICaller.swift
//  ggTracker
//
//  Created by Siobahn Devlin on 10/24/22.
//

import Foundation
import IGDB_SWIFT_API


class IGDB_APICaller {
    
    struct AccessToken: Decodable {
        var access_token: String
        var expires_in: Int
        var token_type: String
    }
    
    let clientID = "zzeuu3jskz7ryinzc5b1rg854yl3j6"
    let clientSecret = "aczebezd76a8pcsl2uyehwl1m4fkdl"
    var globalAccessToken = ""
    
    private func requestAccessToken(completion: @escaping (String) -> ()) {
        let url = URL(string: "https://id.twitch.tv/oauth2/token?")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "client_id=\(clientID)&client_secret=\(clientSecret)&grant_type=client_credentials";
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
               
            }
            if let data = data {
                let newAccessToken: AccessToken = try! JSONDecoder().decode(AccessToken.self, from: data)
                completion(newAccessToken.access_token)
            }
        }
        task.resume()
    }
    
    private func convertJsonDataToGameObject(_ data: String) -> [Game] {
        let decoder = JSONDecoder()
        var gamesList: [Game] = []
        
        let jsonData = Data(data.utf8)
        do {
            gamesList = try decoder.decode([Game].self, from: jsonData)
            print("\(gamesList)")
        } catch {
            print(error)
        }
        return gamesList
    }
    
    func getTopGames(numOfGames: Int, completion: @escaping ([Game]) -> ()) {
        requestAccessToken { accessToken in
            self.globalAccessToken = accessToken
            let wrapper: IGDBWrapper = IGDBWrapper(clientID: self.clientID, accessToken: accessToken)
            var gamesList: [Game] = []
            let apicalypse = APICalypse()
                .fields(fields: "name, rating, summary, release_dates, cover")
                .limit(value: Int32(numOfGames))
                .sort(field: "rating", order: .DESCENDING)
                .where(query: "rating > 95")
            
            wrapper.jsonGames(apiCalypse: apicalypse) { games in
                gamesList = self.convertJsonDataToGameObject(games)
                completion(gamesList)
            } errorResponse: { error in
                print("\(error)")
            }
        }
    }
}

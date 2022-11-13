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
    var token: String = ""
    

    
    func getTopGames()  {
        
        
//        let requestString = "cover, first_release_date, genres, rating, storyline"

        let wrapper: IGDBWrapper = IGDBWrapper(clientID: clientID, accessToken: self.token)

        let apicalypse = APICalypse()
            .fields(fields: "*")
            .sort(field: "release_dates.date", order: .DESCENDING)

        wrapper.games(apiCalypse: apicalypse, result: { games in
            print(games)
        }) { error in
            print("Error: \(error)")
        }
    }
}

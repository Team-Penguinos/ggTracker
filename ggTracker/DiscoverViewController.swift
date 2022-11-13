//
//  DiscoverViewController.swift
//  ggTracker
//
//  Created by Kirk Shields on 10/31/22.
//

import UIKit
import IGDB_SWIFT_API

class DiscoverViewController: UIViewController {
    //global variable
    var apiCaller = IGDB_APICaller()
    
    
    //outlets
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var addHomeButton: UIButton!
    
    //actions
    @IBAction func favoriteGame(_ sender: Any) {
    }
    
    @IBAction func addToHome(_ sender: Any) {
    }
    
    @IBAction func testGame(_ sender: Any) {
        Task {
            do {
                let game = try await apiCaller.GetGame(GameID: 1942)
                print("\(game)")
            }
            catch {
                print("\(error)")
            }
        }
    }
    
    func setGame(GameID: Int) async -> Game? {
        var game: Game? = nil
        do {
                game = try await apiCaller.GetGame(GameID: 1942)
                return game
            }
            catch {
                print("\(error)")
            }
        return game
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

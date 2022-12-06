//
//  DiscoverViewController.swift
//  ggTracker
//
//  Created by Kirk Shields on 10/31/22.
//

import UIKit
import IGDB_SWIFT_API
import AlamofireImage
import Parse

class DetailsViewController: UIViewController {
    //global variable
    var apiCaller = IGDB_APICaller()
    
    //instance variables
    private var curGame : Game? = nil
    private var curCover : Cover? = nil
    
    private var deleteGame: PFObject!
    
    //button function vairables
    private var blOnWishlist : Bool = false
    private var blOnHomeScreen : Bool = false
    
    //outlets
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var addHomeButton: UIButton!
    
    
    //segue setter
    public func setGame(_ PassedGame: Game) {
        curGame = PassedGame
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Task.init {
            do {
                if let gameId = curGame?.id {
//                    self.curGame = try await apiCaller.GetGame(gameId)
                    self.curCover = try await apiCaller.GetCover(gameId)
                    
                    //set the title and the description of the box
                    gameTitle.text = curGame?.name
                    gameDescription.text = curGame?.summary
                    
                    //set the image view using alamo fire image
                    let protoUrl = "https:"
                    let coverPath = self.curCover?.url
                    let comUrl = URL(string: protoUrl + (coverPath ?? "error"))
                    coverView.af.setImage(withURL: comUrl!)
                }
                else {
                    print("you are a bafoon")
                }
            }
            catch {
                print("\(error)")
            }
        }
        // Do any additional setup after loading the view.
    }
    
    //Alert
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    //actions

    @IBAction func addToHome(_ sender: Any) {
        let toBeOnHome = !blOnHomeScreen
        if (toBeOnHome) {
            let gameToAdd = PFObject(className: "FavoriteGames")
            gameToAdd["UserID"] = PFUser.current()
            gameToAdd["GameID"] = curGame?.id
            gameToAdd.saveInBackground { (succeeded, error) in
                if (succeeded) {
                    self.showAlert(title: "Success", message: "Successfully added game to Home Screen")
                }
                else {
                    self.showAlert(title: "Error", message: "Error adding game to Home Screen. Please try again later.")
                    print("\(String(describing: error))")
                }
            }
        }
        // Removed becasue delete functionality was added to the home screen -Siobahn
//        else {
//            let query = PFQuery(className: "FavoriteGames")
//            query.includeKeys(["UserID", "GameID"])
//            query.whereKey("GameID", equalTo: curGame?.id)
//            query.limit = 1
//            query.findObjectsInBackground { (game, error) in
//                if (game != nil) {
//                    self.deleteGame = game![0]
//                    self.deleteGame.deleteInBackground()
//                }
//            }
//        }
    }
}

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
    
    //Button Functions
    
    //Change the color on the AddGameToHome button
    func setAddHomeButton(_ isOnHome:Bool) {
        blOnHomeScreen = isOnHome
        if (blOnHomeScreen) {
            addHomeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            addHomeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    
    //actions

    @IBAction func addToHome(_ sender: Any) {
        let toBeOnHome = !blOnHomeScreen
        if (toBeOnHome) {
            //add to DB
            let gameToAdd = PFObject(className: "FavoriteGames")
            gameToAdd["UserID"] = PFUser.current()
            gameToAdd["GameID"] = curGame?.id
            gameToAdd.saveInBackground { (succeeded, error) in
                if (succeeded) {
                    //make the button green
                    self.setAddHomeButton(true)
                }
                else {
                    print("\(error)")
                }
            }
        }
        else {
            //delete from DB
            
            let query = PFQuery(className: "FavoriteGames")
            query.includeKeys(["UserID", "GameID"])
            query.whereKey("GameID", equalTo: curGame?.id)
            query.limit = 1
            query.findObjectsInBackground { (game, error) in
                if (game != nil) {
                    self.deleteGame = game![0]
                    self.deleteGame.deleteInBackground()
                }
            }
        }
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

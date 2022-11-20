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
    
    //instance variables
    private var curGame : Game? = nil
    var blOnWishlist : Bool = false
    var blOnHomeScreen : Bool = false
    
    //outlets
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var addHomeButton: UIButton!
    
 
    
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
        //Task.init {
            //do {
               //self.curGame = try await apiCaller.GetGame(GameID: 1936)
            //} catch {
                
            //}
        //}
                
        // Do any additional setup after loading the view.
    }
    
    //Button Functions
    
    //Change the colors on the WishList button
    func setWishList(_ isWishlist:Bool) {
        blOnWishlist = isWishlist
        if (blOnWishlist) {
            print("in the setWishList function True")
            wishlistButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            print("in the setWishList function False")
            wishlistButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    //Change the color on the AddGameToHome button
    func setAddHomeButton(_ isOnHome:Bool) {
        blOnHomeScreen = isOnHome
        if (blOnHomeScreen) {
            addHomeButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        }
        else {
            addHomeButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    
    
    //actions
    @IBAction func favoriteGame(_ sender: Any) {
        let toBeWishlist = !blOnWishlist
        if (toBeWishlist) {
            print("in the function favoriteGame true")
            self.setWishList(true)
        }
        else {
            print("in the function favoriteGame false")
            self.setWishList(false)
        }
    }
    
    @IBAction func addToHome(_ sender: Any) {
        let toBeOnHome = !blOnHomeScreen
        if (toBeOnHome) {
            self.setAddHomeButton(true)
        }
        else {
            self.setAddHomeButton(false)
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

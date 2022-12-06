//
//  EditViewController.swift
//  ggTracker
//
//  Created by Paulina DeVito on 11/7/22.
//

import UIKit
import IGDB_SWIFT_API
import Parse 
import AlamofireImage




class EditViewController: UIViewController {
    
    //MARK: - Global Variables
    var passedFavoriteGame : PFObject!
    let apiCaller = IGDB_APICaller()
    
    
    //MARK: - Outlets
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var hoursField: UITextField!
    @IBOutlet weak var ratingsField: UITextField!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(passedFavoriteGame["objectId"])")
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        Task.init {
            do {
                //get the cover for the individual game
                let passedFavoriteGameID = passedFavoriteGame["GameID"] as? Int ?? -1
                let cover = try await apiCaller.GetCover(passedFavoriteGameID)
                let protoURL = "https:"
                let coverPath = cover.url
                let comURL = URL(string: protoURL + (coverPath ?? "error"))
                gameImage.af.setImage(withURL: comURL!)
            }
            catch {
                print("\(error)")
            }
        }
        
        
    }
    
    
    
    
    func getDataFromScreen()
    {
        //TODO: Get the data from the pull down button and the table view
    }
    
    
    //Need to pass this a string for status,
    // a int for hours,
    // and a int for rating.
    @IBAction func onUpdateButton(_ sender: Any) {
       
        let query = PFQuery(className:"FavoriteGames")
        let objectID = passedFavoriteGame["objectId"] as? String ?? "error"
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

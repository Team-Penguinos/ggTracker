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
    
    
    //MARK: - Outlets
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var hoursField: UITextField!
    @IBOutlet weak var ratingsField: UITextField!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        //for the status pop up button
        statusButton.changesSelectionAsPrimaryAction = true
        statusButton.showsMenuAsPrimaryAction = true
        let optionsClosure = { (action: UIAction) in
            print(action.title)
        }
        statusButton.menu = UIMenu(children: [
            UIAction(title: "Playing", state: .on, handler: optionsClosure),
            UIAction(title: "Planning", handler: optionsClosure),
            UIAction(title: "Finished", handler: optionsClosure)
        ])
    }
    
    
    
    
    
    
    func getDataFromScreen()
    {
        //TODO: Get the data from the pull down button and the table view
    }
    
    
    //Need to pass this a string for status,
    // a int for hours,
    // and a int for rating.
    func updateGame()
    {
        let query = PFQuery(className:"FavoriteGames")
        let objectID = passedFavoriteGame["objectId"] as? String ?? "error"
        
        query.getObjectInBackground(withId: objectID) {
            (toBeUpdatedFavoriteGame: PFObject?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let tobeUpdatedFavoriteGame = toBeUpdatedFavoriteGame {
                //toBeUpdatedFavoriteGame["Status"] =
                //toBeUpdatedFavoriteGame["Hours"] =
                //toBeUpdatedFavoriteGame["Rating"] =
                //toBeUpdatedFavoriteGame.saveInBackground()
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

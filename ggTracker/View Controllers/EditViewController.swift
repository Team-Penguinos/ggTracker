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
    
    enum UpdateError: String {
        case hoursError = "Error updating hours"
        case statusError = "Error updating status"
        case ratingError = "Error updating rating"
    }
    
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
    
    
    
    
    func getDataFromScreen() {
        //TODO: Get the data from the pull down button and the table view
    }
    
    private func showSuccessAlert() {
        let alert = UIAlertController(title: "Success Updating Data",
                                      message: "The game has been sucessfully updated!",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    private func showFailureAlert() {
        let alert = UIAlertController(title: "Failure Updating Data",
                                      message: "The game did NOT update correctly",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func onUpdateButton(_ sender: Any) {
        let hours = self.hoursField.text
        let status = self.statusField.text
        let rating = self.ratingsField.text
       
        let query = PFQuery(className:"FavoriteGames")
        let objectID = passedFavoriteGame.objectId ?? "error retrieving objectId"

    
        query.includeKeys(["objectId"])
        
        query.getObjectInBackground(withId: objectID) { (parseObject, error) in
            if error != nil {
                self.showFailureAlert()
                print("ERROR: \(String(describing: error))")
            } else if parseObject != nil {
                //update values in parse
                parseObject?["Hours"] = hours ?? UpdateError.hoursError
                parseObject?["Status"] = status ?? UpdateError.statusError
                parseObject?["Rating"] = rating ?? UpdateError.ratingError
                parseObject?.saveInBackground()
                self.showSuccessAlert()
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

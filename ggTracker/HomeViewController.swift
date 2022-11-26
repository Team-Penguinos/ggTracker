//
//  HomeViewController.swift
//  ggTracker
//
//  Created by Paulina DeVito on 10/31/22.
//

import UIKit
import IGDB_SWIFT_API
import Parse
import AlamofireImage




class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    //MARK: - Outlets
    @IBOutlet weak var homeTableView: UITableView!

    //MARK: - Global Variables
    let APICaller = IGDB_APICaller()
    var favoriteGames = [PFObject]()
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"FavoriteGames")
        query.includeKeys(["UserID"])
        query.whereKey("UserID", equalTo:"FmlgFtBQk4")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved (objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    print(object.objectId as Any)
                }
            }
        }
        
//        let query = PFQuery(className:"FavoriteGames")
////        query.includeKeys(["objectId, UserID"]) //we want to fetch the object, not the pointer
//        query.whereKey("UserID", equalTo: "FmlgFtBQk4")
//        query.limit = 50
//
//        query.findObjectsInBackground { (favoriteGames, error) in
//            if favoriteGames != nil {
//                self.favoriteGames = favoriteGames!
//                self.homeTableView.reloadData()
//            } else {
//                print("Error from ViewDidAppear: \(error)")
//            }
//        }
    }

    //MARK: - TableView Stub (Row Number)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteGames.count
    }
    
    
    //MARK: - TableView Stub (Each Row)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        
        //UI design for cells
        cell.layer.borderWidth = 8
        cell.layer.cornerRadius = 16
        cell.layer.borderColor = UIColor(red: 018/255, green: 018/255, blue: 018/255, alpha: 0.65).cgColor
        

        let favoriteGames = favoriteGames[indexPath.row]
        
        if indexPath.row == 0 {
            
            //FIXME: Make a condition to check whether...
            cell.favoriteGameStatus.text = favoriteGames["Status"] as? String
            cell.favoriteGameHours.text = favoriteGames["Hours"] as? String
            cell.favoriteGameRating.text = favoriteGames["Rating"] as? String
            
            let favoriteGameID = favoriteGames["GameID"] as! Int
            //let imageFile = post["image"] as! PFFileObject
//            let urlString = imageFile.url!
//            let url = URL(string: urlString)!
//
//            cell.photoView.af.setImage(withURL: url)
            
            return cell
        }
        
        return cell
    }
    
    //MARK: - Logout Button Action
    @IBAction func onLogout(_ sender: Any) {
        
        PFUser.logOut() //clears the Parse cache
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = loginViewController
    }

    //MARK: - Settings Button Action
    @IBAction func onSettingsButton(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = main.instantiateViewController(withIdentifier: "SettingsViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = settingsViewController
    }

    //MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Get the new view controller using segue.destination.
        //Pass the selected object to the new view controller.
        
        print("Loading up the details screen.")
        
        //Find the selected game.
        let cell = sender as! UITableViewCell //the sender is the cell we clicked
        let indexPath = homeTableView.indexPath(for: cell)!
        let favoriteGame = favoriteGames[indexPath.row] //now we have found the selected cell
        
        //Pass the selected game to the details view controller.
        let editViewController = segue.destination as! EditViewController
        editViewController.favoriteGame = favoriteGames[indexPath.row] //FIXME: Ensure that this works and debug where necessary.
        
        //This unhighlights the cell after you viewed its details and return to the main movies view controller.
        homeTableView.deselectRow(at: indexPath, animated: true)
    }

}

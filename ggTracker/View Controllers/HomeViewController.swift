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
    var apiCaller = IGDB_APICaller()
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        self.homeTableView.reloadData()
    }
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"FavoriteGames")
        query.includeKeys(["objectId, GameID"])
        query.whereKey("objectId", equalTo:"4VmpJS3pZr")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let objects = objects {
                self.favoriteGames = objects
                self.homeTableView.reloadData()
            }
        }
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
        
        let favoriteGame = favoriteGames[indexPath.row]
        let status = favoriteGame["Status"] as? String
        let hours: Int = favoriteGame["Hours"] as? Int ?? -1
        let rating: Int = favoriteGame["Rating"] as? Int ?? -1
        
        cell.favoriteGameStatus.text = favoriteGame["Status"] as? String
        cell.favoriteGameHours.text = String(describing: hours)
        cell.favoriteGameRating.text = String(describing: rating)
        
        Task.init {
            do {
                //get the cover for the individual game
                let favoriteGameID = favoriteGame["GameID"] as? Int ?? -1
                let cover = try await apiCaller.GetCover(favoriteGameID)
                let protoURL = "https:"
                let coverPath = cover.url
                let comURL = URL(string: protoURL + (coverPath ?? "error"))
                cell.favoriteGameImage.af.setImage(withURL: comURL!)
            }
            catch {
                print("\(error)")
            }
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
    
    //MARK: - Navigation
    //FIXME: This isn't working.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Loading up the edit screen.")
        
        //find the selected game
        let cell = sender as! UITableViewCell
        let indexPath = homeTableView.indexPath(for: cell)!
        let favoriteGame = favoriteGames[indexPath.row]
        //pass the selected game to the details view controller
        let editViewController = segue.destination as! EditViewController
        editViewController.passedFavoriteGame = favoriteGames[indexPath.row]
        //deselects the row
        homeTableView.deselectRow(at: indexPath, animated: true)
    }
}

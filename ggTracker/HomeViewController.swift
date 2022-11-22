//
//  HomeViewController.swift
//  ggTracker
//
//  Created by Paulina DeVito on 10/31/22.
//

import UIKit
import IGDB_SWIFT_API
import Parse

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  

    //MARK: - Outlets
    @IBOutlet weak var homeTableView: UITableView!
    
    
    
    //MARK: - Global Variables
    let APICaller = IGDB_APICaller()
    
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        
        
        //self.tableView.reloadData()
    }
    
    
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    //MARK: - TableView Stub (Row Number)
    //These stubs came with the UITableViewDataSource and UITableViewDelegate that were manually added in the "class" line at the start of the file.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        //FIXME: Change this according to the # of cameras we are pulling from Firebase.
    }

    
    
    //MARK: - TableView Stub (Each Row)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell()
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        
        //UI design for cells
        cell.layer.borderWidth = 8
        cell.layer.cornerRadius = 16
        cell.layer.borderColor = UIColor(red: 018/255, green: 018/255, blue: 018/255, alpha: 0.65).cgColor
        
    
        
        //cell.textLabel!.text = "row: \(indexPath.row)"
    
        
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
        
        
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //TODO: Get the new view controller using segue.destination.
        //TODO: Pass the selected object to the new view controller.
        
        print("Loading up the details screen.")
        
        //Find the selected movie.
        let cell = sender as! UITableViewCell //the sender is the cell we clicked
        let indexPath = homeTableView.indexPath(for: cell)!
        let userGame = movies[indexPath.row] //FIXME: Make this work
        //^now we have found the selected cell
        
        //Pass the selected movie to the details view controller.
        let editViewController = segue.destination as! EditViewController
        EditViewController.movie = movie //FIXME: Make this work
        
        //This unhighlights the cell after you viewed its details and return to the main movies view controller.
        homeTableView.deselectRow(at: indexPath, animated: true)

    }

}

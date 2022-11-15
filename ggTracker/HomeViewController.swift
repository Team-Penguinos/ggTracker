//
//  HomeViewController.swift
//  ggTracker
//
//  Created by Paulina DeVito on 10/31/22.
//

import UIKit
import IGDB_SWIFT_API

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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

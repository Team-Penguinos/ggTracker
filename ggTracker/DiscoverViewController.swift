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
    
    
    
    //outlets
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var addHomeButton: UIButton!
    
    //actions
    @IBAction func favoriteGame(_ sender: Any) {
    }
    
    @IBAction func addToHome(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func LoadGame() async {
        do {
            
        }
        catch {
            
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

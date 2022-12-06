//
//  AboutViewController.swift
//  ggTracker
//
//  Created by Paulina DeVito on 12/5/22.
//

import UIKit
import IGDB_SWIFT_API
import Parse
import AlamofireImage

class AboutViewController: UIViewController {

    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: - On Logout Button
    @IBAction func onLogoutButton(_ sender: Any) {
        
        PFUser.logOut() //clears the Parse cache

        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }

        delegate.window?.rootViewController = loginViewController
    }
    
}

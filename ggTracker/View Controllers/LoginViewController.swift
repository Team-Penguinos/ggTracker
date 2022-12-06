//
//  LoginViewController.swift
//  ggTracker
//
//  Created by Siobahn Devlin on 11/21/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Minimize Keyboard after Typing
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Alerts for Fail and Success Case on Login
    private func showFailureAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }

    //MARK: - Sign In
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("Success logging in")
            } else {
                self.showFailureAlert(title: "Incorrect Username or Password", message: "You did not the correct username or password.")
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    //MARK: - Sign Out
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("Success signing up")
            } else {
                self.showFailureAlert(title: "Failure Creating Account", message: "Please try creating an account later.")
                print("Error: \(String(describing: error?.localizedDescription))")
            }
            
        }
    }

}

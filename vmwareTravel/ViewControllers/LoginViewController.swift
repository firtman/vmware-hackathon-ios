//
//  ViewController.swift
//  vmwareTravel
//
//

import UIKit

class LoginViewController: UIViewController {

    // Outlets, views in the current screen
    @IBOutlet var textUsername: UITextField!
    @IBOutlet var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // We load login data in case we have it
        textUsername.text = UserDefaults.standard.value(forKey: "username") as? String ?? ""
        textPassword.text = UserDefaults.standard.value(forKey: "password") as? String ?? ""
    }

    @IBAction func login(_ sender: Any) {
        let username = textUsername.text!
        let password = textPassword.text!
        let api = LoginAPI()
        
        api.login(user: username, password: password) { (isValid) in
            if (isValid) {
                // We go to View Controller
                performSegue(withIdentifier: "goHome", sender: self)
                
                // We save the data for next login
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set(password, forKey: "password")
                
            } else {
                let alert = UIAlertController(title: "Log In Error", message: "Your credentials are invalid", preferredStyle: .alert)
                alert.addAction( UIAlertAction(title: "Ok", style: .cancel) )
                present(alert, animated: true)
            }
        }
    }
    
    @IBAction func forgotCredentials(_ sender: Any) {
        let alert = UIAlertController(title: "Forgot Credentials", message: "Call Customer Support to reset your credentials", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel) )

        present(alert, animated: true)
    }
    
    @IBAction func backTap(_ sender: Any) {
        // Removes the keyboard when the background is pressed
        // Calling resignFirstResponder to the current textField makes the trick
        textUsername.resignFirstResponder()
        textPassword.resignFirstResponder()
    }
}


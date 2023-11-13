//
//  LoginViewController.swift
//  AtlasFitnessApp
//
//  Created by Alim Gönül on 3.11.2023.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var meailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logInButton(_ sender: Any) {
        if meailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: meailText.text!, password: passwordText.text!) { authdata, error in
                
                if error != nil{
                    self.makeAlert(titleInput:"Error", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "tabbarVC", sender: nil)
                }
            }
        }else {
            makeAlert(titleInput: "Error", messageInput: "Mail-Password?")
        }
    }
    func makeAlert(titleInput: String , messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}

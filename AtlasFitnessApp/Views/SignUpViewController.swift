//
//  SignUpViewController.swift
//  AtlasFitnessApp
//
//  Created by Alim Gönül on 5.11.2023.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        print("title")
        if nameText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: mailText.text!, password: passwordText.text!) { authData, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "kaydolduVc", sender: nil)
                }
            }
        }else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
        
    }
    func makeAlert(titleInput: String , messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

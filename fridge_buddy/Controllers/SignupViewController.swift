//
//  SignupViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/18.
//

import UIKit
import Firebase

class SignupViewController: LoginViewController {
   
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func singUpPressed(_ sender: UIButton) {
        if let email = emailTxtField.text, let password = passwordTxtField.text{
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error{
//                I can handle with the error - popup or something like this
                print(e.localizedDescription)
            } else{
//                Navigate to Homepage displaying all the list
                self.performSegue(withIdentifier: "SignUpToHomePage", sender: self)
            }
        }
     }
    }
    

}

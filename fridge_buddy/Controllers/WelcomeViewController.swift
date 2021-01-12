//
//  ViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/11.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var signupRounded: UIButton!
    @IBOutlet weak var loginRounded: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signupRounded.layer.cornerRadius = 10
        loginRounded.layer.cornerRadius = 10
    }

    @IBAction func signUpPressed(_ sender: UIButton) {
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
    }
}


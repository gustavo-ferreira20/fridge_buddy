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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
        //Removing Back text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
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


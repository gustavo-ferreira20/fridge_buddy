//
//  LoginViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/12.
//

import UIKit

class LoginViewController: UIViewController {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 39, height: 39))
    let image = UIImage(named: "logo-text-1.png")
    let background = UIImage(named: "Mango.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "FridgeBuddy"
        
        // Adding a Image in the Navigation Bar
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
        
        // Adding a background image to the Nav bar
        navigationController?.navigationBar.setBackgroundImage(background, for: .default)
        
    }
}

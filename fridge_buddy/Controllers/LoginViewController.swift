//
//  LoginViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/12.
//

import UIKit
import Firebase
import NotificationBannerSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let image = UIImage(named: "logo-text-1.png")
   // let background = UIImage(named: "Mango.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "FridgeBuddy"
        
        // Adding a Image in the Navigation Bar
            addImageNavBar(image: image!)

        // Adding a background image to the Nav bar
      //navigationController?.addBackground(imageName: "Mango.png")
          addBackgroundNavBar(imageName: "Mango.png")
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text{
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error{
//                I can display the error to the user - popup, warning...
                //            Showing a banner notification
                let banner = StatusBarNotificationBanner(title: "Incorrect! Enter the correct Email and/or Password.", style: .warning, colors: nil)
                    banner.show()
                print(e)
            } else{
                self.performSegue(withIdentifier: "LoginToHomepage", sender: self)
            }
          
        }
     }
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
    }
    
    // adding a image logo in the nav bar
    func addImageNavBar(image: UIImage){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 39, height: 39))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
    }

    //adding background image to nav bar
    func addBackgroundNavBar(imageName: String)  {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: imageName)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .default)
        
        //Fix Navbar Bartint color issue in iOS 15.0 or later - is transparent w/o code below
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundImage = UIImage(named: imageName)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch)
            
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
    }
    
}

//extension UINavigationController{
//    // adding a image logo in the nav bar
//    func addImageNavBar(image: UIImage){
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 39, height: 39))
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = image
//        navigationItem.titleView = imageView
//    }
//
//    //adding background image to nav bar
//    func addBackgroundNavBar(imageName: String)  {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: imageName)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .default)
//    }
//}


//extension UINavigationController {
//    func addBackground(imageName: String = "YOUR DEFAULT IMAGE NAME") {
//        // setup the UIImageView
//        let bgImage = UIImage(named: imageName)
//
//
//        let logoImageView = UIImageView(image: bgImage)
//        logoImageView.contentMode = .scaleAspectFill
//        logoImageView.clipsToBounds = true
//        logoImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        navigationBar.addSubview(logoImageView)
//        navigationBar.sendSubviewToBack(logoImageView)
//        navigationBar.backgroundImage(for: .default)
//       // navigationBar.insertSubview(logoImageView, belowSubview: navigationBar)
//
//          NSLayoutConstraint.activate([
//            logoImageView.leftAnchor.constraint(equalTo: navigationBar.leftAnchor),
//            logoImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor),
//            logoImageView.topAnchor.constraint(equalTo: navigationBar.topAnchor),
//            logoImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor)
//          ])
//
//    }
//}

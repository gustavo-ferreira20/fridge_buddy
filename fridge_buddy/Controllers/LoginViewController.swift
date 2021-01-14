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
   // let background = UIImage(named: "Mango.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "FridgeBuddy"
        
        // Adding a Image in the Navigation Bar
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
        
        // Adding a background image to the Nav bar
      //navigationController?.addBackground(imageName: "Mango.png")
       addBackgroundNavBar(imageName: "Mango.png")
        
    }
    
    
    //adding background image to nav bar
    func addBackgroundNavBar(imageName: String)  {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: imageName)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .default)
    }
    
}


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

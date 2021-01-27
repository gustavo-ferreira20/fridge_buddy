//
//  MenuController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/21.
//


import UIKit

enum MenuType: Int {
    case list
    case favorites
    case history
    case logOut
}

class MenuController: UITableViewController{
    
    var didTapMenuType: ((MenuType) -> Void)?
    
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
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else{return}

        dismiss(animated: true){ [weak self] in
            print("Dismissing \(menuType)")
            self?.didTapMenuType?(menuType)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

   
}



//
//  HomepageController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/20.
//

import UIKit

class HomepageController: UITableViewController {
    
    @IBOutlet weak var findRecipeButton: UIButton!
    let transition = SlideInTrasition()
    var topView: UIView?

   
    let ingredientArray = ["Rice", "Beans", "Salmon", "Fish", "Tomato"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        //Displaying Toolbar if array >= 0
        lengthOfList(animated: animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setToolbarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        title = "Food in my Fridge"
        navigationItem.hidesBackButton = true

        
    }
    

    @IBAction func findRecipepressed(_ sender: UIButton) {
        //Search for recipe in the API
    }
    
    @IBAction func didTapMenuButton(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuController else{return}
        menuViewController.didTapMenuType = {
            menuType in print(menuType)
                self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)

    }
    
    // Checking how many ingredients in the list
    func lengthOfList(animated: Bool){
        self.navigationController?.toolbar.barTintColor = UIColor.orange
        
        if ingredientArray.count <= 0{
            self.navigationController?.setToolbarHidden(true, animated: animated)
        } else{
            self.navigationController?.setToolbarHidden(false, animated: animated)
        }
    }
    
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    func transitionToNew(_ menuType: MenuType){
        //topView?.removeFromSuperview()
        switch menuType {
        case .favorites:
           // print("favorites")
            performSegue(withIdentifier: "ShowFavorites", sender: nil)
        case .history:
           // print("history")
            performSegue(withIdentifier: "showHistory", sender: nil)
        case .logOut:
            // do something to logout
            print("logging out...")
        default:
            break
        }
          // I can add a child view controller to change the content
        
    }
    

    
    //MARK - Tableview Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        cell.textLabel?.text = ingredientArray[indexPath.row]
        
        return cell
    }
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(ingredientArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}



extension HomepageController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}


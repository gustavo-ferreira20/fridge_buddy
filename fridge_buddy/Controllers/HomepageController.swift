//
//  HomepageController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/20.
//

import UIKit
import RealmSwift

class HomepageController: UITableViewController {
    let realm = try! Realm()
    
    
    @IBOutlet weak var findRecipeButton: UIButton!
    let transition = SlideInTrasition()
    var topView: UIView?

    
    var ingredients = [Ingredients]()
    
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
   
    //Preparing segue to delegate the View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddItemViewController {
            addVC.delegate = self
        }
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
        
        if ingredients.count <= 0{
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
        return ingredients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        cell.textLabel?.text = ingredients[indexPath.row].name
        cell.detailTextLabel?.text = ingredients[indexPath.row].quantity + " "  + ingredients[indexPath.row].measure
        
        
        return cell
    }
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(ingredients[indexPath.row])
        
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

extension HomepageController: AddIngredientDelegate{
    func addIngredient(ing: Ingredients) {
        self.dismiss(animated: true) {
            try! self.realm.write{
                self.realm.add(ing)
                print(Realm.Configuration.defaultConfiguration.fileURL)
            }
            self.ingredients.append(ing)
            self.tableView.reloadData()
            //Displaying Toolbar if array >= 0
            self.lengthOfList(animated: true)
        }
    }
}


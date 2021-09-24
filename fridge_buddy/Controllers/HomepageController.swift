//
//  HomepageController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/1/20.
//

import UIKit
import RealmSwift
import NotificationBannerSwift


class HomepageController: UITableViewController {
    

    var ingredientsApiString = ""
    
    let realm = try! Realm()
    
    var myIndex = 0
    

    var recipeAPImanager = RecipeAPIManager()
    
    @IBOutlet weak var findRecipeButton: UIButton!
    let transition = SlideInTrasition()
    var topView: UIView?

    
//    var ingredients = [Ingredients]()
    var ingredients: Results<Ingredients>?
    
    
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
        
        // updating tableview with ingredients from Realm DB
        loadIngredients()
        
    }
   
    //Preparing segue to delegate the View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddItemViewController {
            addVC.delegate = self
        }
        // passing data from homepage controller to editVC
        if(segue.identifier == "editSegue"){
            let editVC = segue.destination as! EditViewController
            editVC.ingName = ingredients?[myIndex].name
            editVC.ingDesc = ingredients?[myIndex].quantity
            editVC.ingMeas = ingredients?[myIndex].measure
            
            editVC.delegate = self
        }
        if(segue.identifier == "showRecipesList"){
            // Search for recipe in the API here
            joinIngStrings()

        }
       
    }
    
    

    @IBAction func didPressFindRecipe(_ sender: Any) {
        // Search for recipe in the API here
//        joinIngStrings()
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
//        self.navigationController?.toolbar.backgroundColor = UIColor.orange
        
        
        //Fix Toolbar Bartint color issue in iOS 15.0 or later - is transparent w/o code below
        if #available(iOS 15, *) {
            let appearance = UIToolbarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.orange

            self.navigationController?.toolbar.standardAppearance = appearance
            self.navigationController?.toolbar.scrollEdgeAppearance = navigationController?.toolbar.standardAppearance
        }
        
        if ingredients!.count <= 0{
            self.navigationController?.setToolbarHidden(true, animated: animated)
        } else{
            self.navigationController?.setToolbarHidden(false, animated: animated)
        }
    }
    
    // Loading itens from Realm DB
    
    func loadIngredients() {
        ingredients = realm.objects(Ingredients.self)
        
        tableView.reloadData()
    }
    
    // Retriving all ingredients from Realm DB and joining String
    func joinIngStrings(){
        var arrayIngredientStrings = [String]()
//        Looping in the Results Array to get all ingredients names
        for n in 0..<(ingredients?.count ?? -1-1){

            let ingName = ingredients![n].name.replacingOccurrences(of: " ", with: "-")
            arrayIngredientStrings.append(ingName)
            
        }

        ingredientsApiString = arrayIngredientStrings.joined(separator: ",+").lowercased()
        print(ingredientsApiString)
       recipeAPImanager.fetchRecipes(ingredientsName: ingredientsApiString)
//        I'm interested in the ID, Title and Image
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
        return ingredients?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        cell.textLabel?.text = ingredients?[indexPath.row].name ?? " No Ingredients added yet"
        cell.detailTextLabel?.text = ingredients![indexPath.row].quantity  + " "  + ingredients![indexPath.row].measure
        

        
        
        return cell
    }
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        Obtain all cell info by clicking here
        print(ingredients![indexPath.row])
        print(ingredients![indexPath.row].name)

        myIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "editSegue", sender: self)
        
        
//        let editIng = Ingredients(name: (ingredients?[indexPath.row].name)!, quantity: (ingredients?[indexPath.row].quantity)!, measure: (ingredients?[indexPath.row].measure)!)
//        print(editIng)

        
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
//                print(Realm.Configuration.defaultConfiguration.fileURL)
            }
//            self.ingredients.append(ing)
            self.tableView.reloadData()
            //Displaying Toolbar if array >= 0
            self.lengthOfList(animated: true)
        }
    }
}


extension HomepageController: UpdatingIngredientDelegate{
  // DELETING INGREDIENT
    func deletingIngredient() {
        if let ingredientItem = self.ingredients?[self.myIndex]{
            do{
                try self.realm.write{
//                    to delete an item
                    realm.delete(ingredientItem)
                }
            } catch{
                print("error on updating....")
            }
//            Showing a banner notification
            let banner = StatusBarNotificationBanner(title: "The ingredient is not in your Fridge anymore!", style: .success, colors: nil)
            banner.show()
//            Uploading tableview
            self.tableView.reloadData()
        }
    }
    
//   UPDATING INGREDIENT
    func updatingIngredient(ing: Ingredients) {
        
        
        if let ingredientItem = self.ingredients?[self.myIndex]{
            do{
                try self.realm.write{
//                    to delete an item
//                    realm.delete(ingredientItem)
                    ingredientItem.name = ing.name
                    ingredientItem.quantity = ing.quantity
                    ingredientItem.measure = ing.measure
                }
            } catch{
                print("error on updating....")
            }
            self.tableView.reloadData()
        }
               
            
    }

    
}


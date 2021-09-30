//
//  SingleIngredientViewController.swift
//  fridge_buddy
//
//  Created by Gustavo rodrigues on 2021/9/28.
//

import UIKit

class SingleRecipeViewController: UIViewController {
    let recipeApiManager = RecipeAPIManager()
    
    // URL of the Ingredient clicked in the Cell
    var singleIngURL = ""
    
    
    //IBOulets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
//    @IBOutlet weak var summaryLabel: UITextView!
//    @IBOutlet weak var instructionLabel: UITextView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
//    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeApiManager.performRequestForSingleRecipe(urlString: singleIngURL){
            DispatchQueue.main.async {
                self.didUpdateRecipe()
            }
        }
        print("Single Ingredient URL: \(singleIngURL)")
        // Do any additional setup after loading the view.
    }


 
    func didUpdateRecipe(){
        self.titleLabel.text = self.recipeApiManager.recipe?.title
        if let stringServing = self.recipeApiManager.recipe?.servings{
            self.servingsLabel.text = "\(String(describing: stringServing))"
        }
        
//        Dispalying HTML data in Strings
        self.summaryLabel.text = self.recipeApiManager.recipe?.summary.html2String
        self.instructionLabel.text = self.recipeApiManager.recipe?.instructions.html2String
//        self.instructionLabel.text = "\(String(describing: self.recipeApiManager.recipe?.instructions))" --> can be an option
//        Displaying the Image
        guard let url = URL(string: recipeApiManager.recipe?.image ?? "") else {return}
        do{
           let data = try Data(contentsOf: url)
            self.recipeImage.image = UIImage(data: data)
            recipeImage.contentMode = .scaleAspectFit
        }catch{
            print("No Image")
        }
    }
    

}


//Converting HTML format text to String

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
    

}



extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}

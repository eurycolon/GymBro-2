//
//  PopupVC.swift
//  GymBro
//
//  Created by Eury Colon on 4/9/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit


protocol AddRowDelegate {
    func didAddRow(name : String, calories : String, section: Int)
}




class PopupVC: UIViewController {
    
    var delegate: AddRowDelegate?
    var section: Int?
    
    
 
 
    @IBOutlet weak var foodTimeLabel: UILabel!
    @IBOutlet weak var foodPopup2: UIView!
    @IBOutlet weak var foodPopUp: UIView!
    @IBOutlet weak var inputFood: UITextField!
    @IBOutlet weak var inputCals: UITextField!
    
    @IBAction func saveToDiary(_ sender: Any) {
     
        if (inputFood.text?.isEmpty)! || (inputCals.text?.isEmpty)! {
            
            let alert = UIAlertController(title: "Input Value", message: "Please input values in both textfields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
            self.present(alert, animated: true, completion: nil)
            
            
            return
        }
        
      
        
        delegate?.didAddRow(name: inputFood.text!, calories: inputCals.text!, section: section!)

        
        dismiss(animated: true, completion: nil)

        
        
    
        
        
    }
    var foodLabel: String?
    
    @IBAction func dismissPopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        foodTimeLabel.text = foodLabel
        
        
        foodPopUp.layer.cornerRadius = 10
        foodPopUp.layer.masksToBounds = true
        foodPopup2.layer.cornerRadius = 10
        foodPopup2.layer.masksToBounds = true
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        

        
        
        
        
               
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

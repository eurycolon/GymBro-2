//
//  WeightLossPopUp.swift
//  GymBro
//
//  Created by Eury Colon on 5/11/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit
import RealmSwift

protocol AddWeight {
    func didAddWeight (weight: String, days: [String])
}



class WeightLossPopUp: UIViewController {
    @IBOutlet weak var layer1: UIView!

    @IBOutlet weak var layer2: UIView!
    
    let days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var delegate: AddWeight?
    
    
    
 
    @IBOutlet weak var weightField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        layer1.layer.cornerRadius = 10
        layer1.layer.masksToBounds = true
        layer2.layer.cornerRadius = 10
        layer2.layer.masksToBounds = true
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func dismissWeight(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func saveWeight(_ sender: Any) {
        
        
        if (weightField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Input Weight is Empty", message: "Please input a valid weight in the textfield", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        delegate?.didAddWeight(weight: weightField.text!, days: days)
        dismiss(animated: true, completion: nil)
        
        
}

  
    




}

//
//  CalorieViewController.swift
//  GymBro
//
//  Created by eury colon on 3/30/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit
/*
class CalorieViewController: UIViewController {
    @IBOutlet weak var protein: UILabel!
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "firstVC") as! ViewController
        self.present(firstVC, animated: true, completion: nil)
        
        
    }
    @IBOutlet weak var fats: UILabel!
    @IBOutlet weak var totalCalories: UILabel!
    @IBOutlet weak var deficitCalories: UILabel!
   
    @IBOutlet weak var carbs: UILabel!
    
    
    
    
    let firstVC = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
      
        
        view.addGestureRecognizer(tap)
    }
    
  
    func dismissKeyboard() {
        view.endEditing(true)
        
    }
    
    

    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var physicalActivity: UITextField!
    
    @IBAction func dailyCalories(_ sender: Any) {
        dismissKeyboard()
        
        
        if (weight.text?.isEmpty)! || (physicalActivity.text?.isEmpty)! {
            let alert = UIAlertController(title: "Missing Field", message: "Please input values to both fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
            self.present(alert, animated: true, completion: nil)
            return
        
        
        }
        if physicalActivity.text! > String(17) || physicalActivity.text! < String(14)  {
            let alerttwo = UIAlertController(title: "Physical Activity Error", message: "Please pick a number between 14 and 17", preferredStyle: .alert)
            alerttwo.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alerttwo, animated: true, completion: nil)

            return
        }
        
        
        
        calculateDailyCalories()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func calculateDailyCalories () {
        let weightCalories = Double(weight.text!)
        let pActivity = Double(physicalActivity.text!)
        
        
        
            
        let totalCals = (weightCalories)! * (pActivity)!
        totalCalories.text = "Daily Calories:" + " " + String(totalCals)
        protein.text = "Protein:" + " " + String(totalCals * 0.04)
        fats.text = "Fats:" + " " + String(totalCals * 0.02)
        carbs.text = "Carbs:" + " " +  String(totalCals * 0.04 )
        deficitCalories.text = "Deficit Calories:" + " " + String(totalCals - 500)
      
        }
    
    

    
    
    }
    
  */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    
    
    
    
    
    
    


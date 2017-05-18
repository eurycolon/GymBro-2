//
//  MainExercises.swift
//  GymBro
//
//  Created by Eury Colon on 4/7/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit

class MainExercises: UITableViewController {
    
    
  
    
    let bodyParts2 = ["name": "Chest", "image": #imageLiteral(resourceName: "Chest")] as [String: Any]
    let bodyParts3 = ["name": "Back", "image": #imageLiteral(resourceName: "Back")] as [String: Any]
    let bodyParts4 = ["name": "Legs", "image": #imageLiteral(resourceName: "Legs")] as [String: Any]
    let bodyParts5 = ["name": "Arms", "image": #imageLiteral(resourceName: "Arms")] as [String: Any]
    let bodyparts6 = ["name": "Abs", "image": #imageLiteral(resourceName: "Abs")] as [String: Any]
    let bodyparts7 = ["name": "Shoulders", "image": #imageLiteral(resourceName: "Shoulders")] as [String: Any]
    let bodyparts8 = ["name": "Show all exercises"] as [String: Any]
 
    
    var allBodyParts = [[String:Any]]()
    

    
    
    
    

  
    override func viewDidLoad() {
        super.viewDidLoad()

        allBodyParts = [bodyParts2,bodyParts3,bodyParts4,bodyParts5,bodyparts6, bodyparts7,bodyparts8]
        
     
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "specificExercises" {
            let animatationVC = segue.destination as! ExerciseViewController
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
              
                
                if selectedIndexPath.row == 0 {
                    let inclineBenchDic = ["name": "Incline Bench Press", "animations": ChestExercise().inclineBench] as [String: Any]
                    
                    let flatbenchDic = ["name": "Flat Bench Press", "animations": ChestExercise().flatBench] as [String: Any]
                    animatationVC.legExercise = ChestExercise().inclineBench
                    animatationVC.exerciseList = [inclineBenchDic, flatbenchDic]
                    
             }
                if selectedIndexPath.item == 1 {
                    let pullupDic = ["name": "Pullups", "animations": BackExercises().pullups] as [String: Any]
                    let invertedRowDic = ["name": "Inverted Rows", "animations": BackExercises().invertedRows] as [String: Any]
                    let dbRowDic = ["name": "Dumbbell Rows", "animations": BackExercises().dbRows] as [String: Any]
                    animatationVC.legExercise = BackExercises().pullups
                    animatationVC.exerciseList = [pullupDic, invertedRowDic, dbRowDic]
                    
                    
                    
                    animatationVC.exerciseList = [pullupDic, invertedRowDic, dbRowDic]
                }
                
                if selectedIndexPath.row == 2 {
                    let squatDictionary = ["name" : "Squat" , "animations" : LegExercises().squatAnimations] as [String : Any]
                    let jSquatDic = ["name" : "Jump Squat", "animations" : LegExercises().jumpSquatAnimations] as [String : Any]
                    let lunges = ["name": "Side-to-Side Squats", "animations": LegExercises().lunges] as [String: Any]
                    let stiffLunges = ["name": "Stiff Leg Lunges", "animations" : LegExercises().stiffLunges] as [String : Any]
                    let stepUps = ["name": "Step-Ups", "animations": LegExercises().stepUps] as [String : Any]
                    
                    
                    animatationVC.legExercise = LegExercises().squatAnimations
                    animatationVC.exerciseList = [squatDictionary, jSquatDic, lunges, stiffLunges, stepUps]
                }
                
                if selectedIndexPath.row == 3 {
                    let hammerCurlDict = ["name":"HammerCurls", "animations": ArmExercise().hammerCurls ] as [String: Any]
                    let tricepPressdownDict = ["name": "Tricep Pressdown", "animations": ArmExercise().tricepPressdown] as [String: Any]
                    
                    
                   animatationVC.legExercise = ArmExercise().hammerCurls
                    
                    animatationVC.exerciseList = [hammerCurlDict, tricepPressdownDict]
                  
                    
                }
                if selectedIndexPath.row == 4 {
                    let bicycleDir = ["name": "Bicycle Kicks", "animations": AbsExercise().bicycleKicks] as [String: Any]
                    let sitUpDir = ["name": "Overhead Situps", "animations": AbsExercise().sitUps] as [String: Any]
                    let slrdir = ["name": "Hanging Straight Leg Raise", "animations": AbsExercise().slr] as [String:Any]
                    let hBicyclesDir = ["name": "Hanging Bicycle Kicks", "animations": AbsExercise().hangingBicycles] as [String:Any]
                    
                    animatationVC.legExercise = AbsExercise().sitUps
                    animatationVC.exerciseList = [ bicycleDir, sitUpDir, slrdir, hBicyclesDir]
                    
                    
                }
                if selectedIndexPath.row == 5 {
                    let shoulderPressDict = ["name": "Shoulder Press", "animations": Shoulders().shoulderPress] as [String: Any]
                    animatationVC.legExercise = Shoulders().shoulderPress
                    animatationVC.exerciseList = [shoulderPressDict]
                    
                    
                    
                }
            }
                    
                }
            }
            
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBodyParts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseCell
      
        cell.imageView?.image = allBodyParts[indexPath.row]["image"] as? UIImage
        cell.textLabel?.text = allBodyParts[indexPath.row]["name"] as? String
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     performSegue(withIdentifier: "specificExercises", sender: self)
    
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

//
//  AnimationVC.swift
//  GymBro
//
//  Created by eury colon on 3/15/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit
import AVFoundation



class AnimationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var valueToPass: String?
    
    
    @IBOutlet weak var exerciseInfo: UILabel!
    @IBOutlet weak var ExerciseTableView: UITableView!
    var Squats = [#imageLiteral(resourceName: "Squat 1"),#imageLiteral(resourceName: "Squat 2"),#imageLiteral(resourceName: "Squat 3"),#imageLiteral(resourceName: "Squat 4"),#imageLiteral(resourceName: "Squat 5")]
    var legExercise: ExerciseData?
    
    var exerciseList = [[String : Any]]()
    
    @IBOutlet weak var animations: UIImageView!
    
    //@IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
       
    }
    


    
    
    
  
    
  
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = exerciseList[indexPath.row]["name"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseList.count
    }
    
 
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            animations.animationImages = exerciseList[indexPath.row]["animations"] as? [UIImage]
            animations.animationDuration = 1
            animations.startAnimating()
        
     
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        valueToPass = currentCell.textLabel?.text
      
    }
      
      
    
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    
    
    func Animate (animator: [UIImage]) {
        
       
        
        
      
        animations.animationImages = animator
        animations.animationDuration = 0.9
        animations.startAnimating()
        
    }
    
    
    
    
    
    
    
}




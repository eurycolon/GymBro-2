//
//  ProgramsCollectionViewController.swift
//  GymBro
//
//  Created by Eury Colon on 4/10/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit



class ProgramsCollectionViewController: UICollectionViewController {
    var programs = [[String: Any]]()

   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let beginnerPrograms = ["name":"Beginner Programs", "image": #imageLiteral(resourceName: "Arms"), "info": "Workout routines tailored for newcomers who want to workout hard and learn the fundamentals"] as [String: Any]
        let intermediatePrograms = ["name":"Intermediate Programs", "image": #imageLiteral(resourceName: "Back"), "info": "Workout routines tailored for the tough individuals with some experience"] as [String: Any]
        let advancedPrograms = ["name":"Advanced Programs", "image": #imageLiteral(resourceName: "Chest"), "info": "Workout routines tailored for the strong individuals with a good amount of experience"] as [String: Any]
        programs = [beginnerPrograms, intermediatePrograms,advancedPrograms]
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? ProgramsCollectionViewCell
    
        cell?.programLabel.text = programs[indexPath.item]["name"] as? String
        cell?.programImage.image = programs[indexPath.item]["image"] as? UIImage
        cell?.descriptionLabel.text = programs[indexPath.item]["info"] as? String
        
        
    
        // Configure the cell
    
        return cell!
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "routineView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "routineView" {
            
        
        
        let selectedIndexPath = collectionView?.indexPathsForSelectedItems?.first
       let routineAnimations = segue.destination as! Routines
        
        if selectedIndexPath?.item == 0 {
            
            let beginnerRoutines = ["Chest and Shoulders", "Back and Bicep", "Legs", "Abs"]
          
            routineAnimations.routineExerciseData = beginnerRoutines
            let chestAndShoulders = [ChestExercise().flatBench, ChestExercise().inclineBench, ChestExercise().pushUp, Shoulders().shoulderPress]
            let backAndBicep = [BackExercises().dbRows, BackExercises().invertedRows, BackExercises().pullups, ArmExercise().hammerCurls]
            let legs = [LegExercises().jumpSquatAnimations, LegExercises().lunges, LegExercises().squatAnimations, LegExercises().stepUps, LegExercises().stiffLunges]
            let abs = [AbsExercise().bicycleKicks, AbsExercise().hangingBicycles, AbsExercise().sitUps, AbsExercise().slr]
            routineAnimations.testImg = [chestAndShoulders, backAndBicep, legs, abs]
        
        
        }
        
        if selectedIndexPath?.item == 1 {
            
            let intermediateRoutines = ["Legs and Abs", "Chest and Back", "Shoulders and Arms"]
            routineAnimations.routineExerciseData = intermediateRoutines
             let legsandAbs = [LegExercises().jumpSquatAnimations,LegExercises().stiffLunges,AbsExercise().hangingBicycles,AbsExercise().plank]
            let chestAndBack = [ChestExercise().flatBench, ChestExercise().inclineBench, BackExercises().dbRows, BackExercises().pullups, BackExercises().invertedRows]
            let shouldersAndArms = [Shoulders().shoulderPress, ArmExercise().hammerCurls, ArmExercise().tricepPressdown]
            
            routineAnimations.testImg = [legsandAbs, chestAndBack, shouldersAndArms]
            
            }
        
        if selectedIndexPath?.item == 2 {
            
            let advancedRoutines = ["Back, Shoulders, Arms", "Chest and Abs", "Legs and Back", "Chest and Shoulders"]
            routineAnimations.routineExerciseData = advancedRoutines
            let backShouldersArms = [BackExercises().pullups, BackExercises().dbRows, Shoulders().shoulderPress, ArmExercise().hammerCurls, ArmExercise().tricepPressdown]
            let chestAndAbs = [ChestExercise().flatBench, ChestExercise().inclineBench, AbsExercise().bicycleKicks, AbsExercise().hangingBicycles, AbsExercise().slr]
            let legsAndBack = [LegExercises().stepUps, LegExercises().lunges, LegExercises().jumpSquatAnimations, BackExercises().dbRows, BackExercises().invertedRows, BackExercises().pullups]
            let chestAndShoulders = [ChestExercise().flatBench, ChestExercise().inclineBench, Shoulders().shoulderPress]
            routineAnimations.testImg = [backShouldersArms, chestAndAbs, legsAndBack, chestAndShoulders]
            
            
        }
        
        
        }
    }
    
    
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

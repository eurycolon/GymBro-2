//
//  Routines.swift
//  GymBro
//
//  Created by Eury Colon on 4/16/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit
import RealmSwift

class Routines: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    var routineExerciseData = [String]()
    
    
    
    var testImages = [[UIImage]]()
    var testImg = [[[UIImage]]]()
    
    var testDictionary = ["name": "Chest/Shoulders", "animations":ChestExercise().inclineBench] as [String : Any]
    

    
  
    
    
    @IBOutlet weak var routineList: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        testImages = testImg[0]
        
        routineList.delegate = self
        routineList.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = false
       

   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return routineExerciseData.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.row == 0 {
            
            testImages = testImg[0]
          
            collectionView.reloadData()
            
        }
        if indexPath.row == 1 {
            testImages = testImg[1]
            collectionView.reloadData()
        }
        
        if indexPath.row == 2 {
            
            testImages = testImg[2]
                
            collectionView.reloadData()
        }
        
        if indexPath.row == 3 {
          
            testImages = testImg[3]
            collectionView.reloadData()
            
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath) as! RoutineListCell
        cell.textLabel?.text = routineExerciseData[indexPath.row]
        return cell
     
        
        // Configure the cell...

        
        }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testImages.count
    }


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! RoutineAnimationsCollectionViewCell
        cell.image.animationImages = testImages[indexPath.item]
        cell.image.animationDuration = 1.0
        cell.image.startAnimating()
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
    }

    

    

    
}
    
    


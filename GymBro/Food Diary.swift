//
//  Food Diary.swift
//  GymBro
//
//  Created by Eury Colon on 4/8/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit
import RealmSwift

struct FoodItem {
    var name: String
    var calories: String
}

class FoodDiary: UITableViewController, AddRowDelegate {
    @IBOutlet weak var dateLabel: UINavigationItem!

    var calsArray = 0
    var tableData1 = [FoodItem]()
    var tableData2 = [FoodItem]()
    var tableData3 = [FoodItem]()
    var tableData4 = [FoodItem]()

    var calsLabel = [" "]
    var nameLabel = [" "]
    var calsLabel1 = [" "]
    var nameLabel1 = [" "]
    var calsLabel2 = [" "]
    var nameLabel2 = [" "]
    var calsLabel3 = [" "]
    var nameLabel3 = [" "]
    
    @IBOutlet weak var calsforToday: UILabel!
    
   
    let foodTimes = ["Add Breakfast","Add Lunch","Add Dinner","Add Snacks"]
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "calories") as? Int {
            calsforToday.text = "Calories for Today:" + " " + String(x)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.mm.yyyy"
        let result = formatter.string(from: date)
        
        
        dateLabel.title = "Current Date:" + " " + result
        let foodItem = FoodItem(name: "pepsi", calories: "300")
        tableData1.append(foodItem)
        tableData2.append(foodItem)
        tableData3.append(foodItem)
        tableData4.append(foodItem)
     
        
 
        
            self.tableView.backgroundColor = UIColor.white
            self.tableView.tableHeaderView?.backgroundColor = UIColor.white

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let view = UIView()
        view.backgroundColor = UIColor(red:0.00, green:0.88, blue:1.00, alpha:1.0)
        
      
        
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 5, width: 120, height: 35)
        label.text = foodTimes[section]
        view.addSubview(label)
        
        
        
        return view
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
  
        if section == 0 {
            return (tableData1.count)
        }
        if section == 1 {
            return tableData2.count
        }
        if section == 2 {
            return tableData3.count
        
        } else {
        
            return tableData4.count
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "diaryEntry" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow?.first{
            let popVC = segue.destination as! PopupVC
                popVC.delegate = self
                
                
                if selectedIndexPath == 0 {
                    let label = "Add Breakfast"
                    popVC.foodLabel = label
                    popVC.section = 0
                    
                    
                    
                    }
                if selectedIndexPath == 1{
                    let label = "Add Lunch"
                    popVC.foodLabel = label
                    popVC.section = 1
                    
                }
                if selectedIndexPath == 2 {
                    let label = "Add Dinner"
                    popVC.foodLabel = label
                    popVC.section = 2
                    
                }
                if selectedIndexPath == 3{
                    let label = "Add Snacks"
                    popVC.foodLabel = label
                    popVC.section = 3
                    
                }
             
            }
        }
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        if indexPath.row == 0 {
        performSegue(withIdentifier: "diaryEntry", sender: self)
        }
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FoodDiaryCell
            cell.foodLabel.text = foodTimes[indexPath.section]
            return cell
        }
   
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ExpandCell
        
   
            cell.nameOfLabel.text = "Name:" + " " + nameLabel[indexPath.row]
            cell.calories.text = "Calories:" + " " + calsLabel[indexPath.row]
        
        
        
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! ExpandCell
            
            
            cell.nameOfLabel.text = "Name:" + " " + nameLabel1[indexPath.row]
            cell.calories.text = "Calories:" + " " + calsLabel1[indexPath.row]
            
            
            
            return cell
        }
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! ExpandCell
            
            
            cell.nameOfLabel.text = "Name:" + " " + nameLabel2[indexPath.row]
            cell.calories.text = "Calories:" + " " + calsLabel2[indexPath.row]
            
            
            
            return cell
        } else {
      
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! ExpandCell
            
            
            cell.nameOfLabel.text = "Name:" + " " + nameLabel3[indexPath.row]
            cell.calories.text = "Calories:" + " " + calsLabel3[indexPath.row]
            
            
            
            return cell
        }
}
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   
            let height = 44
            return CGFloat(height)
            
        
    }

    
    func didAddRow(name: String, calories: String, section: Int) {
        
        
        let newItem = FoodItem(name: name, calories: calories)
        
        if section == 0 {
            calsLabel.append(calories)
            nameLabel.append(name)
            tableData1.append(newItem)
            let indexPath = IndexPath(row: tableData1.count - 1, section: section)
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            
        }
        
        if section == 1 {
            calsLabel1.append(calories)
            nameLabel1.append(name)
            tableData2.append(newItem)
            tableView.reloadData()
            
        }
        
        if section == 2 {
            calsLabel2.append(calories)
            nameLabel2.append(name)
            tableData3.append(newItem)
            tableView.reloadData()
            
        }
        
        if section == 3 {
            calsLabel3.append(calories)
            nameLabel3.append(name)
            tableData4.append(newItem)
            tableView.reloadData()
            
        }
      
        tableView.reloadData()
        
        let newCals = Int(calories)
        
        calsArray += newCals!
        
        let defaults = UserDefaults.standard
        defaults.set(calsArray, forKey: "calories")
        
        calsforToday.text = "Calories for Today:" + " " + String(calsArray)
       
        
    
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == .delete {
           
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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

}

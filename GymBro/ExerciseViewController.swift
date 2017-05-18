//
//  ExerciseViewController.swift
//  GymBro
//
//  Created by Eury Colon on 4/12/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var legExercise = [UIImage]()
    var exerciseList = [[String: Any]]()
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet weak var image: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        Animate(animator: legExercise)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
      
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
        cell.textLabel?.text = exerciseList[indexPath.row]["name"] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseList.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        image.animationImages = exerciseList[indexPath.row]["animations"] as? [UIImage]
        image.animationDuration = 1
        image.startAnimating()

    }
    func Animate (animator: [UIImage]) {
        image.animationImages = animator
        image.animationDuration = 0.9
        image.startAnimating()
        
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

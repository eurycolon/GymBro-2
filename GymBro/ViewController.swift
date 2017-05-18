//
//  ViewController.swift
//  GymBro
//
//  Created by eury colon on 3/7/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate {

    
  
  
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
  
      
        
    
        
        navigationController?.delegate = self
    }
 
    
    
        // Do any additional setup after loading the view, typically from a nib.
    

    

    
    

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Exercise(_ sender: UIButton) {
    }
    
    @IBAction func CalorieTracker(_ sender: UIButton) {
    
    
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animations = Transitions()
        if fromVC is AnimationVC {
        animations.transitionMode = .Present

        }
        
        return animations
    }
    
}

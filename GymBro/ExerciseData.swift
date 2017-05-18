//
//  ExerciseData.swift
//  GymBro
//
//  Created by eury colon on 3/15/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit


class ExerciseData {
    
    var bodyPartCV: UIImage
    var bodyPartName: String
    var animations: [UIImage]
    
    init(bodyPartCV: UIImage, bodyPartName: String, animations: [UIImage]) {
        self.bodyPartCV = bodyPartCV
        self.bodyPartName = bodyPartName
        self.animations = animations
      
    }
    
    
    
}

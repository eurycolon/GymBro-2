//
//  LineChartData.swift
//  GymBro
//
//  Created by Eury Colon on 5/11/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import Foundation
import RealmSwift


class ChartData: Object {
    
    dynamic var weight: Int = 0
    
 
   
    
    
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    
    
}

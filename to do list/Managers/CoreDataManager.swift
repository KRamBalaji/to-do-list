//
//  CoreDataManager.swift
//  to do list
//
//  Created by Ram Balaji Koppula on 08/09/22.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistanceContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init(){
        
        persistanceContainer = NSPersistentContainer(name: "SampleToDoModel")
        persistanceContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialise CoreData\(error)")
            }
        }
        
    }
    
}

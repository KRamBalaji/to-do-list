//
//  to_do_listApp.swift
//  to do list
//
//  Created by Ram Balaji Koppula on 07/09/22.
//

import SwiftUI

@main
struct to_do_listApp: App {
    
    let persistanceContainer = CoreDataManager.shared.persistanceContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistanceContainer.viewContext)
        }
    }
}

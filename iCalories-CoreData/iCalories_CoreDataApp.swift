//
//  iCalories_CoreDataApp.swift
//  iCalories-CoreData
//
//  Created by Mert Urhan on 9.03.2023.
//

import SwiftUI

@main
struct iCalories_CoreDataApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
        }
    }
}

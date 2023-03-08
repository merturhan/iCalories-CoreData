//
//  DataController.swift
//  iCalories-CoreData
//
//  Created by Mert Urhan on 9.03.2023.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    
    let container = NSPersistentContainer(name: "Food")
    
    init() {
        container.loadPersistentStores {desc, error in
            if let error = error{
                print("Failed to load data \(error.localizedDescription)")
            }
                
        }
    }
    
    func save(context : NSManagedObjectContext){
        
        do{
            
            try context.save()
            print("Data saved")
        }catch{
            print("Couldn't save the data")
        }
        
    }
    
    func addFood(name : String, calories : Double, context : NSManagedObjectContext){
        
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    
    func editFoot(food : Food, name : String, calories : Double, context : NSManagedObjectContext){
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    
}
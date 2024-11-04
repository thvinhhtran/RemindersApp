//
//  Untitled.swift
//  RemindersApp
//
//  Created by Vinh on 2/11/24.
//
import Foundation
import CoreData

class CoreDataProvider {
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer
    private init() {
        //register transformers
        ValueTransformer.setValueTransformer(UIColorTransformers(), forName: NSValueTransformerName("UIColorTransformer"))
    
        persistentContainer = NSPersistentContainer(name:"RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Error initializing RemindersModel\(error)")
            }
        }
    }
}

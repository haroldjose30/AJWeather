//
//  PersistenceController.swift
//  AJWeatherApp
//
//  Created by Jose Harold on 15/03/2023.
//

import Foundation
import CoreData

public struct CoreDataPersistenceDataBase {
    
    private let persistentModelName = "AJWeatherModel"
    private let persistentModelExtension = ".xcdatamodeld"
    
    public static let shared = CoreDataPersistenceDataBase()
    
    public let container: NSPersistentCloudKitContainer
    
    private init(
        ///to use an in-memory store.
        inMemory: Bool = false
    ) {
        //Load database from AJData.Framework
        let bundle = Bundle(for: AJDataBundle.self)
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [bundle])!
        container = NSPersistentCloudKitContainer(
            name: persistentModelName,
            managedObjectModel: managedObjectModel
        )
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    public func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
}

// MARK: - for SwiftUI previews

extension CoreDataPersistenceDataBase {
    
    // A test configuration for SwiftUI previews
    public static var preview: CoreDataPersistenceDataBase = {
        
        let result = CoreDataPersistenceDataBase(inMemory: true)
        
        let viewContext = result.container.viewContext
        
        // Create 10 example of register for preview
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}


public final class AJDataBundle {
    private init() { }
    // marker class
}


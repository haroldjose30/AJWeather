//
//  CoreDataManager.swift
//  AJData
//
//  Created by Jose Harold on 15/03/2023.
//

import Foundation
import CoreData

public struct CoreDataManager: DataBaseManagerType {
    
    //TODO: Verify another wat to avoid singletons
    private static var _shared: CoreDataManager?
    public static func getInstance(
        inMemory: Bool = false
    ) -> CoreDataManager {
        
        if let instance = _shared {
            return instance
        }
        
        let instance = CoreDataManager(
            inMemory: inMemory
        )
        _shared = instance
        return instance
    }
    
    private let persistentModelName = "AJWeatherModel"
    private let persistentModelExtension = ".xcdatamodeld"
    public private(set) var container: NSPersistentCloudKitContainer
    private var isAutoSaveContextEnabled: Bool = true
    
    init(
        ///to use an in-memory store.
        inMemory: Bool = false
    ) {
        //Load database from AJData.Framework
        let bundle = Bundle(for: AJDataBundleMarker.self)
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
}

// MARK: - for SwiftUI previews

extension CoreDataManager {
    
    // A test configuration for SwiftUI previews
    public static var preview: CoreDataManager = {
        
        let result = CoreDataManager(inMemory: true)
        
        let viewContext = result.container.viewContext
        
        // Create 10 example of register for preview
        for _ in 0..<10 {
            let newItem = ItemCoreDataEntity(context: viewContext)
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

// MARK: - DataBaseEngineType

extension CoreDataManager {
    
    public func initialize() {
        CoreDataManager.getInstance().saveContext(forceSave: true)
    }
    
    public func saveContext(
        forceSave: Bool? = nil
    ) {
        guard isAutoSaveContextEnabled || forceSave ?? false else {
            print("CoreData","context NOT saved")
            return
        }
        
        let context = CoreDataManager.getInstance().container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
                CoreDataManager._shared?.isAutoSaveContextEnabled = true
                print("CoreData","context SAVED, automatic save context enabled")
            } catch let error {
                //TODO: Show some error here
                print("CoreDataManager","Error:",error)
            }
        }
    }
    
    public func rollback() {
       
        let context = CoreDataManager.getInstance().container.viewContext
        
        if context.hasChanges {
            context.rollback()
        }
        
        CoreDataManager._shared?.isAutoSaveContextEnabled = true
    }
    
    
    
    public func dispose() {
        CoreDataManager._shared = nil
    }
    
    public func setAutomaticSaveContext(
        _ activate: Bool
    ) {
        CoreDataManager._shared?.isAutoSaveContextEnabled = activate
    }
}


public final class AJDataBundleMarker {
    private init() { }
    // marker class for bundle locator, this is necessary to locate Datamodel file outer main bundler
}


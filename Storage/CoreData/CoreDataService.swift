//
//  CoreDataService.swift
//  Storage
//
//  Created by Vadim on 4.02.24.
//

import CoreData

final class CoreDataService {
    
    typealias CompletionHandler = ((Bool) -> Void)
    static var shared: CoreDataService = .init()
    private init() {}
    
    lazy var mainContext: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    var backgroundContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }

    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NotificationDataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveMainContext(completion: CompletionHandler? = nil) {
        saveContext(context: mainContext, completion: completion)
    }
    
    func saveContext(context: NSManagedObjectContext,
                     completion: CompletionHandler? = nil) {
        if context.hasChanges {
            do {
                try context.save()
                completion?(true)
            } catch {
                let nserror = error as NSError
                completion?(false)
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}


//
//  CoreDataService.swift
//  Storage
//
//  Created by Vadim on 2.03.24.
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
        let modelName = "NotificationDataBase"
        let bundle = Bundle(for: CoreDataService.self)
        
        guard
            let modelURL = bundle.url(forResource: modelName,
                                      withExtension: "momd"),
            let manageObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        else { fatalError("unable to find model in bundle") }
        
        let container = NSPersistentContainer(name: modelName,
                                              managedObjectModel: manageObjectModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    

//    private var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "NotificationDataBase")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
    
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

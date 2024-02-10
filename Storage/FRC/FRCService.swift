//
//  FRCService.swift
//  Storage
//
//  Created by Vadim on 10.02.24.
//

import Foundation
import CoreData

public final class FRCService<DTO: DTODescription>: NSObject,
    NSFetchedResultsControllerDelegate {
    
    public var didChangeContent: (([DTO]) -> Void)?
    
    private let request: NSFetchRequest<DTO.MO> = {
        return NSFetchRequest<DTO.MO>(entityName: "\(DTO.MO.self)")
    }()
    
    private lazy var rfc: NSFetchedResultsController<DTO.MO> = {
        let frc = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: CoreDataService.shared.mainContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        frc.delegate = self
        
        try? frc.performFetch()
        
        return frc
    }()
    
    init(predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]) {
        self.request.predicate = predicate
        self.request.sortDescriptors = sortDescriptors
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        try? controller.performFetch()
        let dtos = rfc.fetchedObjects?.compactMap { DTO(mo: $0) }
        didChangeContent?(dtos ?? [])
    }
    
}

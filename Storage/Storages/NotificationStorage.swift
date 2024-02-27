//
//  NotificationStorage.swift
//  Storage
//
//  Created by Vadim on 9.02.24.
//

import Foundation
import CoreData

public class NotificationStorage<DTO: DTODescription> {
        typealias CompletionHandler = (Bool) -> Void
        public init() {}
    
        //Fetch
    public func fetch(predicate: NSPredicate? = nil,
                      sortDescriptors: [NSSortDescriptor] = [] ) -> [any DTODescription] {
        return fetchMO(predicate: predicate,
                       sortDescriptors: sortDescriptors)
        .compactMap{ $0.toDTO() }
    }
    
    private func fetchMO(
        predicate: NSPredicate? = nil,
        sortDescriptors: [NSSortDescriptor] = [] ) -> [DTO.MO] {
            let request = NSFetchRequest<DTO.MO>(entityName: "\(DTO.MO.self)")
            let context = CoreDataService.shared.mainContext
            let results = try? context.fetch(request)
            return results ?? []
        }
    
}


//

//    public func fetch(predicate: NSPredicate? = nil,
//                      sortDescriptors: [NSSortDescriptor] = []
//    ) -> [DateNotificationDTO] {
//        return fetchMO(predicate: predicate,
//                     sortDescriptors: sortDescriptors)
//        .compactMap{ DateNotificationDTO(mo: $0) }
//    }
//
//    private func fetchMO(
//        predicate: NSPredicate? = nil,
//        sortDescriptors: [NSSortDescriptor] = []
//    ) -> [DateNotificationMO] {
//        let request: NSFetchRequest<DateNotificationMO> = DateNotificationMO.fetchRequest()
//        let context = CoreDataService.shared.mainContext
//        let results = try? context.fetch(request)
//
//        return results ?? []
//    }
//
//    //Create
//    func create(dto: DateNotificationDTO,
//                completion: CompletionHandler? = nil) {
//        let context = CoreDataService.shared.mainContext
//        context.perform {
//            let mo = DateNotificationMO(context: context)
//            mo.apply(dto: dto)
//
//            CoreDataService.shared.saveMainContext(completion: completion)
//        }
//    }
//
//    func update(dto: DateNotificationDTO,
//                completion: CompletionHandler? = nil) {
//        let context = CoreDataService.shared.mainContext
//
//        context.perform { [weak self] in
//            guard
//                let mo = self?.fetchMO(
//                    predicate: .Notification.notification(byId: dto.id)
//                ).first
//            else { return }
//            mo.apply(dto: dto)
//
//            CoreDataService.shared.saveMainContext(completion: completion)
//        }
//    }
//
//    func updateOrCreate(
//        dto: DateNotificationDTO,
//        completion: CompletionHandler? = nil) {
//            if fetchMO(predicate: .Notification.notification(byId: dto.id)).isEmpty {
//                create(dto: dto, completion: completion)
//            } else {
//                update(dto: dto, completion: completion)
//            }
//        }
//
//}

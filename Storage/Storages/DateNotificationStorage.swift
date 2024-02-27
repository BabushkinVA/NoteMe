//
//  DateNotificationStorage.swift
//  Storage
//
//  Created by Vadim on 4.02.24.
//

import CoreData

public final class DateNotificationStorage:
NotificationStorage<DateNotificationDTO> {
    
    public func fetch(
        predicate: NSPredicate? = nil,
        sortDescriptors: [NSSortDescriptor] = []
    ) -> [DateNotificationDTO] {
            return super.fetch(
            predicate: predicate,
            sortDescriptors: sortDescriptors
            ).compactMap { $0 as? DateNotificationDTO }
    }
    
}


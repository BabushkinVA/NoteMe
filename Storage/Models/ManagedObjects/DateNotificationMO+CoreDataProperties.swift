//
//  DateNotificationMO+CoreDataProperties.swift
//  Storage
//
//  Created by Vadim on 1.03.24.
//
//

import Foundation
import CoreData


extension DateNotificationMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DateNotificationMO> {
        return NSFetchRequest<DateNotificationMO>(entityName: "DateNotificationMO")
    }

    @NSManaged public var targetDate: Date?

}

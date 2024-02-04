//
//  DateNotificationMO+CoreDataClass.swift
//  Storage
//
//  Created by Vadim on 3.02.24.
//
//

import Foundation
import CoreData

@objc(DateNotificationMO)
class DateNotificationMO: BaseNotificationMO {
    func apply(dto: DateNotificationDTO) {
        self.identifier = dto.id
        self.date = dto.date
        self.title = dto.title
        self.subtitle = dto.subtitle
        self.completedDate = dto.completedDate
        self.targetDate = dto.targetDate
    }
}

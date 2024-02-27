//
//  BaseNotificationDTO.swift
//  Storage
//
//  Created by Vadim on 13.02.24.
//

import Foundation

public struct BaseNotificationDTO: DTODescription {
    public typealias MO = BaseNotificationMO
    
    public var id: String
    public var date: Date
    public var title: String
    public var subtitle: String?
    public var completedDate: Date?
    
    public init(date: Date,
                id: String = UUID().uuidString,
                title: String,
                subtitle: String? = nil,
                completedDate: Date? = nil) {
        self.date = date
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.completedDate = completedDate
    }
    
    public static func fromMO(_ mo: MO) -> BaseNotificationDTO? {
        guard
            let id = mo.identifier,
            let title = mo.title,
            let date = mo.date
        else { return nil }
        
        return BaseNotificationDTO(date: date,
                                   id:id,
                                   title: title,
                                   subtitle: mo.subtitle,
                                   completedDate: mo.completedDate)
    }
}

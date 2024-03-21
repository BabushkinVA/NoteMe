//
//  BaseNotificationDTO.swift
//  Storage
//
//  Created by Vadim on 9.03.24.
//

import Foundation

public struct BaseNotificationDTO: DTODescription {
    public typealias MO = BaseNotificationMO
    
    public var id: String
    public var date: Date
    public var title: String
    public var subtitle: String?
    public var completedDate: Date?
    
    public init(id: String = UUID().uuidString,
                date: Date,
                title: String,
                subtitle: String? = nil,
                completedDate: Date? = nil) {
        self.id = id
        self.date = date
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
        
        return BaseNotificationDTO(id: id,
                                   date: date,
                                   title: title,
                                   subtitle: mo.subtitle,
                                   completedDate: mo.completedDate)
    }
    
}

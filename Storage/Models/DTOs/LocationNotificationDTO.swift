//
//  LocationNotificationDTO.swift
//  Storage
//
//  Created by Vadim on 3.03.24.
//

import Foundation
import CoreData

public struct LocationNotificationDTO: DTODescription {
    public typealias MO = LocationNotificationMO
    
    public var date: Date
    public var id: String
    public var title: String
    public var subtitle: String?
    public var completedDate: Date?
    public var longitude: Double
    public var latitude: Double
    public var imagePath: String

    
    init(date: Date, 
         id: String = UUID().uuidString,
         title: String,
         subtitle: String? = nil,
         completedDate: Date? = nil,
         longitude: Double,
         latitude: Double,
         imagePath: String) {
        self.date = date
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.completedDate = completedDate
        self.longitude = longitude
        self.latitude = latitude
        self.imagePath = imagePath
    }
    
    public static func fromMO(_ mo: LocationNotificationMO) -> LocationNotificationDTO? {
        guard
            let date = mo.date,
            let id = mo.identifier,
            let title = mo.title,
            let imagePath = mo.imagePath
        else { return nil }
        
        return LocationNotificationDTO(date: date,
                                       id: id,
                                       title: title,
                                       subtitle: mo.subtitle,
                                       completedDate: mo.completedDate,
                                       longitude: mo.longitude,
                                       latitude: mo.latitude,
                                       imagePath: imagePath)
    }
    
}

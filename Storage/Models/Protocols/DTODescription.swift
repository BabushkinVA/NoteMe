//
//  DTODescription.swift
//  Storage
//
//  Created by Vadim on 9.02.24.
//

import Foundation
import CoreData

public protocol DTODescription {
    associatedtype DTO
    associatedtype MO: NSManagedObject, NSFetchRequestResult
    
    init?(mo: MO)
}

//
//  NSSortDescriptor+Const.swift
//  Storage
//
//  Created by Vadim on 20.02.24.
//

import CoreData
import Foundation

public extension NSSortDescriptor {
    
    enum Notification {
        public static var byDate: NSSortDescriptor {
            let dateKeypath = #keyPath(BaseNotificationMO.date)
            return .init(key: dateKeypath, ascending: false)
        }
    }
    
}


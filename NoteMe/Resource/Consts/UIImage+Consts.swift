//
//  UIImage+Consts.swift
//  NoteMe
//
//  Created by Vadim on 14.02.24.
//

import UIKit

extension UIImage {
    
    //MARK: - General
    enum General {
        static let logo: UIImage = .init(named: "logo")!
    }
    
    //MARK: - Onboarding
    enum Onboarding {
        static let onboard: UIImage = .init(named: "onboard")!
    }
    
    //MARK: - TabBarController
    enum TabBar {
        static let home: UIImage = .init(named: "home")!
        static let profile: UIImage = .init(named: "profile")!
        static let plus: UIImage = .init(named: "plus")!
    }
    
    //MARK: - ProfileVC
    enum Profile {
        static let notifications: UIImage = .init(named: "notifications")!
        static let export: UIImage = .init(named: "export")!
        static let logout: UIImage = .init(named: "logout")!
        static let point: UIImage = .init(named: "point")!
    }
    
    //MARK: - PopoverVC
    enum Popover {
        static let calendar: UIImage = .init(named: "calendar")!
        static let location: UIImage = .init(named: "location")!
        static let timer: UIImage = .init(named: "timer")!
        static let edit: UIImage = .init(named: "edit")!
        static let delete: UIImage = .init(named: "delete")!
    }
    
    //MARK: - HomeVC
    enum Home {
        static let timer: UIImage = .init(named: "homeTimer")!
    }
    
    //MARK: - LocationVC
    enum Location {
        static let region: UIImage = .init(named: "region")!
    }
}

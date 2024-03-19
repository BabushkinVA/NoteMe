//
//  UIImage+Consts.swift
//  NoteMe
//
//  Created by Vadim on 24.10.23.
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
    }
    
    enum MenuAction {

    }
    
}

//
//  AlertVC.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class AlertVC: UIAlertController {
    
    weak var window: UIWindow?
    
//    func show() {
//        window?.rootViewController = self
//        window?.makeKeyAndVisible()
//    }
    
    func hide() {
        window?.resignKey()
    }
    
}

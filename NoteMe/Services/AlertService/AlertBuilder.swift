////
////  AlertBuilder.swift
////  NoteMe
////
////  Created by Vadim on 6.12.23.
////
//
//import UIKit
//
//final class AlertBuilder {
//    
//    typealias AlertActionHandler = () -> Void
//    
//    private static var alertWindow: UIWindow?
//    
//    static func build(title: String?,
//                      message: String?,
//                      cancelTitle: String? = nil,
//                      cancelHandler: AlertActionHandler? = nil,
//                      okTitle: String? = nil,
//                      okHandler: AlertActionHandler? = nil) -> AlertVC {
//        
//        let alertVC = AlertVC(title: title,
//                                        message: message,
//                                        preferredStyle: .alert)
//        Self.alertWindow = buildAlertWindow()
//        alertVC.window = Self.alertWindow
//        
//        if let cancelTitle {
//            let action = UIAlertAction(title: cancelTitle,
//                                       style: .cancel) { _ in
//                cancelHandler?()
//                alertVC.hide()
//                Self.alertWindow = nil
//            }
//            alertVC.addAction(action)
//        }
//        
//        if let okTitle {
//            let action = UIAlertAction(title: okTitle,
//                                       style: .default) { _ in
//                okHandler?()
//                alertVC.hide()
//            }
//            alertVC.addAction(action)
//        }
//        
//        return alertVC
//    }
//    
//    private static func buildAlertWindow() -> UIWindow? {
//        guard
//            let scene = AppCoordinator.windowScene
//        else { return nil }
//        
//        let window = UIWindow(windowScene: scene)
//        window.windowLevel = .alert
//        return window
//    }
//    
//}

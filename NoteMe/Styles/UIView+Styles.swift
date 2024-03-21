//
//  UIView+Styles.swift
//  NoteMe
//
//  Created by Vadim on 16.02.24.
//

import UIKit

extension UIView {
    
    static func infoViewStyle() -> UIView {
        let view = UIView()
        view.cornerRadius = 5.0
        view.backgroundColor = .white
        
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        view.layer.shadowRadius = 4.0
        view.layer.shadowColor = UIColor.appShadow.cgColor
        
        return view
    }
    
    static func contentViewStyle() -> UIView {
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }
    
}

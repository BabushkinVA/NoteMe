//
//  UIView+Styles.swift
//  NoteMe
//
//  Created by Vadim on 4.11.23.
//

import UIKit

extension UIView {
    
    static func shadowStyle() -> UIView {
        let view = UIView()
        view.cornerRadius = 5
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

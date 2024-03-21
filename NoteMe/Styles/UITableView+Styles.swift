//
//  UITableView+Styles.swift
//  NoteMe
//
//  Created by Vadim on 1.03.24.
//

import UIKit

extension UITableView {
    
    func tableViewShadow() {
        self.subviews.forEach { view in
            view.layer.masksToBounds = false
            view.layer.shadowOpacity = 1
            view.layer.shadowRadius = 4
            view.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
            view.layer.shadowColor = UIColor.appShadow.cgColor
        }
    }
    
}

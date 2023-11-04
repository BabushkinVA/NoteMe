//
//  UILabel+Styles.swift
//  NoteMe
//
//  Created by Vadim on 4.11.23.
//

import UIKit

extension UILabel {
    
    static func mainLabelStyle(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = "\(title)"
        label.textColor = .appText
        label.font = .appBoldFont.withSize(25.0)
        label.textAlignment = .center

        return label
    }
    
}

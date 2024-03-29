//
//  UILabel+Styles.swift
//  NoteMe
//
//  Created by Vadim on 16.02.24.
//

import UIKit

extension UILabel {
    
    static func titleLabelStyle(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = "\(title)"
        label.textColor = .appText
        label.font = .appBoldFont.withSize(25.0)
        label.textAlignment = .center
        return label
    }
    
    static func infoLabelStyle(_ text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "\(text)"
        label.numberOfLines = 0
        label.font = .appFont.withSize(13.0)
        label.textColor = .appText
        label.attributedText = .parse(html: text, font: .appFont.withSize(13.0))
        label.numberOfLines = .zero
        return label
    }
    
    static func onboardSelectionImageLabelStyle(_ text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "\(text)"
        label.font = .appFont.withSize(16.0)
        label.textColor = .appText
        return label
    }
    
    static func notificatioLabelStyle(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = "\(title)"
        label.textColor = .appText
        label.font = .appBoldFont.withSize(17.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }
    
}

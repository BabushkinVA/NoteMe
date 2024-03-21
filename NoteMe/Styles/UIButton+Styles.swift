//
//  UIButton+Styles.swift
//  NoteMe
//
//  Created by Vadim on 15.02.24.
//

import UIKit

extension UIButton {
    
    static func yellowRoundedButton(_ title: String?) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .appYellow
        button.cornerRadius = 5.0
        button.setTitle(title, for: .normal)
        button.setTitleColor(.appText, for: .normal)
        button.setTitleColor(.appText.withAlphaComponent(0.75),
                             for: .highlighted)
        button.titleLabel?.font = .appBoldFont.withSize(17.0)
        return button
    }
    
    static func cancelButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .clear
        button.cornerRadius = 5.0
        button.setBorder(width: 1.0, color: .appYellow)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.appYellow, for: .normal)
        button.setTitleColor(.appYellow.withAlphaComponent(0.75),
                             for: .highlighted)
        button.titleLabel?.font = .appBoldFont.withSize(17.0)
        return button
    }
    
    static func underlineYellowButton(_ title: String) -> UIButton {
        return underlineButton(
            title,
            color: .appYellow,
            font: .appBoldFont.withSize(17.0))
    }
    
    static func underlineGrayButton(_ title: String) -> UIButton {
        return underlineButton(
            title,
            color: .appGrayText,
            font: .appBoldFont.withSize(15.0))
    }
    
    static func underlineButton(_ title: String,
                                color: UIColor,
                                font: UIFont) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .clear
        
        let normalAttr: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: color
        ]
        
        let highlightedAttr: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color.withAlphaComponent(0.75),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: color.withAlphaComponent(0.75)
        ]
        
        button.setAttributedTitle(
            .init(string: title, attributes: normalAttr), for: .normal)
        button.setAttributedTitle(
            .init(string: title, attributes: highlightedAttr), for: .highlighted)
        
        return button
    }
    
}

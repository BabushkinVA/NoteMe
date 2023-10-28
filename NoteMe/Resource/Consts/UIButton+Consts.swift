//
//  UIButton+Consts.swift
//  NoteMe
//
//  Created by Vadim on 28.10.23.
//

import UIKit

extension UIButton {
    
    func buttonMainStyle(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .appBoldFont
        self.layer.cornerRadius = 5.0
        self.backgroundColor = .appYellow
    }
    
    func buttonSecondaryStyle(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.appYellow, for: .normal)
        self.titleLabel?.font = .appBoldFont
        self.layer.cornerRadius = 5.0
        self.backgroundColor = .clear
        self.layer.borderWidth = 1.0
        self.layer.borderColor = CGColor.init(
            red: 255 / 255,
            green: 232 / 255,
            blue: 26 / 255,
            alpha: 1)
    }
    
    func buttonUnderlineStyle() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            .underlineStyle: NSUnderlineStyle.single.rawValue],
            range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
}

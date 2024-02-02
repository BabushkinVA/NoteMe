//
//  ProfileAccountCell.swift
//  NoteMe
//
//  Created by Vadim on 2.02.24.
//

import UIKit
import SnapKit

final class ProfileAccountCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appGrayText
        label.font = .appFont.withSize(15.0)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appText
        label.font = .appFont.withSize(17.0)
        label.textAlignment = .left
        return label
    }()
    
    func setup(_ email: String) {
        emailLabel.text = email
    }
    
}

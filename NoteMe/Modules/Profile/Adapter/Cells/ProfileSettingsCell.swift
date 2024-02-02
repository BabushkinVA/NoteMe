//
//  ProfileSettingsCell.swift
//  NoteMe
//
//  Created by Vadim on 1.02.24.
//

import UIKit
import SnapKit

final class ProfileSettingsCell: UITableViewCell {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .appFont.withSize(14.0)
        label.textColor = .appText
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = .appFont.withSize(14.0)
        label.textColor = .appGrayText
        return label
    }()
 
    func setup(_ type: ProfileSettingsRows) {
        titleLabel.text = type.title
        titleLabel.textColor = type == .logout ? .appRed : .appText
        iconImageView.image = type.icon
        infoLabel.text = type.infoText
    }
}

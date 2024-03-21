//
//  ProfileSettingsCell.swift
//  NoteMe
//
//  Created by Vadim on 29.02.24.
//

import UIKit
import SnapKit

final class ProfileSettingsCell: UITableViewCell {
    
    private enum L10n {
        static let notifications: String = "profile_notifications".localized
        static let export: String = "profile_export".localized
        static let logout: String = "profile_logout".localized
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont.withSize(14.0)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont.withSize(12.0)
        label.textColor = .appGrayText
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.layer.masksToBounds = false
//        self.layer.shadowOpacity = 1
//        self.layer.shadowRadius = 4
//        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
//        self.layer.shadowColor = UIColor.green.cgColor
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(infoLabel)
    }
    
    func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(16.0)
            make.left.equalToSuperview().inset(16.0)
            make.verticalEdges.equalToSuperview().inset(12.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).inset(-8.0)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16.0)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
    }
    
    func setup(_ type: ProfileSettingsRows) {
        titleLabel.text = type.title
        titleLabel.textColor = type == .logout ? .appRed : .appText
        iconImageView.image = type.icon
        infoLabel.text = type.infoText
        
    }
    
}


//final class ProfileSettingsCell: UITableViewCell {
//    
//    private enum L10n {
//        static let notifications: String = "profile_notifications".localized
//        static let export: String = "profile_export".localized
//        static let logout: String = "profile_logout".localized
//    }
//    
//    private lazy var iconImageView: UIImageView = UIImageView()
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = .appFont.withSize(14.0)
//        label.textAlignment = .left
//        return label
//    }()
//    
//    private lazy var infoLabel: UILabel = {
//        let label = UILabel()
//        label.font = .appFont.withSize(12.0)
//        label.textColor = .appGrayText
//        label.textAlignment = .left
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func commonInit() {
//        setupUI()
//        setupConstraints()
//        //        setup(ProfileSettingsRows)
//    }
//    
//    func setupUI() {
//        addSubview(iconImageView)
//        addSubview(titleLabel)
//        addSubview(infoLabel)
//    }
//    
//    func setupConstraints() {
//        iconImageView.snp.makeConstraints { make in
//            make.width.equalTo(16.0)
//            make.height.equalTo(17.5)
//            make.top.left.equalToSuperview().inset(16.0)
//        }
//        
//        titleLabel.snp.makeConstraints { make in
//            make.left.equalTo(iconImageView.snp.right).inset(8.0)
//            make.centerY.equalTo(iconImageView.snp.centerY)
//        }
//        
//        infoLabel.snp.makeConstraints { make in
//            make.right.equalToSuperview().inset(-16.0)
//            make.centerY.equalTo(iconImageView.snp.centerY)
//        }
//    }
//    
//    func setup(_ type: ProfileSettingsRows) {
//        titleLabel.text = type.title
//        titleLabel.textColor = type == .logout ? .appRed : .appText
//        iconImageView.image = type.icon
//        infoLabel.text = type.infoText
//        
//    }
//    
//}

//
//  ProfileSettingsCell.swift
//  NoteMe
//
//  Created by Vadim on 29.02.24.
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

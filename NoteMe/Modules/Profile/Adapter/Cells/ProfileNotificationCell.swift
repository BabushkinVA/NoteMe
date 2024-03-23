//
//  ProfileNotificationCell.swift
//  NoteMe
//
//  Created by Vadim on 23.03.24.
//

import UIKit
import SnapKit

final class ProfileNotificationCell: UITableViewCell {
    
    private enum L10n {
        static let map: String = "profile_map".localized
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .Profile.point
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont.withSize(14.0)
        label.textAlignment = .left
        label.text = L10n.map
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
    }
    
}


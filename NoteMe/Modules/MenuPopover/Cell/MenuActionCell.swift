//
//  MenuActionCell.swift
//  NoteMe
//
//  Created by Vadim on 27.02.24.
//

import UIKit
import SnapKit

protocol MenuActionItem {
    var title: String { get }
    var icon: UIImage? { get }
}

final class MenuActionCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .appText
        label.font = .appBoldFont.withSize(16.0)
        return label
    }()
    
    private lazy var iconView: UIImageView = UIImageView()
    
    
    
    func setup(_ item: MenuActionItem) {
        titleLabel.text = item.title
        iconView.image = item.icon
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(16.0)
        }
        
        iconView.snp.makeConstraints { make in
            make.size.equalTo(24.0)
            make.left.equalTo(titleLabel.snp.right).offset(8.0)
            make.right.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
        }
    }
}

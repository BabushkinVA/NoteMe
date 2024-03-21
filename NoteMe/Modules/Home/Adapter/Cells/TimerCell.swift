//
//  TimerCell.swift
//  NoteMe
//
//  Created by Vadim on 14.03.24.
//

import UIKit
import SnapKit

final class TimerCell: UITableViewCell {
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "timer title"
            label.textColor = .appText
            label.font = .appBoldFont.withSize(15.0)
            return label
        }()
        
        private lazy var infoLabel: UILabel = {
            let label = UILabel()
            label.text = "label title"
            label.textColor = .appText
            label.font = .appFont.withSize(13.0)
            return label
        }()
        
        var titleText: String? {
            get { titleLabel.text }
            set { titleLabel.text = newValue }
        }
        
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
        
        private func commonInit() {
            setupUI()
            setupConstraints()
        }
        
//        func setup(_ title: String) {
//            titleLabel.text = title
//        }
        
        private func setupUI() {
            addSubview(titleLabel)
            addSubview(infoLabel)
            
    //        self.clipsToBounds = true
        }
        
        private func setupConstraints() {
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(16.0)
                make.left.equalToSuperview().inset(74.0)
            }
            
            infoLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
                make.left.equalToSuperview().inset(74.0)
            }
        }
        
    }


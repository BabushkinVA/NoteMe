//
//  ProfileAccountCell.swift
//  NoteMe
//
//  Created by Vadim on 29.02.24.
//

import UIKit
import SnapKit

final class ProfileAccountCell: UITableViewCell {
    
    private enum L10n {
        static let infoText: String = "profileCell_infoText".localized
    }
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.infoText
        label.textColor = .appGrayText
        label.font = .appFont.withSize(15.0)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appText
        label.font = .appFont.withSize(17.0)
        return label
    }()
    
    var email: String? {
        get { emailLabel.text }
        set { emailLabel.text = newValue }
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
    
    func setup(_ email: String) {
        emailLabel.text = email
    }
    
    private func setupUI() {
        addSubview(infoLabel)
        addSubview(emailLabel)
        
//        self.clipsToBounds = true
    }
    
    private func setupConstraints() {
        infoLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(16.0)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(4.0)
            make.left.bottom.equalToSuperview().inset(16.0)
        }
    }
    
}

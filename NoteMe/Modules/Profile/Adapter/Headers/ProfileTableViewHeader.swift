//
//  ProfileTableViewHeader.swift
//  NoteMe
//
//  Created by Vadim on 29.02.24.
//

import UIKit

final class ProfileTableViewHeader: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appText
        label.font = .appBoldFont.withSize(14.0)
        return label
    }()
    
    var text: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue}
    }
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(16.0)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
}

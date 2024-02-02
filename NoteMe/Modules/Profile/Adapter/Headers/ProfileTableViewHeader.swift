//
//  ProfileTableViewHeader.swift
//  NoteMe
//
//  Created by Vadim on 2.02.24.
//

import UIKit
import SnapKit

final class ProfileTableViewHeader: UIView {
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .appBlack
        label.font = .appBoldFont.withSize(14.0)
        label.text = "Test"
        label.textAlignment = .left
    }()
    
    var text: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(16.0)
        }
    }
}

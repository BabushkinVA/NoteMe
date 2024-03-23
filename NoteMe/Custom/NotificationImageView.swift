//
//  NotificationImageView.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit

final class NotificationImageView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appBoldFont.withSize(13.0)
        label.textAlignment = .left
        label.textColor = .appText
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(imageView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-8.0)
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(147.0)
        }
    }
}

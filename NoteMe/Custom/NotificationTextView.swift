//
//  NotificationTextView.swift
//  NoteMe
//
//  Created by Vadim on 4.03.24.
//

import UIKit

final class NotificationTextView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appBoldFont.withSize(13.0)
        label.textAlignment = .left
        label.textColor = .appText
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.font = .appFont.withSize(15.0)
        textView.textColor = .appGrayText
        textView.setBorder(width: 1.0, color: .appText)
        return textView
    }()
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var placeholder: String? {
        get { textView.text }
        set { textView.text = newValue }
    }
    
    var text: String? {
        get { textView.text }
        set { textView.text = newValue }
    }
    
    var textColor: UIColor? {
        get { textView.textColor }
        set { textView.textColor = newValue }
    }
    
    var delegate: UITextViewDelegate? {
        get { textView.delegate }
        set { textView.delegate = newValue }
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
        addSubview(textView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-4.0)
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(70.0)
        }
    }
}

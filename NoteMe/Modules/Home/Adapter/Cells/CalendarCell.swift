//
//  CalendarCell.swift
//  NoteMe
//
//  Created by Vadim on 14.03.24.
//

import UIKit
import SnapKit

final class CalendarCell: UITableViewCell {
    
    private lazy var dateView: UIView = {
       let view = UIView()
        view.backgroundColor = .appBlack
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(dateView)
    }
    
    private func setupConstraints() {
        dateView.snp.makeConstraints { make in
            make.size.equalTo(50.0)
            make.top.left.bottom.equalToSuperview().inset(16.0)
        }
    }
    
}

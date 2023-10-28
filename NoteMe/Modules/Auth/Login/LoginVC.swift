//
//  LoginVC.swift
//  NoteMe
//
//  Created by Vadim on 24.10.23.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var logoMainLabel: UILabel = UILabel()
    private lazy var newAccountButton: UIButton = UIButton()
    private lazy var loginButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        contentView.addSubview(logoImageView)
        
        contentView.addSubview(logoMainLabel)
        logoMainLabel.text = "Welcome back!"
        logoMainLabel.font = .logoLabelBoldFont
        
        view.addSubview(newAccountButton)
        newAccountButton.setTitle("New Account", for: .normal)
        newAccountButton.buttonUnderlineStyle()
        newAccountButton.setTitleColor(.appYellow, for: .normal)
        newAccountButton.titleLabel?.font = .appBoldFont
        
        view.addSubview(loginButton)
        loginButton.buttonMainStyle(title: "Login")
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(loginButton.snp.centerY)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        logoMainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).inset(-72.0)
        }
        
        newAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(-8.0)
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(newAccountButton.snp.top).inset(-4.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
    }
}


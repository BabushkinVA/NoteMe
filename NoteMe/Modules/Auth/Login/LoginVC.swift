//
//  LoginVC.swift
//  NoteMe
//
//  Created by Vadim on 24.10.23.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = 
        .contentViewStyle()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var titleLabel: UILabel = 
        .mainLabelStyle("welcome_label".localized)
    private lazy var loginButton: UIButton =
        .yellowRoundedButton("login_button".localized)
    private lazy var newAccountButton: UIButton =
        .underlineYellowButton("new_account_button".localized)
    private lazy var forgotPasswordButton: UIButton =
        .underlineGrayButton("forgot_password_button".localized)
    
    private lazy var infoView: UIView = .shadowStyle()
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "e-mail_label".localized
        textField.placeholder = "e-mail_textField_placeholder".localized
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "password_label".localized
        textField.placeholder = "password_textField_placeholder".localized
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.emailTextField.errorText = "1.5sec"
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginButton)
        contentView.addSubview(newAccountButton)
        contentView.addSubview(infoView)
        contentView.addSubview(titleLabel)
        
        infoView.addSubview(forgotPasswordButton)
        infoView.addSubview(emailTextField)
        infoView.addSubview(passwordTextField)
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
        
        newAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(20.0)
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(newAccountButton.snp.top).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalTo(forgotPasswordButton.snp.top).inset(-20.0)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().inset(16.0)
            make.height.equalTo(17.0)
        }
    }
}


//
//  RegisterVC.swift
//  NoteMe
//
//  Created by Vadim on 5.11.23.
//

import UIKit
import SnapKit

final class RegisterVC: UIViewController {
    
    private lazy var contentView: UIView =
        .contentViewStyle()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var titleLabel: UILabel =
        .mainLabelStyle("nice_to_meet_you_label".localized)
    private lazy var registerButton: UIButton =
        .yellowRoundedButton("register_button".localized)
    private lazy var haveAccountButton: UIButton =
        .underlineYellowButton("have_account_button".localized)
    
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
    
    private lazy var repeatPasswordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "repeat_password_label".localized
        textField.placeholder = "repeat_password_textField_placeholder".localized
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(registerButton)
        contentView.addSubview(haveAccountButton)
        contentView.addSubview(infoView)
        contentView.addSubview(titleLabel)
        
        infoView.addSubview(emailTextField)
        infoView.addSubview(passwordTextField)
        infoView.addSubview(repeatPasswordTextField)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(registerButton.snp.centerY)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        haveAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(20.0)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(haveAccountButton.snp.top).inset(-8.0)
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
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16.0)
            make.top.equalTo(passwordTextField.snp.bottom).inset(-16.0)
            make.bottom.equalToSuperview().inset(20.0)
        }
    }
}

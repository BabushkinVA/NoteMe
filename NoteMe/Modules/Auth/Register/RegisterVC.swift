//
//  RegisterVC.swift
//  NoteMe
//
//  Created by Vadim on 16.02.24.
//

import UIKit
import SnapKit

@objc protocol RegisterPresenterProtocol: AnyObject {
    func registerDidTap(email: String?,
                        password: String?,
                        repeatPassword: String?)
    @objc func haveAccountDidTap()
}

final class RegisterVC: UIViewController {
    
    private enum L10n {
        static let titleLabel: String = "reg_title_label".localized
        static let registerButton: String = "reg_register_button".localized
        static let haveAccountButton: String = "reg_have_account_button".localized
        static let emailLabel: String = "reg_e-mail_label".localized
        static let emailPlaceholder: String = "reg_e-mail_textField_placeholder".localized
        static let passwLabel: String = "reg_password_label".localized
        static let passwPlaceholder: String = "reg_password_textField_placeholder".localized
        static let repeatpasswLabel: String = "reg_repeat_password_label".localized
        static let repeatPasswPlaceholder: String = "reg_repeat_password_textField_placeholder".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var infoView: UIView = .infoViewStyle()
    
    private lazy var titleLabel: UILabel =
        .titleLabelStyle(L10n.titleLabel)
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.emailLabel
        textField.placeholder = L10n.emailPlaceholder
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.passwLabel
        textField.placeholder = L10n.passwPlaceholder
        return textField
    }()
    
    private lazy var repeatPasswordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.repeatpasswLabel
        textField.placeholder = L10n.repeatPasswPlaceholder
        return textField
    }()
    
    private lazy var haveAccountButton: UIButton =
        .underlineYellowButton(L10n.haveAccountButton)
        .withAction(presenter,
                    #selector(RegisterPresenterProtocol.haveAccountDidTap))
    
    private lazy var registerButton: UIButton =
        .yellowRoundedButton(L10n.registerButton)
        .withAction(self, #selector(registerDidTap))
    
    private var presenter: RegisterPresenterProtocol
    
    init(presenter: RegisterPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(haveAccountButton)
        view.addSubview(registerButton)
        
        
        logoContainer.addSubview(logoImageView)
        
        contentView.addSubview(logoContainer)
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
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
            make.top.equalTo(passwordTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc private func registerDidTap() {
        presenter.registerDidTap(email: emailTextField.text,
                                 password: passwordTextField.text,
                                 repeatPassword: repeatPasswordTextField.text)
    }
    
}

extension RegisterVC: RegisterPresenterDelegate {
    
    func setEmailError(error: String?) {
        emailTextField.errorText = error
    }
    
    func setPasswordError(error: String?) {
        passwordTextField.errorText = error
    }
    
    func setRepeatPasswordError(error: String?) {
        repeatPasswordTextField.errorText = error
    }
    
    func keyboardFrameChanged(_ frame: CGRect) {
        let maxY = infoView.frame.maxY + contentView.frame.minY + 16.0
        let keyboardY = frame.minY
        
        if maxY > keyboardY {
            let diff = maxY - keyboardY
            UIView.animate(withDuration: 0.25) {
                self.infoView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview().offset(-diff)
                }
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                self.infoView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview()
                }
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

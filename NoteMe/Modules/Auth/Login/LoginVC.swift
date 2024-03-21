//
//  LoginVC.swift
//  NoteMe
//
//  Created by Vadim on 24.10.23.
//

import UIKit
import SnapKit
import Storage

@objc protocol LoginViewModelProtocol: AnyObject {
    func loginDidTap(email: String?, password: String?)
    @objc func newAccountDidTap()
    func forgotPasswordDidTap(email: String?)
}

protocol LoginKeyboardHelper {
    func keyboardFrameChanged(_ frame: CGRect)
}

final class LoginVC: UIViewController {
    
    private enum L10n {
        static let titleLabel: String = "auth_title_label".localized
        static let loginButton: String = "auth_login_button".localized
        static let newAccountButton: String = "auth_new_account_button".localized
        static let forgotPasswordButton: String = "auth_forgot_password_button".localized
        static let emailLabel: String = "auth_e-mail_label".localized
        static let emailPlaceholder: String = "auth_e-mail_textField_placeholder".localized
        static let passwLabel: String = "auth_password_label".localized
        static let passwPlaceholder: String = "auth_password_textField_placeholder".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var titleLabel: UILabel =
        .titleLabelStyle(L10n.titleLabel)
    
    private lazy var loginButton: UIButton =
        .yellowRoundedButton(L10n.loginButton)
        .withAction(self, #selector(loginDidTap))
    
    private lazy var newAccountButton: UIButton =
        .underlineYellowButton(L10n.newAccountButton)
        .withAction(viewModel,
                    #selector(LoginViewModelProtocol.newAccountDidTap))
    
    private lazy var forgotPasswordButton: UIButton =
        .underlineGrayButton(L10n.forgotPasswordButton)
        .withAction(self, #selector(forgotPasswordDidTap))
    
    private lazy var infoView: UIView = .shadowStyle()
    
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
    
    private var viewModel: LoginViewModelProtocol
    private let keyboardHelper: KeyboardHelper
    
    init(viewModel: LoginViewModelProtocol,
         keyboardHelper: KeyboardHelper) {
        self.viewModel = viewModel
        self.keyboardHelper = keyboardHelper
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setupUI()
        setupConstraints()
        
//        let storage = DateNotificationStorage()
    }
    
    private func bind() {
        keyboardHelper.onWillShow { [weak self] frame in
            self?.keyboardFrameChanged(frame)
        }.onWillHide { [weak self] frame in
            self?.keyboardFrameChanged(frame)
        }
    }

    private func setupUI() {
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(loginButton)
        view.addSubview(newAccountButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(logoImageView)
        contentView.addSubview(infoView)
        contentView.addSubview(titleLabel)
        
        logoContainer.addSubview(logoImageView)
        
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
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc private func loginDidTap() {
        viewModel.loginDidTap(email: emailTextField.text,
                              password: passwordTextField.text)
    }
    
    @objc private func forgotPasswordDidTap() {
        viewModel.forgotPasswordDidTap(email: emailTextField.text)
    }
    
}

extension LoginVC: LoginKeyboardHelper {
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

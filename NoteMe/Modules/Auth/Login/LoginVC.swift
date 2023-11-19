//
//  LoginVC.swift
//  NoteMe
//
//  Created by Vadim on 24.10.23.
//

import UIKit
import SnapKit

@objc protocol LoginViewModelProtocol: AnyObject {
    var catchEmailError: ((String?) -> Void)? { get set }
    var catchPasswordError: ((String?) -> Void)? { get set }
    
    func loginDidTap(email: String?, password: String?)
    @objc func newAccountDidTap()
    func forgotPasswordDidTap(email: String?)
}

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = .contentViewStyle()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)

    private lazy var titleLabel: UILabel = 
        .titleLabelStyle("auth_title_label".localized)
    
    private lazy var loginButton: UIButton =
        .yellowRoundedButton("auth_login_button".localized)
        .withAction(self, #selector(loginDidTap))
    
    private lazy var newAccountButton: UIButton =
        .underlineYellowButton("auth_new_account_button".localized)
        .withAction(viewModel,
                    #selector(LoginViewModelProtocol.newAccountDidTap))
    
    private lazy var forgotPasswordButton: UIButton =
        .underlineGrayButton("auth_forgot_password_button".localized)
        .withAction(self, #selector(forgotPasswordDidTap))
    
    private lazy var infoView: UIView = .shadowStyle()
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "auth_e-mail_label".localized
        textField.placeholder = "auth_e-mail_textField_placeholder".localized
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "auth_password_label".localized
        textField.placeholder = "auth_password_textField_placeholder".localized
        return textField
    }()
    
    private var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.emailTextField.errorText = "1.5sec"
        }
    }
    
    private func bind() {
        viewModel.catchEmailError = { errorText in
            self.emailTextField.errorText = errorText
        }
        
        viewModel.catchPasswordError = {
            self.passwordTextField.errorText = $0
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
    
    @objc private func loginDidTap() {
        viewModel.loginDidTap(email: emailTextField.text,
                              password: passwordTextField.text)
    }
    
    @objc private func forgotPasswordDidTap() {
        viewModel.forgotPasswordDidTap(email: emailTextField.text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


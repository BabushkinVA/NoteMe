//
//  ResetVC.swift
//  NoteMe
//
//  Created by Vadim on 16.02.24.
//

import UIKit
import SnapKit

@objc protocol ResetViewModelProtocol {
    var catchEmailError: ((String?) -> Void)? { get set }
    
    func resetDidTap(email: String?)
    func cancelDidTap()
}

final class ResetVC: UIViewController {
    
    private enum L10n {
        static let titleLabel: String = "res_title_label".localized
        static let resetButton: String = "res_reset_button".localized
        static let infoLabel: String = "res_infolabel".localized
        static let resEmailTextField: String = "res_e-mail_textField_placeholder".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var infoView: UIView = .infoViewStyle()
    
    private lazy var titleLabel: UILabel =
        .titleLabelStyle(L10n.titleLabel)
    
    private lazy var resetEmailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.infoLabel
        textField.placeholder = L10n.resEmailTextField
        return textField
    }()
    
    private lazy var cancelButton: UIButton = 
        .cancelButton()
        .withAction(viewModel, #selector(ResetViewModelProtocol.cancelDidTap))
    
    private lazy var resetButton: UIButton =
        .yellowRoundedButton(L10n.resetButton)
        .withAction(self, #selector(resetDidTap))
    
    private let viewModel: ResetViewModelProtocol
    
    init(viewModel: ResetViewModelProtocol) {
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
    }
    
    private func bind() {
        viewModel.catchEmailError = { errorText in
            self.resetEmailTextField.errorText = errorText
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(cancelButton)
        view.addSubview(resetButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(infoView)
        contentView.addSubview(titleLabel)
        
        logoContainer.addSubview(logoImageView)
        
        infoView.addSubview(resetEmailTextField)
        
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(resetButton.snp.centerY)
        }
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        resetButton.snp.makeConstraints { make in
            make.bottom.equalTo(cancelButton.snp.top).inset(-8.0)
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
        
        resetEmailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(20.0)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc private func resetDidTap() {
            viewModel.resetDidTap(email: resetEmailTextField.text)
    }
    
}

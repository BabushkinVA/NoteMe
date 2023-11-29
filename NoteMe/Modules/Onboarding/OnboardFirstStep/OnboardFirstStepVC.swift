//
//  OnboardFirstStepVC.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit
import SnapKit

@objc protocol OnboardFirstStepViewModelProtocol {
    @objc func nextDidTap()
}

final class OnboardFirstStepVC: UIViewController {
    
    private lazy var contentView: UIView = .contentViewStyle()
    
    private lazy var nextButton: UIButton =
        .yellowRoundedButton("onboard_next_button".localized)
        .withAction(viewModel, 
                    #selector(OnboardFirstStepViewModelProtocol.nextDidTap))
    
    private lazy var infoView: UIView = .shadowStyle()
    private lazy var infoLabel: UILabel =
        .infoLabelStyle("onboard_first_infolabel".localized)
    
    private lazy var titleLabel: UILabel =
        .titleLabelStyle("onboard_first_title_label".localized)
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: 
        UIImageView = UIImageView(image: .General.logo)
    
    private var viewModel: OnboardFirstStepViewModelProtocol
    
    init(viewModel: OnboardFirstStepViewModelProtocol) {
        self.viewModel = viewModel
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
        self.hideNavigationBar()
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(nextButton)
        
        contentView.addSubview(infoView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(logoContainer)
        
        logoContainer.addSubview(logoImageView)
        
        infoView.addSubview(infoLabel)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(nextButton.snp.centerY)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)//.inset(16.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.centerY.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
            make.centerX.equalToSuperview()
        }
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(96.0)
            make.center.equalToSuperview()
        }
    }
    
}

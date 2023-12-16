//
//  OnboardSecondStepVC.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit
import SnapKit

@objc protocol OnboardSecondStepViewModelProtocol {
    @objc func doneDidTap()
    func dismissedByUser()
}

final class OnboardSecondStepVC: UIViewController {
    
    private enum L10n {
        static let doneButton: String = "onboard_done_button".localized
        static let nextButton: String = "onboard_next_button".localized
        static let infoLabel: String = "onboard_second_infolabel".localized
        static let titleLabel: String = "onboard_second_title_label".localized
        static let calendarLabel: String = "onboard_second_calendar_label".localized
        static let locationLabel: String = "onboard_second_location_label".localized
        static let timerLabel: String = "onboard_second_timer_label".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    
    private lazy var doneButton: UIButton = 
        .yellowRoundedButton(L10n.doneButton)
        .withAction(viewModel,
                    #selector(OnboardSecondStepViewModelProtocol.doneDidTap))
    
    private lazy var infoView: UIView = .shadowStyle()
    
    private lazy var infoLabel: UILabel = .infoLabelStyle(L10n.infoLabel)
    
    private lazy var titleLabel: UILabel = .titleLabelStyle(L10n.titleLabel)
    
    private lazy var logoContainer: UIView = UIView()
    private lazy var logoImageView: UIImageView = 
        UIImageView(image: .General.logo)
    
    private lazy var onboardContainer: UIView = UIView()
    private lazy var onboardImageView: UIImageView =
        UIImageView(image: .Onboarding.onboard)
    
    
    private lazy var calendarLabel: UILabel =
        .onboardSelectionImageLabelStyle(L10n.calendarLabel)
    
    private lazy var locationLabel: UILabel =
        .onboardSelectionImageLabelStyle(L10n.locationLabel)
    
    private lazy var timerLabel: UILabel =
        .onboardSelectionImageLabelStyle(L10n.timerLabel)
    
    private var viewModel: OnboardSecondStepViewModelProtocol
    
    init(viewModel: OnboardSecondStepViewModelProtocol) {
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.dismissedByUser()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(doneButton)
        
        contentView.addSubview(infoView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(logoContainer)
        contentView.addSubview(onboardContainer)
        
        infoView.addSubview(infoLabel)
        
        logoContainer.addSubview(logoImageView)
        
        onboardContainer.addSubview(onboardImageView)
        
        onboardImageView.addSubview(calendarLabel)
        onboardImageView.addSubview(locationLabel)
        onboardImageView.addSubview(timerLabel)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(doneButton.snp.centerY)
        }
        
        doneButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(infoView.snp.top).inset(-8.0)
        }
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        onboardContainer.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(infoView.snp.bottom)
            make.bottom.equalTo(doneButton.snp.top)
        }
        
        onboardImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(180.0)
            make.height.equalTo(157.0)
        }
        
        calendarLabel.snp.makeConstraints { make in
            make.height.equalTo(24.0)
            make.top.equalToSuperview().inset(18.0)
            make.left.equalToSuperview().inset(24.0)
        }        
        
        locationLabel.snp.makeConstraints { make in
            make.height.equalTo(24.0)
            make.top.equalTo(calendarLabel.snp.bottom).inset(-14.0)
            make.left.equalToSuperview().inset(24.0)
        }        
        
        timerLabel.snp.makeConstraints { make in
            make.height.equalTo(24.0)
            make.top.equalTo(locationLabel.snp.bottom).inset(-12.0)
            make.left.equalToSuperview().inset(24.0)
        }
    }
    
}

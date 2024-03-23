//
//  TimerNotificationVC.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit

@objc protocol TimerNotificationViewModelProtocol: AnyObject {
    @objc func cancelDidTap()
    func dismissedByUser()
    @objc func createDidTap()
}

final class TimerNotificationVC: UIViewController, UITextViewDelegate {
    
    private enum L10n {
        static let mainLabel: String = "timer_main_label".localized
        static let titleLabel: String = "timer_title".localized
        static let titlePlaceholder: String = "timer_title_placeholder".localized
        static let timerLabel: String = "timer_timer".localized
        static let timerPlaceholder: String = "timer_timer_placeholder".localized
        static let commentLabel: String = "timer_comment".localized
        static let commentPlaceholder: String = "timer_comment_placeholder".localized
        static let createButton: String = "create_button".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    private lazy var cancelButton: UIButton =
        .cancelButton()
        .withAction(viewModel, #selector(TimerNotificationViewModelProtocol.cancelDidTap))
    private lazy var createButton: UIButton = 
        .yellowRoundedButton(L10n.createButton)
        .withAction(viewModel, #selector(TimerNotificationViewModelProtocol.createDidTap))
    private lazy var mainLabel: UILabel = .notificatioLabelStyle(L10n.mainLabel)
    private lazy var infoView: UIView = .infoViewStyle()
    
    private lazy var titleTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.titleLabel
        textField.placeholder = L10n.titlePlaceholder
        return textField
    }()
    
 private lazy var timerTextField: LineTextField = {
        let textField = LineTextField()
        let datePicker = UIDatePicker()
        textField.title = L10n.timerLabel
        textField.placeholder = L10n.timerPlaceholder
        textField.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
        datePicker.addTarget(self,
                             action: #selector(timerDidChanged(_:)),
                             for: .valueChanged)
        return textField
    }()
    
    private lazy var timerTextView: NotificationTextView = {
        let textView = NotificationTextView()
        textView.title = L10n.commentLabel
        textView.placeholder = L10n.commentPlaceholder
        return textView
    }()
    
    private var viewModel: TimerNotificationViewModelProtocol
    
    init(viewModel: TimerNotificationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerTextView.delegate = self
        
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
        view.addSubview(cancelButton)
        view.addSubview(createButton)
        
        contentView.addSubview(mainLabel)
        contentView.addSubview(infoView)
        
        infoView.addSubview(titleTextField)
        infoView.addSubview(timerTextField)
        infoView.addSubview(timerTextView)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(createButton.snp.centerY)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
        }
        
        createButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(cancelButton.snp.top).inset(-8.0)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(20.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).inset(-10.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        timerTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        timerTextView.snp.makeConstraints { make in
            make.top.equalTo(timerTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if timerTextView.textColor == .appGrayText {
            textView.text = nil
            textView.textColor = .appText
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            timerTextView.text = L10n.commentPlaceholder
            timerTextView.textColor = .appGrayText
        }
    }
    
    @objc private func timerDidChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H mm ss"
        timerTextField.text = dateFormatter.string(from: selectedDate)
    }
    
}

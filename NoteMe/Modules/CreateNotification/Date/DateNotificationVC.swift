//
//  DateNotificationVC.swift
//  NoteMe
//
//  Created by Vadim on 4.03.24.
//

import UIKit
import SnapKit

@objc protocol DateNotificationViewModelProtocol: AnyObject {
    @objc func cancelDidTap()
    func dismissedByUser()
    @objc func createDidTap()
}

final class DateNotificationVC: UIViewController, UITextViewDelegate {
    
    private enum L10n {
        static let mainLabel: String = "date_main_label".localized
        static let titleLabel: String = "date_title".localized
        static let titlePlaceholder: String = "date_title_placeholder".localized
        static let dateLabel: String = "date_date".localized
        static let datePlaceholder: String = "date_date_placeholder".localized
        static let commentLabel: String = "date_comment".localized
        static let commentPlaceholder: String = "date_comment_placeholder".localized
        static let createButton: String = "create_button".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    private lazy var cancelButton: UIButton = 
        .cancelButton()
        .withAction(viewModel, #selector(DateNotificationViewModelProtocol.cancelDidTap))
    private lazy var createButton: UIButton = 
        .yellowRoundedButton(L10n.createButton)
        .withAction(viewModel, #selector(DateNotificationViewModelProtocol.createDidTap))
    private lazy var mainLabel: UILabel = .notificatioLabelStyle(L10n.mainLabel)
    private lazy var infoView: UIView = .infoViewStyle()
    
    private lazy var titleTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.titleLabel
        textField.placeholder = L10n.titlePlaceholder
        return textField
    }()
    
 private lazy var dateTextField: LineTextField = {
        let textField = LineTextField()
        let datePicker = UIDatePicker()
        textField.title = L10n.dateLabel
        textField.placeholder = L10n.datePlaceholder
        textField.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.addTarget(self,
                             action: #selector(dateDidChanged(_:)),
                             for: .valueChanged)
        return textField
    }()
    
    private lazy var dateTextView: NotificationTextView = {
        let textView = NotificationTextView()
        textView.title = L10n.commentLabel
        textView.placeholder = L10n.commentPlaceholder
        return textView
    }()
    
    private var viewModel: DateNotificationViewModelProtocol
    
    init(viewModel: DateNotificationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextView.delegate = self
        
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
        infoView.addSubview(dateTextField)
        infoView.addSubview(dateTextView)
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
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        dateTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if dateTextView.textColor == .appGrayText {
            textView.text = nil
            textView.textColor = .appText
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            dateTextView.text = L10n.commentPlaceholder
            dateTextView.textColor = .appGrayText
        }
    }
    
    @objc private func dateDidChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateTextField.text = dateFormatter.string(from: selectedDate)
    }
    
}


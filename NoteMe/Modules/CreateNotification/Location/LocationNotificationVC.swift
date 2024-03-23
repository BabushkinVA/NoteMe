//
//  LocationNotificationVC.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit
import SnapKit
import MapKit

@objc protocol LocationNotificationViewModelProtocol: AnyObject {
    @objc func cancelDidTap()
    func dismissedByUser()
    @objc func createDidTap()
    @objc func mapImageViewDidTap()
}

//protocol LocationNotificationDelegate: AnyObject {
//    func didSelectRegion(sender: UIView)
//}

final class LocationNotificationVC: UIViewController {
    
    private enum L10n {
        static let mainLabel: String = "location_main_label".localized
        static let titleLabel: String = "location_title".localized
        static let titlePlaceholder: String = "location_title_placeholder".localized
        static let commentLabel: String = "location_comment".localized
        static let commentPlaceholder: String = "location_comment_placeholder".localized
        static let locationLabel: String = "location_image_title".localized
        static let createButton: String = "create_button".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    private lazy var cancelButton: UIButton =
        .cancelButton()
        .withAction(viewModel, #selector(LocationNotificationViewModelProtocol.cancelDidTap))
    private lazy var createButton: UIButton =
        .yellowRoundedButton(L10n.createButton)
        .withAction(viewModel, #selector(LocationNotificationViewModelProtocol.createDidTap))
    private lazy var mainLabel: UILabel = .notificatioLabelStyle(L10n.mainLabel)
        
    private lazy var infoView: UIView = .infoViewStyle()
    
    private lazy var titleTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.titleLabel
        textField.placeholder = L10n.titlePlaceholder
        return textField
    }()
    
    private lazy var locationTextView: NotificationTextView = {
        let textView = NotificationTextView()
        textView.title = L10n.commentLabel
        textView.placeholder = L10n.commentPlaceholder
        return textView
    }()
    
    private lazy var locationImageView: NotificationImageView = {
        let imageView = NotificationImageView()
        imageView.title = L10n.locationLabel
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedMe))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private var viewModel: LocationNotificationViewModelProtocol
//    private weak var delegate: LocationNotificationDelegate?
    
    init(viewModel: LocationNotificationViewModelProtocol) {
//         delegate: LocationNotificationDelegate) {
        self.viewModel = viewModel
//        self.delegate = delegate
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
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.dismissedByUser()
    }
    
    private func bind() {
        
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(cancelButton)
        view.addSubview(createButton)
        
        contentView.addSubview(mainLabel)
        contentView.addSubview(infoView)
        
        infoView.addSubview(titleTextField)
        infoView.addSubview(locationTextView)
        infoView.addSubview(locationImageView)
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
            make.top.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).inset(-10.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        locationTextView.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.top.equalTo(locationTextView.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if locationTextView.textColor == .appGrayText {
            textView.text = nil
            textView.textColor = .appText
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            locationTextView.text = L10n.commentPlaceholder
            locationTextView.textColor = .appGrayText
        }
    }
    

    
    @objc func tappedMe() {
        print("Tapped on Image")
        mapImageViewDidTap()
    }
    private lazy var locationManager: CLLocationManager = .init()
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        
        return mapView
    }()
    private lazy var regionImageView: UIImageView = UIImageView(image: .Location.region)
    
    @objc func mapImageViewDidTap() {
        viewModel.mapImageViewDidTap()
    }
    
}


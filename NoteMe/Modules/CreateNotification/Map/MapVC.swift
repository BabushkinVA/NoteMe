//
//  MapVC.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit
import MapKit

@objc protocol MapViewModelProtocol: AnyObject {
    @objc func cancelDidTap()
    func dismissedByUser()
    @objc func selectDidTap()
}

final class MapVC: UIViewController {
    
    private enum L10n {
        static let selectButton: String = "select_button".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    private lazy var cancelButton: UIButton =
        .cancelButton()
        .withAction(viewModel, #selector(MapViewModelProtocol.cancelDidTap))
    private lazy var selectButton: UIButton =
        .yellowRoundedButton(L10n.selectButton)
        .withAction(self, #selector(selectDidTap))
    
    private lazy var locationManager: CLLocationManager = .init()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        
        return mapView
    }()
    
    private lazy var regionImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "region"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let viewModel: MapViewModelProtocol
    
    init(viewModel: MapViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askPermission()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(cancelButton)
        view.addSubview(selectButton)
        
        contentView.addSubview(mapView)
        contentView.backgroundColor = .appGray
        
        mapView.addSubview(regionImageView)

    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(selectButton.snp.centerY)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
        }
        
        selectButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(cancelButton.snp.top).inset(-8.0)
        }
        
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(44.0)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        regionImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(95.0)
        }
        
    }
    
    private func askPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    @objc private func selectDidTap() {
        print(#function)
//        let mapRegion = mapView.convert(regionImageView.bounds, toRegionFrom: regionImageView)
//        let scale = mapView.contentScaleFactor
//        
//        let centerLoc = CLLocation(latitude: mapRegion.center.latitude,
//                                   longitude: mapRegion.center.longitude)
//        let topLoc = CLLocation(latitude: mapRegion.center.latitude - mapRegion.span.latitudeDelta / 2,
//                                longitude: mapRegion.center.longitude)
//        let radius = centerLoc.distance(from: topLoc)
//        
//        let id = UUID().uuidString
//        let circleRegion = CLCircularRegion(center: mapRegion.center,
//                                            radius: radius,
//                                            identifier: id)
//        circleRegion.notifyOnEntry = true
//        circleRegion.notifyOnExit = false
//        
//        let trigger = UNLocationNotificationTrigger(region: circleRegion, repeats: false)
//        
//        
//        let content = UNMutableNotificationContent()
//        content.title = "U entered the region"
//        content.body = "Buy beer"
//        
//        let request = UNNotificationRequest(identifier: id,
//                                            content: content,
//                                            trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request)
        
        
        //ScreenShot
        let screenshotSize = CGSize(width: mapView.frame.width,
                                    height: regionImageView.frame.height * 2)
        
        let contentRect = CGRect(origin: CGPoint(x: .zero,
                                                 y: -(regionImageView.center.y / 2 - screenshotSize.height / 2)),
                                 size: mapView.bounds.size)
        
        UIGraphicsBeginImageContextWithOptions(screenshotSize, false, UIScreen.main.scale)
        view.drawHierarchy(in: contentRect, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
}

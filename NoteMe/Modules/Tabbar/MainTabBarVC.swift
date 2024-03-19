//
//  MainTabBarVC.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

@objc protocol MainTabBarViewModelProtocol {
   @objc func addButtonDidTap(sender: UIView)
    
}


final class MainTabBarVC: UITabBarController {
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appYellow
        button.setImage(.TabBar.plus, for: .normal)
        button.setImage(.TabBar.home, for: .highlighted)
        button.cornerRadius = 25.0
        button.addTarget(viewModel, 
                         action: #selector(MainTabBarViewModelProtocol.addButtonDidTap),
                         for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
    }
    
    private func setupUI() {
        tabBar.tintColor = .appYellow
        tabBar.backgroundColor = .appBlack
        tabBar.unselectedItemTintColor = .appGray
        
        view.addSubview(plusButton)
    }
    
    private func setupConstraints() {
        plusButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(tabBar.snp.top)
            make.size.equalTo(CGSize(width: 50.0, height: 50.0))
        }
    }
    
    @objc private func openCloudView() {
        let vc = UIViewController()
        vc.view.backgroundColor = .cyan
        
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 150.0, height: 50.0)
        
        vc.popoverPresentationController?.sourceView = plusButton
        vc.popoverPresentationController?.permittedArrowDirections = .down
        vc.popoverPresentationController?.delegate = vc
        
        present(vc, animated: true)
    }
    
}

extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

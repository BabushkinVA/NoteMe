//
//  HomeVC.swift
//  NoteMe
//
//  Created by Vadim on 28.02.24.
//

import UIKit

protocol HomeViewModelProtocol {
    func viewDidLoad()
}

final class HomeVC: UIViewController {
    
    private enum L10n {
        static let home: String = "home_item".localized
    }
    
    private var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .appGray
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.home,
                                       image: .TabBar.home,
                                       tag: .zero)
        
    }
    
}

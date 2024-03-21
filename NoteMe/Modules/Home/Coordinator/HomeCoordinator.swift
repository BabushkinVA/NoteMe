//
//  HomeCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 28.02.24.
//

import UIKit
import Storage

final class HomeCoordinator: Coordinator, HomeCoordinatorProtocol {
    
    private var rootVC: UIViewController?
    
    override func start() -> UIViewController {
        return HomeAssembler.make()
        
    }
    
//    override func start() -> UIViewController {
//        let vc = HomeAssembler.make(coordinator: self, container: container)
//        rootVC = vc
//        return vc
//    }
    
    func startEdit(dto: any DTODescription) {
        print(#function)
    }
    
    func showMenu(sender: UIView, delegate: MenuPopoverDelegate) {
        let menu = MenuPopoverBuilder.buildEditMenu(delegate: delegate,
                                                   sourceView: sender)
        rootVC?.present(menu, animated: true)
    }
}

//
//  HomeAssembler.swift
//  NoteMe
//
//  Created by Vadim on 28.02.24.
//

import UIKit
import Storage

final class HomeAssembler {
    private init() {}
    
    static func make() -> UIViewController {
        let vm = HomeVM(
            frcService: makeFRC(),
            adapter: HomeAdapter(), 
            storage: AllNotificationStorage(),
            coordinator: HomeCoordinator())
        let vc = HomeVC(viewModel: vm)
        
        return vc
    }
    
    private static func makeFRC() -> FRCService<BaseNotificationDTO> {
        return .init { request in
            request.predicate = .Notification.allNotCompleted
            request.sortDescriptors = [.Notification.byDate]
        }
    }
    
}

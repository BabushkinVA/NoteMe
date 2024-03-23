//
//  MapVM.swift
//  NoteMe
//
//  Created by Vadim on 23.03.24.
//

import UIKit

protocol MapCoordinatorProtocol: AnyObject {
    func finish()
    func dismissedByUser()
}

final class MapVM: MapViewModelProtocol {
    
    private weak var coordinator: MapCoordinatorProtocol?
    
    init(coordinator: MapCoordinatorProtocol) {
        self.coordinator = coordinator
    }
   
    
    func cancelDidTap() {
        coordinator?.finish()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
    
    func selectDidTap() {
        print(#function)
    }
    
}

//extension MapVM: LocationNotificationDelegate {
//    func didSelectRegion(sender: UIView) {
//        print(#function)
//    }
//}

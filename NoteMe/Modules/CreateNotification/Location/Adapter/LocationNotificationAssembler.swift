//
//  LocationNotificationAssembler.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit

final class LocationNotificationAssembler {
    private init() {}
    
    static func make(coordinator: LocationNotificationCoordinator)
    -> UIViewController {
        let vm = LocationNotificationVM(coordinator: coordinator)
        let vc = LocationNotificationVC(viewModel: vm)
        return vc
    }
    
}

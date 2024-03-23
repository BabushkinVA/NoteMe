//
//  TimerNotificationAssembler.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit

final class TimerNotificationAssembler {
    private init() {}
    
    static func make(coordinator: TimerNotificationCoordinatorProtocol) 
    -> UIViewController {
        let vm = TimerNotificationVM(coordinator: coordinator)
        let vc = TimerNotificationVC(viewModel: vm)
        return vc
    }
    
}

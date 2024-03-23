//
//  DateNotificationAssembler.swift
//  NoteMe
//
//  Created by Vadim on 4.03.24.
//

import UIKit
import Storage

final class DateNotificationAssembler {
    private init() {}
    
    static func make(coordinator: DateNotificationCoordinatorProtocol)
    -> UIViewController {
        let vm = DateNotificationVM(coordinator: coordinator, storage: DateNotificationStorage())
        return DateNotificationVC(viewModel: vm)
    }
    
}

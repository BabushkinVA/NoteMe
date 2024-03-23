//
//  DateNotificationVM.swift
//  NoteMe
//
//  Created by Vadim on 4.03.24.
//

import Foundation
import Storage

protocol DateNotificationCoordinatorProtocol: AnyObject {
    func finish()
    func dismissedByUser()
}

protocol DateNotificationStorageUseCase {
    func create(_ dto: DateNotificationDTO)
}

final class DateNotificationVM: DateNotificationViewModelProtocol {
    func createDidTap() {
        print(#function)
    }
    

    private weak var coordinator: DateNotificationCoordinatorProtocol?
    private let storage: DateNotificationStorage //UseCase
    var dto: DateNotificationDTO?
//    var shouldEditDTO: ((DateNotificationDTO) -> Void)?
    
    init(coordinator: DateNotificationCoordinatorProtocol,
         storage: DateNotificationStorage) {
        self.coordinator = coordinator
        self.storage = storage
    }
    
    func createDidTap(_ dto: DateNotificationDTO) {
        let dto = dto
        
    }
    
    func cancelDidTap() {
        coordinator?.finish()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
}

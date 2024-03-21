//
//  HomeVM.swift
//  NoteMe
//
//  Created by Vadim on 4.03.24.
//

import UIKit
import Storage

protocol HomeAdapterProtocol: AnyObject {
    func reloadData(_ dtoList: [any DTODescription])
    func makeTableView() -> UITableView
    var tapButtonOnDTO: ((_ sender: UIButton,
                          _ dto: any DTODescription) -> Void)? { get set }
}

protocol HomeCoordinatorProtocol {
    func startEdit(dto: any DTODescription)
    func showMenu(sender: UIView, delegate: MenuPopoverDelegate)
}

final class HomeVM: HomeViewModelProtocol {
//    func viewDidLoad() {
//        frcService.startHandle()
//        let dtos = frcService.fetchedDTOs
//        adapter.reloadData(dtos)
//    }
    
    private let frcService: FRCService<BaseNotificationDTO>
    private let adapter: HomeAdapterProtocol
    private let storage: AllNotificationStorage
    private let coordinator: HomeCoordinatorProtocol
    private var selectedDTO: (any DTODescription)?
    
    init(frcService: FRCService<BaseNotificationDTO>,
         adapter: HomeAdapterProtocol,
         storage: AllNotificationStorage,
         coordinator: HomeCoordinatorProtocol) {
        self.frcService = frcService
        self.adapter = adapter
        self.storage = storage
        self.coordinator = coordinator
        
        bind()
    }
    
    private func bind() {
        frcService.didChangeContent = { [weak adapter] in
            adapter?.reloadData($0)
        }
        
        adapter.tapButtonOnDTO = { [weak self] sender, dto in
            guard let self else { return }
            self.selectedDTO = dto
            self.coordinator.showMenu(sender: sender, delegate: self)
        }
    }
    
    func makeTableView() -> UITableView {
        adapter.makeTableView()
    }
    
    func viewDidLoad() {
        frcService.startHandle()
        let dtos = frcService.fetchedDTOs
        adapter.reloadData(dtos)
    }
    
}

extension HomeVM: MenuPopoverDelegate {
    func didSelect(action: MenuPopoverVC.Action) {
        guard let dto = selectedDTO else { return }
        
        switch action {
        case .edit:     coordinator.startEdit(dto: dto)
        case .delete:   break //storage.delete(dto: dto)
        default: break
        }
    }
}

//
//  HomeAdapter.swift
//  NoteMe
//
//  Created by Vadim on 14.03.24.
//

import UIKit
import Storage

final class HomeAdapter: NSObject {
    
    //DIMA
    var tapButtonOnDTO: ((_ sender: UIButton, _ dto: any DTODescription) -> Void)?
    
    //DIMA
    private var dtoList: [any DTODescription] = [] { didSet {tableView.reloadData()} }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.cornerRadius = 5.0
        tableView.tableViewShadow()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
//        tableView.sectionFooterHeight = 10.0
//        tableView.clipsToBounds = true
        return tableView
    }()
    
    override init() {
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TimerCell.self)
    }
    
}

extension HomeAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dtoList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //DIMA
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dto = dtoList[indexPath.section]
        
//        switch dto {
//        case is TimerNotificationDTO:
//            let cell: TimerCell = tableView.dequeue(at: indexPath)
//            cell.config(for: dto as! TimerNotificationDTO)
//            cell.buttonDidTap = { [weak self] sender in
//                self?.tapButtonOnDTO?(sender, dto)
//            }
//            return cell
//        default: return UITableViewCell()
//        }
    return UITableViewCell()
    }
    
}

extension HomeAdapter: HomeAdapterProtocol {
        func reloadData(_ dtoList: [any DTODescription]) {
            self.dtoList = dtoList
        }

        func makeTableView() -> UITableView {
            return tableView
        }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.contentView.layer.masksToBounds = true
//    }
}

extension HomeAdapter: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = .clear
//        return view
//    }
//    
//    //MARK: Y Kocti
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0
//    }
}



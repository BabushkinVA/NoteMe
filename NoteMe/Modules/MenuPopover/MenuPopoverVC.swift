//
//  MenuPopoverVC.swift
//  NoteMe
//
//  Created by Vadim on 14.03.24.
//

import UIKit
import SnapKit

protocol MenuPopoverAdapterProtocol {
    var tableView: UITableView { get }
    var contentHeight: CGFloat { get }
    var didSelectAction: ((MenuPopoverVC.Action) -> Void)? { get set }
}

protocol MenuPopoverDelegate: AnyObject {
    func didSelect(action: MenuPopoverVC.Action)
}

final class MenuPopoverVC: UIViewController {
    
    private enum L10n {
        static let calendar: String = "popover_calendar".localized
        static let location: String = "popover_location".localized
        static let timer: String = "popover_timer".localized
        static let edit: String = "popover_edit".localized
        static let delete: String = "popover_delete".localized
    }
    
    private enum Const {
        static let contentWidth: CGFloat = 180.0
    }
    
    enum Action: MenuActionItem {
        case edit
        case delete
        case calendar
        case location
        case timer
        
        var title: String {
            switch self {
            case .edit:     return L10n.edit
            case .delete:   return L10n.delete
            case .calendar: return L10n.calendar
            case .location: return L10n.location
            case .timer:    return L10n.timer
            }
        }
        
        var icon: UIImage? {
            switch self {
            case .edit:     return .Popover.edit
            case .delete:   return .Popover.delete
            case .calendar: return .Popover.calendar
            case .location: return .Popover.location
            case .timer:    return .Popover.timer
            }
        }
    }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { return .popover }
        set {}
    }
    
    private var adapter: MenuPopoverAdapterProtocol
    
    private lazy var tableView: UITableView = adapter.tableView
    
    private weak var delegate: MenuPopoverDelegate?
    
    init(delegate: MenuPopoverDelegate?,
         adapter: MenuPopoverAdapterProtocol,
         sourceView: UIView) {
        self.delegate = delegate
        self.adapter = adapter
        super.init(nibName: nil, bundle: nil)
        
        setupPopover(sourceView: sourceView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setupUI()
        setupConstraints()
    }
    
    private func bind() {
        adapter.didSelectAction = { [weak self] action in
            self?.dismiss(animated: true, completion: {
                self?.delegate?.didSelect(action:action)
            })
        }
    }
    
    private func setupUI() {
        view.addSubview(tableView)
    }
        
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalTo(
                self.view.safeAreaLayoutGuide.snp.verticalEdges)
        }
    }
    
    private func setupPopover(sourceView: UIView) {
        preferredContentSize = CGSize(width: Const.contentWidth,
                                      height: adapter.contentHeight)
        
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.delegate = self
        popoverPresentationController?.sourceRect = CGRect(x: sourceView.bounds.midX,
                                                           y: sourceView.bounds.midY,
                                                           width: .zero,
                                                           height: .zero)
    }
    
}

extension MenuPopoverVC: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

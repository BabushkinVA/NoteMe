//
//  MenuPopoverVC.swift
//  NoteMe
//
//  Created by Vadim on 27.02.24.
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
            case .edit: return "Edit.loc"
            case .delete: return "Delete.loc"
            case .calendar: return "Calendar.loc"
            case .location: return "Location.loc"
            case .timer: return "Timer.loc"
            }
        }
        
//        var icon: UIImage? {
//            switch self {
//            case .edit: return return .MenuAction.edit
//            case .delete: return
//            case .calendar: return
//            case .location: return
//            case .timer: return
//        }
    }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { return .popover }
        set {}
    }
    
    private var adapter: MenuPopoverAdapterProtocol
    
    private lazy var tableView: UITableView = adapter.tableView
    
    private weak var delegate: MenuPopoverDelegate?
    
    init(delegate: MenuPopoverDelegate?,
         adapter: MenuPopoverAdapterProtocol) {
        self.delegate = delegate
        self.adapter = adapter
        super.init(nibName: nil, bundle: nil)
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
        adapter.didSelectAction =  { [weak self] action in
            self?.dismiss(animated: true, completion: {
                self?.delegate?.didSelect(action: action)
            })
        }
    }
    
    private func setupUI() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalTo(self.view.safeAreaLayoutGuide.snp.verticalEdges)
            make.height.equalTo(adapter.contentHeight)
        }
    }

    private func setupPopover(sourceView: UIView) {
        preferredContentSize = CGSize(width: Const.contentWidth,
                                      height: <#T##Double#>)
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.delegate = self
        popoverPresentationController?.sourceRect = CGRect(x: sourceView.bounds.minX,
                                                           y: sourceView.bounds.minY,
                                                           width: .zero,
                                                           height: .zero)
    }
}

extension MenuPopoverVC: UIPopoverPresentationControllerDelegate {
    override func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

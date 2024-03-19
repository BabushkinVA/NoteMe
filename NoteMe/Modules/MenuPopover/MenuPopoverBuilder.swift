//
//  MenuPopoverBuilder.swift
//  NoteMe
//
//  Created by Vadim on 27.02.24.
//

import UIKit

final class MenuPopoverBuilder {
    private init() {}
    
    static func buildAddMenu(delegate: MenuPopoverDelegate,
                             sourceView: UIView) -> UIViewController {
        return build(delegate: delegate,
                     actions: [.calendar, .location, .timer],
                     sourceView: sourceView)
    }
    
    static func buildEditMenu(delegate: MenuPopoverDelegate,
                              sourceView: UIView) -> UIViewController {
        return build(delegate: delegate,
                     actions: [.edit, .delete],
                     sourceView: sourceView)
    }
    
    private static func build(delegate: MenuPopoverDelegate,
                              actions: [MenuPopoverVC.Action],
                              sourceView: UIView) -> UIViewController {
        let adapter = MenuPopoverAdapter(actions: actions)
        return MenuPopoverVC(delegate: delegate, 
                             adapter: adapter,
                             sourceView: sourceView)
    }
}

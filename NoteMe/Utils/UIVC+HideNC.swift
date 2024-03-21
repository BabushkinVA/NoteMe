//
//  UIVC+HideNC.swift
//  NoteMe
//
//  Created by Vadim on 24.02.24.
//

import UIKit

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

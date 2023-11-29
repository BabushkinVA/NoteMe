//
//  UIVC+hideNC.swift
//  NoteMe
//
//  Created by Vadim on 29.11.23.
//

import UIKit

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }    
}

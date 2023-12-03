//
//  TabBarAssembler.swift
//  NoteMe
//
//  Created by Vadim on 3.12.23.
//

import UIKit

final class TabBarAssembler {
    private init() {}
    
    static func make() -> UITabBarController {
        let tbc = TabBarController()
        
        tbc.navigationController?.pushViewController(tbc, animated: true)
        
        return tbc
    }
    
    
}

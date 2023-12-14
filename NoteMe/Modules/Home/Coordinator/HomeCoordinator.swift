//
//  HomeCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    override func start() -> UIViewController {
        return HomeAssembler.make()
    }
    
}

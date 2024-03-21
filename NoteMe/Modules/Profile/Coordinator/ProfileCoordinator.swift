//
//  ProfileCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 28.02.24.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    override func start() -> UIViewController {
        return ProfileAssembler.make()
    }
    
}

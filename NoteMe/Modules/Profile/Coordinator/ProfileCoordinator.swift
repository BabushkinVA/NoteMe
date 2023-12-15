//
//  ProfileCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    override func start() -> UIViewController {
        return ProfileAssembler.make()
    }
    
    
    
}

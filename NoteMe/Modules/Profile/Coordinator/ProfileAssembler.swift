//
//  ProfileAssembler.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class ProfileAssembler {
    private init() {}
    
    static func make() -> UIViewController {
        let viewModel = ProfileVM(adapter: ProfileAdapter())
        let vc = ProfileVC(viewModel: viewModel)
        
        return vc
    }
    
}

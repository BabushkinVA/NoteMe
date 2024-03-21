//
//  ProfileAssembler.swift
//  NoteMe
//
//  Created by Vadim on 28.02.24.
//

import UIKit

final class ProfileAssembler {
    private init() {}
    
    static func make() -> UIViewController {
        let vm = ProfileVM(adapter: ProfileAdapter())
        let vc = ProfileVC(viewModel: vm)
        return vc
    }
    
}

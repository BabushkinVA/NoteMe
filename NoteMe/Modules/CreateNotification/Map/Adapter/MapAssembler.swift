//
//  MapAssembler.swift
//  NoteMe
//
//  Created by Vadim on 23.03.24.
//

import UIKit

final class MapAssembler {
    private init() {}
    
    static func make(coordinator: MapCoordinator) -> UIViewController {
        let vm = MapVM(coordinator: coordinator)
        let vc = MapVC(viewModel: vm)
        return vc
    }
}

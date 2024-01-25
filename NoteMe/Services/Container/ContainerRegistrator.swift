//
//  ContainerRegistrator.swift
//  NoteMe
//
//  Created by Vadim on 16.01.24.
//

import Foundation

final class ContainerRegistrator {
    
    static func makeContainer() -> Container {
        let container = Container()
        
        container.register({ AlertService(container: container) })
        container.register({ AuthService() })
        container.register({ KeyboardHelper() })
        container.register({ InputValidator() })
        
        return container
    }
    
}

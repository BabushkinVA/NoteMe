//
//  ContainerRegistrator.swift
//  NoteMe
//
//  Created by Vadim on 28.02.24.
//

import Foundation

final class ContainerRegistrator {
    
    static func makeContainer() -> Container {
        let container = Container()
        
        container.register({ AlertService(container: container) })
        container.register({ AuthService() })
        container.register({ InputValidator() })
        container.register({ KeyboardHelper() })
        
        return container
    }
    
}

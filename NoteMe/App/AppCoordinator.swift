//
//  AppCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 21.11.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private var window: UIWindow
    
    init(scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
    }
    
    func startApp() {
        
        openTabBar()
        
//        //FIXME: - TEST CODE
//        ParametersHelper.set(.authenticated, value: false)
//        
//        if ParametersHelper.get(.authenticated) {
//            //open onboarding or mainApp
//            //            window.rootViewController = nil
//            openOnboardingModule()
//        } else {
//            openAuthModule()
//        }
    }
    
    private func openTabBar() {
        let vc = TabBarController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func openAuthModule() {
        let coordinator = LoginCoordinator()
        children.append(coordinator)
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func openOnboardingModule() {
        let coordinator = OnboardFirstStepCoordinator()
        children.append(coordinator)
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
}

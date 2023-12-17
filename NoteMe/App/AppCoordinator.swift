//
//  AppCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 21.11.23.
//

import UIKit
import Firebase

final class AppCoordinator: Coordinator {
    
    static var windowScene: UIWindowScene?
    
    private var window: UIWindow
    
    init(scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
        Self.windowScene = scene
    }
    
    func startApp() {
//        openOnboardingModule()
//        //FIXME: - TEST CODE
//        ParametersHelper.set(.authenticated, value: false)
//        ParametersHelper.set(.onboarded, value: false)
//        
        if ParametersHelper.get(.authenticated) {
            if ParametersHelper.get(.onboarded) {
                openMainApp()
            } else {
                openOnboardingModule()
            }
        } else {
            openAuthModule()
        }
    }
    
    private func openAuthModule() {
        let coordinator = LoginCoordinator()
        children.append(coordinator)
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
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
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func openMainApp() {
        let coordinator = MainTabBarCoordinator()
        children.append(coordinator)
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
}

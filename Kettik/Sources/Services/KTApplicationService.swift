//
//  KTApplicationService.swift
//  Kettik
//
//  Created by Tami on 01.05.2024.
//

import UIKit

final class KTApplicationService {
    
    @Injected(\.dataService) private var dataService: KTDataService
    @Injected(\.authorizationService) private var authorizationService: KTAuthorizationService
    
    private (set) var window: UIWindow?
    
    @MainActor func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KTLibsProvider.configure()
        return true
    }
    
    func handleSceneConnection(withWindow window: UIWindow?) {
        self.window = window
        
        window?.overrideUserInterfaceStyle = .light
        window?.rootViewController = getInitialController()
    }
}

extension KTApplicationService {
    
    func handleSplashCompletion() {
        if authorizationService.isAuthorized {
            let screen: KTTabScreen = .init()
            window?.rootViewController = screen
        } else {
            let screen: KTSignInScreen = .init()
            window?.rootViewController = KTNavigationController(rootViewController: screen)
        }
    }
    
    func handleSuccessAuthorization() {
        let screen: KTTabScreen = .init()
        window?.rootViewController = screen
    }
    
    func handleSignOut() {
        let screen: KTSignInScreen = .init()
        window?.rootViewController = KTNavigationController(rootViewController: screen)
    }
}

private extension KTApplicationService {
    
    func getInitialController() -> UIViewController {
        let screen: KTSplashScreen = .init()
        return screen
    }
}

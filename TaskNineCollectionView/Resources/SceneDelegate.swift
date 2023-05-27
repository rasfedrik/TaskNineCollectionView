//
//  SceneDelegate.swift
//  TaskNineCollectionView
//
//  Created by Семён Беляков on 25.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let vc = ViewController()
        let navController = UINavigationController(rootViewController: vc)

        window.rootViewController = navController
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
}

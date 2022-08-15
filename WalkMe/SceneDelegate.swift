//
//  SceneDelegate.swift
//  WalkMe
//
//  Created by David Havkin on 15/08/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("did become active")
        WalkBgManager.shared.monitorBackroundWalks(enabled: true)
    }
}


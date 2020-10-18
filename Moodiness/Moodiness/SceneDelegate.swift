//
//  SceneDelegate.swift
//  Moodiness
//
//  Created by Jerry Ren on 5/31/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    func sceneWillResignActive(_ scene: UIScene) {
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

public class Calcio {
    var sim: Array<double_t>
    init(sin: [double_t]) {
        self.sim = sin
    }
    func addolyn(q: String, p: String) -> String {
            let qpq = q + p + q
            return qpq
    }
}
     


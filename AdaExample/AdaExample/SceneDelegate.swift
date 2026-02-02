//
//  SceneDelegate.swift
//  AdaExample
//
//  Created by Pavlo Yevtukhov on 27.08.2025.
//

import AdaSdk
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        let window = UIWindow(windowScene: windowScene)
        let config = AdaConfig(
            pubId: "687cd4217bcba04b0304a514",
            tagId: "68b8003e39658705dc0e968e"
        )
        window.backgroundColor = .systemBackground
        window.rootViewController = BasicVC(config: config)
        // window.rootViewController = PreloadExampleVC(config: config)
        window.makeKeyAndVisible()
        self.window = window
    }

}


//
//  SceneDelegate.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(NetworkState.shared))
        self.window = window
        window.makeKeyAndVisible()
        
        let subscription = Subscription(channels: [Channel(name: .ticker,
                                                           product_ids: [makeProduct(.btc, .usd)])])
        NetworkService.main.connect(subscription: subscription)
        
    }
}


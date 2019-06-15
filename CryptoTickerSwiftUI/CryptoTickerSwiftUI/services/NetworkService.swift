//
//  NetworkService.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation
import Starscream
import SwiftUI
import Combine

class NetworkService {
    static let main = NetworkService()
    var currentSubscription: Subscription?
    
    private let feedURL = URL(string: "wss://ws-feed.pro.coinbase.com")!
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let socket: WebSocket
    
    
    
    init() {
        self.socket = WebSocket(url: feedURL)
        socket.onConnect = onConnect
        socket.onText = onText(text:)
        socket.onDisconnect = onDisconnect(error:)
    }
    
    func connect(subscription: Subscription) {
        self.currentSubscription = subscription
        socket.connect()
    }
    
    func onConnect() {
        guard let subscription = currentSubscription else {
            return
        }
        do {
            let data = try encoder.encode(subscription)
            socket.write(string: String(data: data, encoding: .utf8)!)
        } catch let error {
            print("JSON encoding error: \(error)")
        }
    }
    
    func onDisconnect(error: Error?) {
      
    }
    
    func onText(text: String) {
        do {
            guard let data = text.data(using: .utf8) else {
                    return
            }
            let json = try decoder.decode(Tick.self, from: data)
            if var ticks = NetworkState.shared.ticks[json.product_id] {
                ticks.append(json)
                NetworkState.shared.ticks[json.product_id] = ticks
            } else {
                NetworkState.shared.ticks[json.product_id] = [json]
            }
        } catch let error {
            print(error)
        }
    }
}

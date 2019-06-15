//
//  Subscription.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

struct Subscription: Codable {
    let type = "subscribe"
    let channels: [Channel]
}

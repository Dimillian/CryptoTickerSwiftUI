//
//  Channel.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

struct Channel: Codable {
    enum Name: String, Codable {
        case ticker
    }
    
    let name: Name
    let product_ids: [Product]
}

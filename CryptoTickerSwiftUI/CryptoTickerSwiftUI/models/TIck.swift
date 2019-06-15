//
//  TIck.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation
import SwiftUI

struct Tick: Codable, Identifiable {
    enum Side: String, Codable {
        case buy, sell
    }
    
    let id = UUID()
    let product_id: Product
    let price: String
    let side: Side
}

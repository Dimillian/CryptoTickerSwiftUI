//
//  NetworkState.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class NetworkState: BindableObject {
    static let shared = NetworkState()
    
    var didChange = PassthroughSubject<NetworkState, Never>()
    
    var ticks: [Product: [Tick]] = [:] {
        didSet {
            didChange.send(self)
        }
    }
}

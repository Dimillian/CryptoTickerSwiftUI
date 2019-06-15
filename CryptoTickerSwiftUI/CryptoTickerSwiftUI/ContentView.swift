//
//  ContentView.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @EnvironmentObject var state: NetworkState
    
    var body: some View {
        List(state.ticks[makeProduct(.btc, .usd)] ?? []) { tick in
            Text(tick.price)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NetworkState.shared)
    }
}
#endif

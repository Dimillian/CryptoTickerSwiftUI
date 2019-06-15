//
//  Product.swift
//  CryptoTickerSwiftUI
//
//  Created by Thomas Ricouard on 15/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation

enum ProductCrypto: String, Codable {
    case eth = "ETH"
    case btc = "BTC"
    case ltc = "LTC"
}

enum ProductCurrency: String, Codable {
    case usd = "USD"
    case eur = "EUR"
}

typealias Product = String
typealias MakeProduct = (ProductCrypto, ProductCurrency) -> Product

let makeProduct: MakeProduct = { crypto, currency in
    return crypto.rawValue + "-" + currency.rawValue
}

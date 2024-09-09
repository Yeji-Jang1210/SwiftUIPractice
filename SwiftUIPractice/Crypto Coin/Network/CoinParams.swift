//
//  CoinParams.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/8/24.
//

import Foundation

final class Coinparams {
    
    struct TrendingResponse: Decodable {
        let coins: [Coin]
        let nfts: [NFT]
    }
}

struct Coin: Decodable, Hashable {
    let item: CoinItem
    
    enum CodingKeys: CodingKey {
        case item
    }
}

struct CoinItem: Decodable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let small: String
    let data: CoinData
    
    func formattedPrice() -> String {
        return String(format: "$%.4f", data.price)
    }
}

struct CoinData: Decodable, Hashable {
    let price: Double
    let price_change_percentage_24h: [String: Double]
    
    var krwData: Double {
        guard let data = price_change_percentage_24h["krw"] else {
            return 0.0
        }
        return data
    }
}

struct NFT: Decodable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    let data: NFTData
}

struct NFTData: Decodable {
    let floor_price: String
    let floor_price_in_usd_24h_percentage_change: String
    
    var roundedPercentage: Double {
        guard let result = Double(floor_price_in_usd_24h_percentage_change) else { return 0.0 }
        
        return result
    }
}

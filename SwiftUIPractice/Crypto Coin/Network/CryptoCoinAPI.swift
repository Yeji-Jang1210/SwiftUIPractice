//
//  CryptoCoinAPI.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/9/24.
//

import Foundation

struct CryptoCoinAPI {
    
    private init() { }
    
    static func callAPI<T: Decodable>(type: T.Type, api: NetworkType, completion: @escaping (T) -> Void) {
        URLSession.shared.dataTask(with: api.url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

enum NetworkType {
    case trending
    case chart(id: String)
    
    var url: URL {
        switch self {
        case .trending:
            return URL(string: "https://api.coingecko.com/api/v3/search/trending")!
        case .chart(let id):
            return URL(string:  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=krw&ids=\(id)")!
        }
    }
}

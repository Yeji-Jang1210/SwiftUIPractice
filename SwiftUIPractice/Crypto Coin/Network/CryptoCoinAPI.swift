//
//  CryptoCoinAPI.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/9/24.
//

import Foundation

struct CryptoCoinAPI {
    
    private init() { }

    static func fetchTrendingCoin(completion: @escaping (Coinparams.TrendingResponse) -> Void) {
        
        let url = URL(string: "https://api.coingecko.com/api/v3/search/trending")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Coinparams.TrendingResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func fetchChartCoin(_ id: String){
        
        let url = "https://api.coingecko.com/api/v3/coins/markets? vs_currency=krw&ids=\(id)"
    }
}

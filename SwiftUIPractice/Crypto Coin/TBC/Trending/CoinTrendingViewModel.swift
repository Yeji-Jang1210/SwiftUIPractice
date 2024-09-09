//
//  CoinTrendingViewModel.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/9/24.
//

import Foundation

final class CoinTrendingViewModel: ObservableObject {
    @Published var coinList: [CoinItem] = []
    @Published var nftList: [NFT] = []
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        CryptoCoinAPI.fetchTrendingCoin { response in
            self.coinList = response.coins.map { $0.item }
            self.nftList = response.nfts
        }
    }
    
    func convertCoinItemToCoinViewItem(_ index: Int, _ item: CoinItem) -> TrendingGridItem {
        return TrendingGridItem(rank: index+1, image: item.small, name: item.name, symbol: item.symbol, price: item.formattedPrice(), percentage: item.data.krwData)
    }
    
    func convertNFTToCoinViewItem(_ index: Int, _ item: NFT) -> TrendingGridItem {
        return TrendingGridItem(rank: index+1, image: item.thumb, name: item.name, symbol: item.symbol, price: item.data.floor_price, percentage: item.data.roundedPercentage)
    }
}



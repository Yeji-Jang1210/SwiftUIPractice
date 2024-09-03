//
//  UpbitDetailView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/3/24.
//

import SwiftUI

struct UpbitDetailView: View {
    
    var market: Market
    
    init(market: Market) {
        self.market = market
    }
    
    var body: some View {
        Text(market.englishName)
    }
}

#Preview {
    UpbitDetailView(market: Market(market: "test", koreanName: "test", englishName: "test"))
}

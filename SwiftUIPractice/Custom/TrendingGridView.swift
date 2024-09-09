//
//  TrendingGridView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/9/24.
//

import SwiftUI

struct TrendingGridItem {
    let rank: Int
    let image: String
    let name: String
    let symbol: String
    let price: String
    let percentage: Double
}


struct TrendingGridView: View {
    var item: TrendingGridItem
    
    init(_ item: TrendingGridItem) {
        self.item = item
    }
    
    var body: some View {
        HStack(spacing: 12){
            Text("\(item.rank)")
                .font(.title)
            
            if let url = URL(string: item.image){
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 32, height: 32)
            }
            
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(item.symbol)
                    .foregroundStyle(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text(item.price)
                    .font(.title3)
                Text(item.percentage.formattedPercentage())
                    .font(.system(size: 14))
                    .foregroundStyle(Color.getColorForValue(item.percentage))
                    
            }
        }
        .padding(8)
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}

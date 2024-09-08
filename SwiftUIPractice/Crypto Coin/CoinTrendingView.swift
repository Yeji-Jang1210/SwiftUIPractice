//
//  CoinTrendingView.swift
//  SwiftUITransitionNetwork
//
//  Created by 장예지 on 9/8/24.
//

import SwiftUI

struct CoinTrendingView: View {
    
    var rows = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24){
                    favoriteSectionView()
                    top15SectionView()
                    top7NFTView()
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .padding()
            .navigationTitle("Crypto Coin")
        }
    }
    
    func favoriteSectionView() -> some View {
        SectionView(title: "My Favorite"){
            ScrollView(.horizontal){
                LazyHStack(spacing: 20){
                    ForEach(0..<10){ index in
                        FavoriteView()
                    }
                }
            }
        }
    }
    
    func top15SectionView() -> some View {
        SectionView(title: "Top 15 Coin") {
            ScrollView(.horizontal){
                LazyHGrid(rows: rows){
                    ForEach(1..<16){ index in
                        VStack {
                            Top15CoinView(rank: index)

                            if index % 3 != 2 {
                                Divider()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func top7NFTView() -> some View {
        SectionView(title: "Top 7 NFT") {
            ScrollView(.horizontal){
                LazyHGrid(rows: rows){
                    ForEach(1..<7){ index in
                        VStack {
                            Top15CoinView(rank: index)

                            if index % 3 != 2 {
                                Divider()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Top15CoinView: View {
    var rank: Int
    
    init(rank: Int) {
        self.rank = rank
    }
    
    var body: some View {
        HStack(spacing: 12){
            Text("\(rank)")
                .font(.title)
            
            Image(systemName: "star.fill")
                .frame(width: 44, height: 44)
                
            VStack(alignment: .leading){
                Text("Solana")
                    .font(.system(size: 20, weight: .bold))
                
                Text("LTC")
                    .foregroundStyle(.gray)
            }
        
            Spacer()
            
            VStack(alignment: .trailing){
                Text("$0.4175")
                    .font(.title3)
                Text("+1.38%")
                    .foregroundStyle(.red)
            }
        }
        .padding()
    }
}


struct FavoriteView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 44){
                HStack(spacing: 14){
                    Image(systemName: "star")
                        .frame(width: 54, height: 54)
                        .background(.gray)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text("Bitcoin")
                            .font(.title2.bold())
                        Text("BTC")
                            .foregroundStyle(.gray)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8){
                    Text("￦"+69345355.formatted())
                        .font(.title3.bold())
                    
                    Text("+0.64%")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.red)
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.6, alignment: .leading)
            .padding(20)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct SectionView<Content: View>: View {
    
    var title: String
    let content: () -> Content
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            content()
        }
    }
}

#Preview {
    CoinTrendingView()
}

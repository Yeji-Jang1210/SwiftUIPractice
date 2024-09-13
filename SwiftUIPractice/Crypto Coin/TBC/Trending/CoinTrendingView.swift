//
//  CoinTrendingView.swift
//  SwiftUITransitionNetwork
//
//  Created by 장예지 on 9/8/24.
//

import SwiftUI

struct CoinTrendingView: View {
    
    var rows = Array(repeating: GridItem(.flexible()), count: 3)
    @StateObject private var viewModel = CoinTrendingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24){
                favoriteSectionView()
                top15SectionView($viewModel.coinList)
                top7NFTView($viewModel.nftList)
            }
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
        .padding()
        .navigationTitle("Crypto Coin")
    }
    
    func favoriteSectionView() -> some View {
        SectionView(title: "My Favorite"){
            LazyHStack(spacing: 20){
                ForEach(0..<10){ index in
                    FavoriteView()
                }
            }
        }
    }
    
    func top15SectionView(_ coins: Binding<[CoinItem]>) -> some View {
        SectionView(title: "Top 15 Coin") {
            LazyHGrid(rows: rows, spacing: 20){
                ForEach(Array(zip(viewModel.coinList.indices, viewModel.coinList)), id: \.1.id){ index, item in
                    VStack {
                        NavigationLink {
                            NavigationLinkWrapperView(ChartView(viewModel: ChartViewModel(id: item.id))
                                )
                            .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            TrendingGridView(viewModel.convertCoinItemToCoinViewItem(index, item))
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if index % 3 != 2 {
                            Divider()
                        }
                    }
                }
            }
        }
    }
    
    func top7NFTView(_ nfts: Binding<[NFT]>) -> some View {
        SectionView(title: "Top 7 NFT") {
            LazyHGrid(rows: rows, spacing: 20){
                ForEach(Array(zip(viewModel.nftList.indices, viewModel.nftList)), id: \.1.id){ index, item in
                    VStack {
                        TrendingGridView(viewModel.convertNFTToCoinViewItem(index, item))
                        
                        if index % 3 != 2 {
                            Divider()
                        }
                    }
                }
            }
        }
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
            
            ScrollView(.horizontal){
                content()
            }
        }
    }
}

//#Preview {
//    CoinTrendingView()
//}

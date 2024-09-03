//
//  UpbitView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/3/24.
//

import SwiftUI

struct UpbitView: View {
    
    @State var searchText: String = ""
    var filteredMarkets: Markets {
        return searchText.isEmpty ? markets : markets.filter{$0.englishName.contains(searchText)}
    }
    @State var markets: Markets = []
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack {
                    ForEach(filteredMarkets, id: \.self){ market in
                        NavigationLink {
                            UpbitDetailView(market: market)
                        } label: {
                            MarketCell(market: market)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search")
        }
        .task {
            UpbitAPI.fetchAllMarket { markets in
                self.markets = markets
            }
        }
    }
}

struct MarketCell: View {
    
    var market: Market
    @State var isSelected: Bool = false
    
    init(market: Market) {
        self.market = market
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 12){
                Image(systemName: "star.fill")
                    .frame(width: 44, height: 44)
                    .background(.green)
                    .tint(.yellow)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text(market.englishName)
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    Text(market.market)
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    isSelected.toggle()
                }, label: {
                    Image(systemName: isSelected ? "star.fill" : "star")
                        .foregroundStyle(.foreground)
                })
                
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UpbitView()
}

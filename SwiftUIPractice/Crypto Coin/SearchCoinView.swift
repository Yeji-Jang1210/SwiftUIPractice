//
//  SearchCoinView.swift
//  SwiftUITransitionNetwork
//
//  Created by 장예지 on 9/8/24.
//

import SwiftUI

struct SearchCoinView: View {
    //localizedStandardContains: 대소문자 구별 없이 검색
    @State var searchText: String = ""
    var filteredMarkets: Markets {
        return searchText.isEmpty ? markets : markets.filter{$0.englishName.localizedStandardContains(searchText)}
    }
    @State var markets: Markets = []
    
    var body: some View {
        ScrollView{
            listView()
        }
        .navigationTitle("Search")
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search")
        .onSubmit(of: .search) {
            print("검색완료: \(searchText)")
        }
        .task {
            UpbitAPI.fetchAllMarket { markets in
                self.markets = markets
            }
        }
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach(filteredMarkets, id: \.self){ market in
                NavigationLink {
                    NavigationLinkWrapperView(UpbitDetailView(market: market))
                } label: {
                    MarketCell(market: market)
                }
            }
        }
    }
}

#Preview {
    SearchCoinView()
}

//
//  MainTBC.swift
//  SwiftUITransitionNetwork
//
//  Created by 장예지 on 9/8/24.
//

import SwiftUI

enum Tab: Int, CaseIterable {
    case trending
    case search
    case favorite
    
    var view: AnyView {
        switch self {
        case .trending:
            return AnyView(CoinTrendingView())
        case .search:
            return AnyView(SearchCoinView())
        case .favorite:
            return AnyView(FavoriteCoinView())
        }
    }
    
    var icon: Image {
        switch self {
        case .trending:
            return Image(systemName: "chart.line.uptrend.xyaxis")
        case .search:
            return Image(systemName: "magnifyingglass")
        case .favorite:
            return Image(systemName: "case")
        }
    }
}

struct MainTBC: View {
    
    @State var index = 0
    
    var body: some View {
        TabView(selection: $index) {
            ForEach(Tab.allCases, id: \.rawValue){ tab in
                NavigationView {
                    tab.view
                }
                .tabItem {
                    tab.icon
                }
                .tag(tab.rawValue)
            }
        }
        .tint(.purple)
    }
}

//#Preview {
//    MainTBC()
//}

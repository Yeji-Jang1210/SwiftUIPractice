//
//  ChartViewModel.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/9/24.
//

import Foundation

final class ChartViewModel: ObservableObject {
    
    typealias Chart = Coinparams.ChartResponse
    
    init(id: String){
        print(id)
        CryptoCoinAPI.callAPI(type: Chart.self, api: .chart(id: id)) { response in
            dump(response)
        }
    }
}

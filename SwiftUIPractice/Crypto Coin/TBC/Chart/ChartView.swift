//
//  ChartView.swift
//  SwiftUITransitionNetwork
//
//  Created by 장예지 on 9/8/24.
//

import SwiftUI

struct ChartView: View {
    
    @ObservedObject private var viewModel: ChartViewModel
    
    init(viewModel: ChartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            HStack {
                Image(systemName: "star.fill")
                    .frame(width: 40, height: 40)
                    .background(.gray)
                
                Text("Solana")
                    .font(.largeTitle.bold())
            }
            
            VStack(alignment: .leading){
                Text("₩69,234,245")
                    .font(.largeTitle.bold())
                
                HStack{
                    Text("+3.22%")
                        .foregroundStyle(.red)
                    Text("Today")
                        .foregroundStyle(.gray)
                }
            }
            
            HStack(spacing: 80){
                VStack(alignment: .leading, spacing: 12){
                    Text("고가")
                        .font(.title3.bold())
                        .foregroundStyle(.red)
                    
                    Text("￦69,234,243")
                }
                
                VStack(alignment: .leading, spacing: 12){
                    Text("저가")
                        .font(.title3.bold())
                        .foregroundStyle(.blue)
                    
                    Text("￦69,234,245")
                }
            }
            
            HStack(spacing: 80){
                VStack(alignment: .leading, spacing: 12){
                    Text("신고점")
                        .font(.title3.bold())
                        .foregroundStyle(.red)
                    
                    Text("￦2,969,234,243")
                }
                
                VStack(alignment: .leading, spacing: 12){
                    Text("신저점")
                        .font(.title3.bold())
                        .foregroundStyle(.blue)
                    
                    Text("￦69,234,245")
                }
            }
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ChartView(viewModel: ChartViewModel(id: "000"))
}

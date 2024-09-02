//
//  OnboardingView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/2/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var isStartButtonTap: Bool = false
    @State var disabled = false
    var body: some View {
        NavigationStack {
            BasicButtonView(disabled: $disabled, buttonTitle: "시작하기"){
                Spacer()
                VStack {
                    Image("launch")
                    Image("launchImage")
                }
                .padding()
            } action: {
                isStartButtonTap = true
            }
            .navigationDestination(isPresented: $isStartButtonTap){
                ProfileSettingView()
                    .toolbarRole(.editor)
            }
        }
        .tint(.black)
        
    }
}

#Preview {
    OnboardingView()
}

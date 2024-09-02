//
//  BasicButtonView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/2/24.
//

import SwiftUI

struct BasicButtonView<T: View>: View{
    
    let buttonTitle: String
    let content: () -> T
    let action: () -> Void
    
    @Binding var disabled: Bool
    
    init(disabled: Binding<Bool>, buttonTitle: String, @ViewBuilder content: @escaping () -> T, action: @escaping () ->Void){
        self.buttonTitle = buttonTitle
        self.content = content
        self.action = action
        self._disabled = disabled
    }
    
    var body: some View {
        content()
        
        Spacer()
        
        Button(buttonTitle, action: action)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .background(disabled ? Color.gray : Color.blue, in: .capsule)
            .padding()
            .disabled(disabled)
            
    }
    
}

#Preview {
    
    BasicButtonView(disabled: .constant(false), buttonTitle: "시작하기"){
        Text("")
    } action: {
        
    }
    
}

//
//  NavigationLinkWrapperView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/5/24.
//

import SwiftUI

struct NavigationLinkWrapperView<Content: View>: View {
    
    let content: () -> Content
    
    init(_ content: @autoclosure @escaping () -> Content){
        self.content = content
        print("NavigationLinkWrapperView init")
    }
    
    var body: some View {
        content()
    }
}

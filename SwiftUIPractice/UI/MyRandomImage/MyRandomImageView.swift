//
//  MyRandomImageView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/4/24.
//

import SwiftUI

struct Section: Identifiable, Hashable {
    let id = UUID()
    var name: String
    let count: Int = 10
}

final class Sections {
    
    static var shared = Sections()
    private init(){}
    
    let url = URL(string: "https://picsum.photos/200/300")
    
    let sectionList = [
        Section(name: "첫번째 섹션"),
        Section(name: "두번째 섹션"),
        Section(name: "세번째 섹션"),
        Section(name: "네번째 섹션")
    ]
}

struct MyRandomImageView: View {
    
    @State var list = Sections.shared.sectionList
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($list, id: \.id){ section in
                    sectionHorizontalView(section)
                }
            }
            .navigationTitle("My Random Image")
        }
    }
    
    func sectionHorizontalView(_ section: Binding<Section>) -> some View {
        VStack(alignment: .leading){
            Text(section.wrappedValue.name)
            ScrollView(.horizontal){
                HStack {
                    ForEach(0..<10) { _ in
                        NavigationLinkWrapperView(SectionImageView(section: section))
                    }
                }
            }
        }
        .padding()
    }
}

struct SectionImageView: View {
    @Binding var section: Section
    
    var body: some View {
        AsyncImage(url: Sections.shared.url, scale: 1.0) { image in
            NavigationLink {
                NavigationLinkWrapperView(MyRandomDetailImageView(image: image, sectionName: $section.name))
            } label: {
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        } placeholder: {
            ProgressView()
        }
        .frame(width: 120, height: 160)
    }
}

struct MyRandomDetailImageView: View {
    
    @State var image: Image
    @Binding var sectionName: String
    
    init(image: Image, sectionName: Binding<String>) {
        self.image = image
        self._sectionName = sectionName
    }
    
    var body: some View {
        image
            .frame(width: 300, height: 400)
        
        TextField("섹션 이름을 입력해주세요", text: $sectionName)
            .padding()
    }
}

#Preview {
    MyRandomImageView()
}

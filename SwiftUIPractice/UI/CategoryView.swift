//
//  CategoryView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/4/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    var count: Int
}

let categoryItem = ["SF", "가족", "스릴러"]

struct CategoryView: View {
    @State private var text: String = ""
    @State private var list: [Category] = []
    
    var filteredList: [Category] {
        return text.isEmpty ? list : list.filter{ $0.name.contains(text) }
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(filteredList, id: \.id){ item in
                    HStack {
                        NavigationLink {
                            DetailCategoryView()
                        } label: {
                            HStack {
                                Image(systemName: "person")
                                Text("\(item.name)(\(item.count))")
                            }
                        }

                    }
                }
            }
            .navigationTitle("영화 검색")
            .toolbar {
                Button(action: {
                    list.append(Category(name: categoryItem.randomElement()!, count: .random(in: 1...100)))
                }, label: {
                    Text("추가")
                })
            }
        }
        .searchable(text: $text, placement: .navigationBarDrawer, prompt: "영화를 검색해보세요.")
        .onAppear {
            
        }
    }
}

struct DetailCategoryView: View {
    var body: some View {
        Text("dd")
    }
}

#Preview {
    CategoryView()
}

//
//  ProfileSettingView.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State var disabled: Bool = true
    @State var image: Image?
    @State var isSignUpTap: Bool = false
    @State var nickname: String = "" {
        didSet {
            updateDisabledState()
        }
    }

    @State var userMbti: [MBTI: Bool] = Dictionary(uniqueKeysWithValues: MBTI.allCases.map { ($0, false) }){
        didSet {
            updateDisabledState()
        }
    }
    
    var rows: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        
        BasicButtonView(disabled: $disabled, buttonTitle: "완료") {
            VStack(spacing: 40){
                if let image = image {
                    CharacterImageView(image: image)
                } else if let randomImage = Character.list.randomElement() {
                    CharacterImageView(image: randomImage)
                }
                
                TextField("닉네임을 입력해주세요:)", text: $nickname)
                    .padding(.horizontal)
                    .overlay(alignment: .bottom) {
                        Divider()
                            .frame(height: 1)
                            .overlay(Color(uiColor: UIColor.systemGray4))
                            .padding(.horizontal)
                            .offset(y: 12)
                        
                    }
                
                HStack(alignment: .top, spacing: 20){
                    Text("MBTI")
                        .font(.system(size: 24, weight: .bold))
                    
                    LazyHGrid(rows: rows){
                        ForEach(Array(zip(MBTI.allCases.indices, MBTI.allCases)), id: \.1.rawValue){ index, mbti in
                            Button(mbti.title) {
                                if let isSelected = userMbti[mbti] {
                                    if isSelected {
                                        userMbti[mbti]?.toggle()
                                    } else {
                                        let oppositeIndex = (index % 2 == 0) ? index + 1 : index - 1
                                        userMbti[MBTI(rawValue: oppositeIndex)!] = false
                                        userMbti[mbti]?.toggle()
                                    }
                                }
                            }
                            .fontWeight(.bold)
                            .foregroundStyle(userMbti[mbti]! ? .white : .gray)
                            .frame(minWidth: 60, minHeight: 60)
                            .background(userMbti[mbti]! ? .blue : .clear)
                            .clipShape(Circle())
                            .overlay{
                                Circle()
                                    .stroke(userMbti[mbti]! ? .clear : .gray, lineWidth: 1)
                            }
                        }
                    }
                }
            }
        } action: {
            isSignUpTap = true
        }
        .navigationTitle("PROFILE SETTING")
        .fullScreenCover(isPresented: $isSignUpTap){
            SignUpCompleteView()
        }
    }
    
    private func updateDisabledState() {
        disabled = !(nickname.count >= 4 && userMbti.values.filter { $0 == true }.count == 4)
    }
}

#Preview {
    ProfileSettingView()
}

struct CharacterImageView: View {
    
    @State var image: Image
    
    init(image: Image) {
        self.image = image
    }
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: 6)
            )
            .padding(.top)
    }
}

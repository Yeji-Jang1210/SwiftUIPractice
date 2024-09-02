//
//  Character.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/2/24.
//

import SwiftUI

struct Character {
    private init(){}
    
    static var maxCount = 11
    static var list: [Image] {
        
        var list: [Image] = []
        
        for i in 0...maxCount {
            if let image = getImage(num: i){
                list.append(image)
            }
        }
        
        return list
    }

    static func getImage(num: Int) -> Image? {
        return Image("profile_\(num)")
    }
}

//
//  Color+Extension.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/9/24.
//

import SwiftUI

extension Color {
    static func getColorForValue(_ value: Double) -> Color {
        return value > -1 ? .blue : .red
    }
}


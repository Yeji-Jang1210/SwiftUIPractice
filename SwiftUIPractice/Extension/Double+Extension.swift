//
//  Double+Extension.swift
//  SwiftUIPractice
//
//  Created by 장예지 on 9/9/24.
//

import Foundation

extension Double {
    func formattedPercentage() -> String {
        return "\(self > -1 ? "+" : "")\(String(format: "%.2f", self))%"
    }
}

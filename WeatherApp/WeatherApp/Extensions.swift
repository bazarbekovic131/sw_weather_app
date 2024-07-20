//
//  Extensions.swift
//  WeatherApp
//
//  Created by Akha on 27.12.2023.
//

import Foundation
import SwiftUI

extension Double {
    func roundDecimals(to decimalpoint: Int) -> String {
        return String(format: "%0.\(decimalpoint)f", self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}

//
//  Font+Custom.swift
//  MyFlights
//
//  Created by Marjan on 3/27/1400 AP.
//

import SwiftUI

struct CustomFont: ViewModifier {
    
    let size: CGFloat
    let font: Fonts
    
    func body(content: Content) -> some View {
        content
            .font(.custom(font.rawValue, size: size))
    }
}

extension View {
    func customFont(_ font: Fonts, size: CGFloat) -> some View {
        self.modifier(CustomFont(size: size, font: font))
    }
}

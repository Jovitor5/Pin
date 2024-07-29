//
//  ColorExtension.swift
//  Pin
//
//  Created by João Vitor Moreira on 22.07.24.
//

import SwiftUI
import Foundation


extension String {
   
    func fromHex() -> Color {
        var formaterHex: String = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        formaterHex = formaterHex.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        guard Scanner (string: formaterHex).scanHexInt64(&rgb) else {
            return .clear
        }
        
        return Color (.sRGB, red: Double((rgb & 0xFF0000)>>16)/255.0, green: Double((rgb & 0x00FF00)>>8)/255.0, blue: Double((rgb & 0x0000FF))/255.0)
    }
}

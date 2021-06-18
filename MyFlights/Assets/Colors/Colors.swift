//
//  Colors.swift
//  MyFlights
//
//  Created by Marjan on 3/26/1400 AP.
//

import SwiftUI

enum Colors: String, CaseIterable{
    
    case pink = "pink"
    case yellow = "yellow"
    case green = "green"
    case blue = "blue"
    case orange = "orange"
    case grey = "grey"
    case darkGreen = "darkGreen"
}

enum PastelColors: String, CaseIterable{
    
    case pink = "pink"
    case yellow = "yellow"
    case green = "green"
    case blue = "blue"
    case orange = "orange"
    
}

extension Colors{
    
    var color: Color{
        
        Color(self.rawValue)
        
    }
    
}

extension PastelColors{
    
    static func generateRandom(count: Int) -> [Color]{
        var resultSet = Set<Color>()
        while resultSet.count < count {
            let randomIndex = Int.random(in: 0...count-1)
            let randomColor = Colors.allCases[randomIndex].color
            resultSet.insert(randomColor)
        }
        return Array(resultSet)
    }
    
}

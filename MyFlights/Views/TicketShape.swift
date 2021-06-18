//
//  TicketShape.swift
//  MyFlights
//
//  Created by Marjan on 3/28/1400 AP.
//

import SwiftUI

struct TicketShape: Shape {
        
    func path(in rect: CGRect) -> Path {
        
        let cornerRadius: CGFloat = 13
        let circleRadius: CGFloat = 12
        
        return Path{ path in
            
            path.move(to: CGPoint(x: cornerRadius / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.width / 2 - circleRadius, y: 0))
            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: circleRadius, startAngle: .radians(.pi), endAngle: .radians(0), clockwise: true)
            path.addLine(to: CGPoint(x: rect.width - cornerRadius / 2, y: 0))
            path.addArc(center: CGPoint(x: rect.width - cornerRadius / 2, y: cornerRadius / 2), radius: cornerRadius / 2, startAngle: .radians(Double.pi * 3/2), endAngle: .radians(0), clockwise: false)
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius / 2))
            path.addArc(center: CGPoint(x: rect.width - cornerRadius / 2, y: rect.height - cornerRadius / 2), radius: cornerRadius / 2, startAngle: .radians(0), endAngle: .radians(Double.pi/2), clockwise: false)
            path.addLine(to: CGPoint(x: rect.width / 2 + circleRadius, y: rect.height))
            path.addArc(center: CGPoint(x: rect.width / 2, y: rect.height), radius: circleRadius, startAngle: .radians(0), endAngle: .radians(.pi), clockwise: true)
            path.addLine(to: CGPoint(x: cornerRadius / 2, y: rect.height))
            path.addArc(center: CGPoint(x: cornerRadius / 2, y: rect.height - cornerRadius / 2), radius: cornerRadius / 2, startAngle: .radians(Double.pi * 3/2), endAngle: .radians(.pi), clockwise: false)
            path.addLine(to: CGPoint(x: 0, y: cornerRadius / 2))
            path.addArc(center: CGPoint(x: cornerRadius / 2, y: cornerRadius / 2), radius: cornerRadius / 2, startAngle: .radians(.pi), endAngle: .radians(Double.pi * 3/2), clockwise: false)
        }
        
    }
    
}


struct TicketShape_Previews: PreviewProvider {
    static var previews: some View {
        TicketShape()
    }
}

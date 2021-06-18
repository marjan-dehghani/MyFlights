//
//  Line.swift
//  MyFlights
//
//  Created by Marjan on 3/27/1400 AP.
//

import SwiftUI

enum SwipeIndicatorType{
    case bottomToTop
    case topToBottom
}

struct SwipeIndicator: View {
    
    let type: SwipeIndicatorType
    private let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    @State private var padding: CGFloat = 0
    @State private var index: Int
    
    init(type: SwipeIndicatorType) {
        self.type = type
        switch type {
        case .bottomToTop:
            _index = State(wrappedValue: 4)
        case .topToBottom:
            _index = State(wrappedValue: 0)
        }
    }
    
    var body: some View{
        
        GeometryReader{ proxy in
            
            Capsule()
                .fill(Colors.grey.color.opacity(0.7))
                .frame(height: proxy.size.height / 4, alignment: .center)
                .padding(.horizontal, padding)
                .offset(y: CGFloat(index) * proxy.size.height / 4)
                .onReceive(timer, perform: { _ in
                    
                    if type == .bottomToTop{
                        
                        if index > 0{
                            
                            index = index - 1
                            padding += 8
                            
                        }else{
                            
                            index = 4
                            padding = 0
                        }
                        
                    }else {
                        
                        if index < 4{
                            
                            index = index + 1
                            padding += 8
                            
                        }else{
                            
                            index = 0
                            padding = 0
                        }
                        
                        
                    }
                    
                })
        }
        
    }
}

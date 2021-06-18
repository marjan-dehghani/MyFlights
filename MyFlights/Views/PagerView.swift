//
//  PagerView.swift
//  MyFlights
//
//  Created by Marjan on 3/26/1400 AP.
//

import SwiftUI

struct PagerView: View {
    
    
    //MARK: - VARIABLES
    let flights: [FlightSuggestion]
    private var randomColors: [Color]
    
    @Binding var index: Int
    @State private var offset: CGFloat = 0
    @State private var isUserSwiping: Bool = false
    @Binding private var canScrollUp: Bool
    @Binding private var canScrollDown: Bool
    
    //MARK: - init
    init(flights: [FlightSuggestion], index: Binding<Int>, canScrollUp: Binding<Bool>, canScrollDown: Binding<Bool>) {
        
        self.flights = flights
        self._index = index
        self.randomColors = PastelColors.generateRandom(count: self.flights.count)
        self._canScrollUp = canScrollUp
        self._canScrollDown = canScrollDown
    }
    
    
    //MARK: - BODY

    var body: some View {
        
        GeometryReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 0) {
                    ForEach(flights.indices, id: \.self) { i in
                        FlightView(flight: flights[i], color: randomColors[i])
                            .frame(width: proxy.size.width,
                                   height: proxy.size.height)
                    }
                }
            }
            .content
            .offset(y: isUserSwiping ? offset : CGFloat(self.index) * -proxy.size.height)
            .frame(height: proxy.size.height, alignment: .top)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.isUserSwiping = true
                        self.offset = value.translation.height + -proxy.size.height * CGFloat(self.index)
                    })
                    .onEnded({ value in
                                                    
                            if value.translation.height > 0{
                                
                                //pull down
                                
                                if self.index > 0{
                                    
                                    //is not top most view
                                    index -= 1
                                    updateScrollStates()
                                }
                                                                
                            }
                            
                            if value.translation.height < 0{
                                
                                //pull up
                                
                                if self.index < self.flights.count - 1{
                                    
                                    //is not bottom most view
                                    index += 1
                                    updateScrollStates()

                                }
                                
                            }
                            
                        withAnimation {
                            self.isUserSwiping = false
                        }
                    })
            )
        }
        
    }
    
    private func updateScrollStates(){
        withAnimation {
            canScrollUp = index > 0
            canScrollDown = index < self.flights.count - 1
        }
    }
    
}

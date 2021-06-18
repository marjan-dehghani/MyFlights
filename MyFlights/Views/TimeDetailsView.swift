//
//  TimeDetailsView.swift
//  MyFlights
//
//  Created by Marjan on 3/28/1400 AP.
//

import SwiftUI

struct TimeDetailsView: View {
    
    let flight: FlightSuggestion
    
    var body: some View{
        
        GeometryReader{ proxy in
            
            HStack{
                
                Text(flight.wrappedDepartureTime)
                    .customFont(.gilroy_medium, size: 18)
                    .lineSpacing(8)
                    .lineLimit(2)
                    .padding(.leading, 16)
                    .frame(width: proxy.size.width / 4)
                
                ZStack(alignment: .center){
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(height: 1)
                    Images.calendar.image
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                }
                
                Text(flight.wrappedArrivalTime)
                    .customFont(.gilroy_medium, size: 18)
                    .lineSpacing(8)
                    .lineLimit(2)
                    .padding(.leading, 16)
                    .frame(width: proxy.size.width / 4)
                
            }
            
        }
        
    }
    
}


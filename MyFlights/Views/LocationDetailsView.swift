//
//  LocationDetailsView.swift
//  MyFlights
//
//  Created by Marjan on 3/28/1400 AP.
//

import SwiftUI

struct LocationDetailsView: View {
    
    let flight: FlightSuggestion
    let color: Color
    
    var body: some View {
        
        GeometryReader{ proxy in
            
            ZStack{
                
                TicketShape()
                    .fill(color.opacity(0.3))
                    .frame(height: 100)

                HStack{
                    VStack(spacing: 8){
                        
                        Text("From")
                            .customFont(.gilroy_regular, size: 14)
                        Text(flight.wrappedCityCodeFrom)
                            .customFont(.gilroy_medium, size: 18)
                            .lineLimit(1)
                        Text(flight.wrappedCityFrom)
                            .customFont(.gilroy_regular, size: 14)
                            .lineLimit(1)
                        
                    }.padding(.leading, 16)
                    .frame(width: proxy.size.width / 4)
                    
                    ZStack(alignment: .center){
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(height: 1)
                        Images.plane.image
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                    }
                    
                    VStack(spacing: 8){
                        
                        Text("To")
                            .customFont(.gilroy_regular, size: 14)
                        Text(flight.wrappedCityCodeTo)
                            .customFont(.gilroy_medium, size: 18)
                            .lineLimit(1)
                        
                        Text(flight.wrappedCityTo)
                            .customFont(.gilroy_regular, size: 14)
                            .lineLimit(1)
                        
                        
                    }.padding(.trailing, 16)
                    .frame(width: proxy.size.width / 4)
                    
                }
            }
            
        }
    }
}

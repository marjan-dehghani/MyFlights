//
//  SearchLocationView.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//

import SwiftUI

struct FlightView: View {
    
    //MARK: - VARIABLES
    
    let flight: FlightSuggestion
    let color : Color
    @State private var imageIsAnimated = false
    
    
    //MARK: - BODY
    
    var body: some View {
        
        GeometryReader{ proxy in
            
            VStack(spacing: 16){
                
                AsyncImage(url: flight.destinationImageURL)
                    .aspectRatio(16/9, contentMode: .fill)
                    .cornerRadius(13)
                    .padding(.top, 8)
                    .shadow(color: color, radius: 5, x: 0, y: 0)
                
                LocationDetailsView(flight: flight, color: color)
                
                HStack(spacing: 12){
                    InfoBox(bgColor: color, value: flight.fly_duration ?? "", title: "Duration", icon: Images.alarmClock.image)
                    InfoBox(bgColor: color, value: flight.wrappedPrice, title: "Price", icon: Images.priceTag.image)
                }
                .frame(height: 52)
                
                TimeDetailsView(flight: flight)
                
                Spacer()
                
                Button("Book Now"){
                    if flight.wrappedDeepLink != nil && UIApplication.shared.canOpenURL(flight.wrappedDeepLink!){
                        UIApplication.shared.open(flight.wrappedDeepLink!)
                    }
                }.foregroundColor(.white)
                .frame(width: proxy.size.width / 3, height: 44)
                .customFont(.gilroy_semiBold, size: 17)
                .background(Colors.darkGreen.color)
                .cornerRadius(8)
                .padding(.bottom, 8)
                
            }
            .frame(height: proxy.size.height)
            .padding(.horizontal)
            
        }
    }
    
}

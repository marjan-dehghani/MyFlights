//
//  InfoBox.swift
//  MyFlights
//
//  Created by Marjan on 3/27/1400 AP.
//

import SwiftUI

struct InfoBox: View {
    
    let bgColor: Color
    let value: String
    let title: String
    let icon: Image
    
    var body: some View{
        
        HStack{
            
            ZStack{
                
                icon
                    .resizable()
                    .padding(8)
                
            }
            .background(Color.white)
            .cornerRadius(8)
            .aspectRatio(1.0, contentMode: .fit)
            .padding([.vertical, .leading], 8)
            .shadow(color: bgColor, radius: 3, x: 0, y: 0)
            
            VStack(spacing: 4){
                
                Text(value)
                    .customFont(.gilroy_semiBold, size: 16)
                    .foregroundColor(Colors.grey.color)
                
                Text(title)
                    .customFont(.gilroy_regular, size: 14)
                    .foregroundColor(Colors.grey.color)
            }
            .padding([.trailing], 8)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(bgColor.opacity(0.3))
        .cornerRadius(6)
        
    }
    
}

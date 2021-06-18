//
//  Images.swift
//  MyFlights
//
//  Created by Marjan on 3/27/1400 AP.
//

import SwiftUI

enum Images: String {
    
    case alarmClock = "ic_alarm_clock"
    case priceTag = "ic_price_tag"
    case locationPin = "ic_location_pin"
    case plane = "ic_plane"
    case calendar = "ic_calendar"
}

extension Images{
    
    var image: Image{
        
        Image(rawValue)
        
    }
    
}

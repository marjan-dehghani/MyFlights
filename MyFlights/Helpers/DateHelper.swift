//
//  DateHelper.swift
//  MyFlights
//
//  Created by Marjan on 3/26/1400 AP.
//

import Foundation

struct DateHelper {
    
    static let shared = DateHelper()
    
    enum DateFormats: String{
        case allNumeric = "dd/MM/yyyy"
        case precise = "MMM d, h:mm a"
    }
    
    var calendar: Calendar
    var formatter: DateFormatter
        
    init() {
        
        calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        
        formatter = DateFormatter()
        formatter.calendar = calendar
        
    }
        
    var startOfToday: Date{
        calendar.startOfDay(for: Date())
    }
    
    var endOfToday: Date?{
        calendar.date(byAdding: .day, value: 1, to: startOfToday)
    }
    
    func current(format: DateFormats) -> String?{
        formatter.dateFormat = format.rawValue
        return formatter.string(from: Date())
    }
    
    func convert(timestamp: Int, to format: DateFormats) -> String?{
        let timeinterval = TimeInterval(timestamp)
        let date = Date(timeIntervalSince1970: timeinterval)
        formatter.dateFormat = format.rawValue
        return formatter.string(from: date)
    }
    
}

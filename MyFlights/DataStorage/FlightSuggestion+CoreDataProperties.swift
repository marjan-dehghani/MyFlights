//
//  FlightSuggestion+CoreDataProperties.swift
//  MyFlights
//
//  Created by Marjan on 3/26/1400 AP.
//
//

import Foundation
import CoreData


extension FlightSuggestion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlightSuggestion> {
        return NSFetchRequest<FlightSuggestion>(entityName: "FlightSuggestion")
    }

    @NSManaged public var dTimeUTC: Int16
    @NSManaged public var aTimeUTC: Int16
    
    @NSManaged public var cityCodeTo: String?
    @NSManaged public var cityTo: String?
    @NSManaged public var countryCodeTo: String?
    @NSManaged public var countryNameTo: String?
    
    @NSManaged public var countryCodeFrom: String?
    @NSManaged public var countryNameFrom: String?
    @NSManaged public var cityFrom: String?
    @NSManaged public var cityCodeFrom: String?

    @NSManaged public var deepLink: String?
    
    @NSManaged public var price: Int16
    @NSManaged public var fly_duration: String?
    @NSManaged public var flyTo: String?
    @NSManaged public var id: String?
    @NSManaged public var mapIdto: String?
    @NSManaged public var suggestDate: Date?

    var destinationImageURL: URL{
        URL(string: Constants.imagesBaseURL + "\(mapIdto ?? "photos").jpg")!
    }
    
    var wrappedPrice: String{
        String(describing: price) + " €"
    }
    
    var wrappedCityCodeTo: String{
        cityCodeTo ?? "UNKNOWN"
    }
    
    var wrappedCityCodeFrom: String{
        cityCodeFrom ?? "UNKNOWN"
    }
    
    var wrappedCityTo: String{
        cityTo ?? "Unknown City"
    }
    
    var wrappedCityFrom: String{
        cityFrom ?? "Unknown City"
    }
    
    var wrappedCountryCodeFrom: String{
        countryCodeFrom ?? "UNKNOWN"
    }
    
    var wrappedCountryCodeTo: String{
        countryCodeTo ?? "UNKNOWN"
    }
    
    var wrappedCountryNameTo: String{
        countryNameTo ?? "Unknown"
    }
    
    var wrappedCountryNameFrom: String{
        countryNameFrom ?? "Unknown"
    }
    
    var wrappedDepartureTime: String{
        DateHelper.shared.convert(timestamp: Int(dTimeUTC), to: .precise) ?? "-"
    }
    
    var wrappedArrivalTime: String{
        DateHelper.shared.convert(timestamp: Int(aTimeUTC), to: .precise) ?? "-"
    }
    
    var wrappedDeepLink: URL?{
        guard let deepLink = deepLink else { return nil }
        return URL(string: deepLink)
    }
}

extension FlightSuggestion : Identifiable {

}

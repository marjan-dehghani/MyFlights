//
//  Data.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Flight : Codable {
	let id : String?
	let flyFrom : String?
	let flyTo : String?
	let cityFrom : String?
	let cityCodeFrom : String?
	let cityTo : String?
	let cityCodeTo : String?
	let countryFrom : CountryFrom?
	let countryTo : CountryTo?
	let dTime : Int?
	let dTimeUTC : Int?
	let aTime : Int?
	let aTimeUTC : Int?
	let type_flights : [String]?
	let nightsInDest : String?
	let quality : Double?
	let popularity : Int?
	let distance : Double?
	let duration : Duration?
	let fly_duration : String?
	let price : Int?
	let conversion : Conversion?
	let discount_data : Discount_data?
	let bags_price : Bags_price?
	let baglimit : Baglimit?
	let availability : Availability?
	let routes : [[String]]?
	let airlines : [String]?
	let route : [Route]?
	let booking_token : String?
	let deep_link : String?
	let tracking_pixel : String?
	let facilitated_booking_available : Bool?
	let pnr_count : Int?
	let has_airport_change : Bool?
	let technical_stops : Int?
	let throw_away_ticketing : Bool?
	let hidden_city_ticketing : Bool?
	let virtual_interlining : Bool?
	let mapIdfrom : String?
	let mapIdto : String?
	let hashtags : [String]?
	let transfers : [String]?
	let p1 : Int?
	let p2 : Int?
	let p3 : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case flyFrom = "flyFrom"
		case flyTo = "flyTo"
		case cityFrom = "cityFrom"
		case cityCodeFrom = "cityCodeFrom"
		case cityTo = "cityTo"
		case cityCodeTo = "cityCodeTo"
		case countryFrom = "countryFrom"
		case countryTo = "countryTo"
		case dTime = "dTime"
		case dTimeUTC = "dTimeUTC"
		case aTime = "aTime"
		case aTimeUTC = "aTimeUTC"
		case type_flights = "type_flights"
		case nightsInDest = "nightsInDest"
		case quality = "quality"
		case popularity = "popularity"
		case distance = "distance"
		case duration = "duration"
		case fly_duration = "fly_duration"
		case price = "price"
		case conversion = "conversion"
		case discount_data = "discount_data"
		case bags_price = "bags_price"
		case baglimit = "baglimit"
		case availability = "availability"
		case routes = "routes"
		case airlines = "airlines"
		case route = "route"
		case booking_token = "booking_token"
		case deep_link = "deep_link"
		case tracking_pixel = "tracking_pixel"
		case facilitated_booking_available = "facilitated_booking_available"
		case pnr_count = "pnr_count"
		case has_airport_change = "has_airport_change"
		case technical_stops = "technical_stops"
		case throw_away_ticketing = "throw_away_ticketing"
		case hidden_city_ticketing = "hidden_city_ticketing"
		case virtual_interlining = "virtual_interlining"
		case mapIdfrom = "mapIdfrom"
		case mapIdto = "mapIdto"
		case hashtags = "hashtags"
		case transfers = "transfers"
		case p1 = "p1"
		case p2 = "p2"
		case p3 = "p3"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		flyFrom = try values.decodeIfPresent(String.self, forKey: .flyFrom)
		flyTo = try values.decodeIfPresent(String.self, forKey: .flyTo)
		cityFrom = try values.decodeIfPresent(String.self, forKey: .cityFrom)
		cityCodeFrom = try values.decodeIfPresent(String.self, forKey: .cityCodeFrom)
		cityTo = try values.decodeIfPresent(String.self, forKey: .cityTo)
		cityCodeTo = try values.decodeIfPresent(String.self, forKey: .cityCodeTo)
		countryFrom = try values.decodeIfPresent(CountryFrom.self, forKey: .countryFrom)
		countryTo = try values.decodeIfPresent(CountryTo.self, forKey: .countryTo)
		dTime = try values.decodeIfPresent(Int.self, forKey: .dTime)
		dTimeUTC = try values.decodeIfPresent(Int.self, forKey: .dTimeUTC)
		aTime = try values.decodeIfPresent(Int.self, forKey: .aTime)
		aTimeUTC = try values.decodeIfPresent(Int.self, forKey: .aTimeUTC)
		type_flights = try values.decodeIfPresent([String].self, forKey: .type_flights)
		nightsInDest = try values.decodeIfPresent(String.self, forKey: .nightsInDest)
		quality = try values.decodeIfPresent(Double.self, forKey: .quality)
		popularity = try values.decodeIfPresent(Int.self, forKey: .popularity)
		distance = try values.decodeIfPresent(Double.self, forKey: .distance)
		duration = try values.decodeIfPresent(Duration.self, forKey: .duration)
		fly_duration = try values.decodeIfPresent(String.self, forKey: .fly_duration)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		conversion = try values.decodeIfPresent(Conversion.self, forKey: .conversion)
		discount_data = try values.decodeIfPresent(Discount_data.self, forKey: .discount_data)
		bags_price = try values.decodeIfPresent(Bags_price.self, forKey: .bags_price)
		baglimit = try values.decodeIfPresent(Baglimit.self, forKey: .baglimit)
		availability = try values.decodeIfPresent(Availability.self, forKey: .availability)
		routes = try values.decodeIfPresent([[String]].self, forKey: .routes)
		airlines = try values.decodeIfPresent([String].self, forKey: .airlines)
		route = try values.decodeIfPresent([Route].self, forKey: .route)
		booking_token = try values.decodeIfPresent(String.self, forKey: .booking_token)
		deep_link = try values.decodeIfPresent(String.self, forKey: .deep_link)
		tracking_pixel = try values.decodeIfPresent(String.self, forKey: .tracking_pixel)
		facilitated_booking_available = try values.decodeIfPresent(Bool.self, forKey: .facilitated_booking_available)
		pnr_count = try values.decodeIfPresent(Int.self, forKey: .pnr_count)
		has_airport_change = try values.decodeIfPresent(Bool.self, forKey: .has_airport_change)
		technical_stops = try values.decodeIfPresent(Int.self, forKey: .technical_stops)
		throw_away_ticketing = try values.decodeIfPresent(Bool.self, forKey: .throw_away_ticketing)
		hidden_city_ticketing = try values.decodeIfPresent(Bool.self, forKey: .hidden_city_ticketing)
		virtual_interlining = try values.decodeIfPresent(Bool.self, forKey: .virtual_interlining)
		mapIdfrom = try values.decodeIfPresent(String.self, forKey: .mapIdfrom)
		mapIdto = try values.decodeIfPresent(String.self, forKey: .mapIdto)
		hashtags = try values.decodeIfPresent([String].self, forKey: .hashtags)
		transfers = try values.decodeIfPresent([String].self, forKey: .transfers)
		p1 = try values.decodeIfPresent(Int.self, forKey: .p1)
		p2 = try values.decodeIfPresent(Int.self, forKey: .p2)
		p3 = try values.decodeIfPresent(Int.self, forKey: .p3)
	}

}

//
//  Route.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Route : Codable {
	let id : String?
	let combination_id : String?
	let flyFrom : String?
	let flyTo : String?
	let cityFrom : String?
	let cityCodeFrom : String?
	let cityTo : String?
	let cityCodeTo : String?
	let dTime : Int?
	let dTimeUTC : Int?
	let aTime : Int?
	let aTimeUTC : Int?
	let airline : String?
	let flight_no : Int?
	let operating_carrier : String?
	let operating_flight_no : String?
	let fare_basis : String?
	let fare_category : String?
	let fare_classes : String?
	let fare_family : String?
	let returnValue : Int?
	let latFrom : Double?
	let lngFrom : Double?
	let latTo : Double?
	let lngTo : Double?
	let mapIdfrom : String?
	let mapIdto : String?
	let bags_recheck_required : Bool?
	let guarantee : Bool?
	let last_seen : Int?
	let refresh_timestamp : Int?
	let equipment : String?
	let vehicle_type : String?
	let original_return : Int?
	let source : String?
	let found_on : String?
	let price : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case combination_id = "combination_id"
		case flyFrom = "flyFrom"
		case flyTo = "flyTo"
		case cityFrom = "cityFrom"
		case cityCodeFrom = "cityCodeFrom"
		case cityTo = "cityTo"
		case cityCodeTo = "cityCodeTo"
		case dTime = "dTime"
		case dTimeUTC = "dTimeUTC"
		case aTime = "aTime"
		case aTimeUTC = "aTimeUTC"
		case airline = "airline"
		case flight_no = "flight_no"
		case operating_carrier = "operating_carrier"
		case operating_flight_no = "operating_flight_no"
		case fare_basis = "fare_basis"
		case fare_category = "fare_category"
		case fare_classes = "fare_classes"
		case fare_family = "fare_family"
		case returnValue = "return"
		case latFrom = "latFrom"
		case lngFrom = "lngFrom"
		case latTo = "latTo"
		case lngTo = "lngTo"
		case mapIdfrom = "mapIdfrom"
		case mapIdto = "mapIdto"
		case bags_recheck_required = "bags_recheck_required"
		case guarantee = "guarantee"
		case last_seen = "last_seen"
		case refresh_timestamp = "refresh_timestamp"
		case equipment = "equipment"
		case vehicle_type = "vehicle_type"
		case original_return = "original_return"
		case source = "source"
		case found_on = "found_on"
		case price = "price"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		combination_id = try values.decodeIfPresent(String.self, forKey: .combination_id)
		flyFrom = try values.decodeIfPresent(String.self, forKey: .flyFrom)
		flyTo = try values.decodeIfPresent(String.self, forKey: .flyTo)
		cityFrom = try values.decodeIfPresent(String.self, forKey: .cityFrom)
		cityCodeFrom = try values.decodeIfPresent(String.self, forKey: .cityCodeFrom)
		cityTo = try values.decodeIfPresent(String.self, forKey: .cityTo)
		cityCodeTo = try values.decodeIfPresent(String.self, forKey: .cityCodeTo)
		dTime = try values.decodeIfPresent(Int.self, forKey: .dTime)
		dTimeUTC = try values.decodeIfPresent(Int.self, forKey: .dTimeUTC)
		aTime = try values.decodeIfPresent(Int.self, forKey: .aTime)
		aTimeUTC = try values.decodeIfPresent(Int.self, forKey: .aTimeUTC)
		airline = try values.decodeIfPresent(String.self, forKey: .airline)
		flight_no = try values.decodeIfPresent(Int.self, forKey: .flight_no)
		operating_carrier = try values.decodeIfPresent(String.self, forKey: .operating_carrier)
		operating_flight_no = try values.decodeIfPresent(String.self, forKey: .operating_flight_no)
		fare_basis = try values.decodeIfPresent(String.self, forKey: .fare_basis)
		fare_category = try values.decodeIfPresent(String.self, forKey: .fare_category)
		fare_classes = try values.decodeIfPresent(String.self, forKey: .fare_classes)
		fare_family = try values.decodeIfPresent(String.self, forKey: .fare_family)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		latFrom = try values.decodeIfPresent(Double.self, forKey: .latFrom)
		lngFrom = try values.decodeIfPresent(Double.self, forKey: .lngFrom)
		latTo = try values.decodeIfPresent(Double.self, forKey: .latTo)
		lngTo = try values.decodeIfPresent(Double.self, forKey: .lngTo)
		mapIdfrom = try values.decodeIfPresent(String.self, forKey: .mapIdfrom)
		mapIdto = try values.decodeIfPresent(String.self, forKey: .mapIdto)
		bags_recheck_required = try values.decodeIfPresent(Bool.self, forKey: .bags_recheck_required)
		guarantee = try values.decodeIfPresent(Bool.self, forKey: .guarantee)
		last_seen = try values.decodeIfPresent(Int.self, forKey: .last_seen)
		refresh_timestamp = try values.decodeIfPresent(Int.self, forKey: .refresh_timestamp)
		equipment = try values.decodeIfPresent(String.self, forKey: .equipment)
		vehicle_type = try values.decodeIfPresent(String.self, forKey: .vehicle_type)
		original_return = try values.decodeIfPresent(Int.self, forKey: .original_return)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		found_on = try values.decodeIfPresent(String.self, forKey: .found_on)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
	}

}

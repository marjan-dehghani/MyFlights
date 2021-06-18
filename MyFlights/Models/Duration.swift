//
//  Duration.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Duration : Codable {
	let departure : Int?
	let returnValue : Int?
	let total : Int?

	enum CodingKeys: String, CodingKey {

		case departure = "departure"
		case returnValue = "return"
		case total = "total"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		departure = try values.decodeIfPresent(Int.self, forKey: .departure)
        returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
	}

}

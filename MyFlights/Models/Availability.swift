//
//  Availability.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Availability : Codable {
	let seats : Int?

	enum CodingKeys: String, CodingKey {

		case seats = "seats"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		seats = try values.decodeIfPresent(Int.self, forKey: .seats)
	}

}

//
//  Seats.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Seats : Codable {
	let passengers : Int?
	let adults : Int?
	let children : Int?
	let infants : Int?

	enum CodingKeys: String, CodingKey {

		case passengers = "passengers"
		case adults = "adults"
		case children = "children"
		case infants = "infants"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		passengers = try values.decodeIfPresent(Int.self, forKey: .passengers)
		adults = try values.decodeIfPresent(Int.self, forKey: .adults)
		children = try values.decodeIfPresent(Int.self, forKey: .children)
		infants = try values.decodeIfPresent(Int.self, forKey: .infants)
	}

}

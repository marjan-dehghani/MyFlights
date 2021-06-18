//
//  Bags_price.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Bags_price : Codable {
	let hand : Double?
	let first : Double?
	let second : Double?

	enum CodingKeys: String, CodingKey {

		case hand = "hand"
		case first = "1"
		case second = "2"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		hand = try values.decodeIfPresent(Double.self, forKey: .hand)
		first = try values.decodeIfPresent(Double.self, forKey: .first)
		second = try values.decodeIfPresent(Double.self, forKey: .second)
	}

}

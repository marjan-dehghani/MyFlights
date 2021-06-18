//
//  Baglimit.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Baglimit : Codable {
	let hand_height : Int?
	let hand_length : Int?
	let hand_weight : Int?
	let hand_width : Int?
	let hold_dimensions_sum : Int?
	let hold_height : Int?
	let hold_length : Int?
	let hold_weight : Int?
	let hold_width : Int?

	enum CodingKeys: String, CodingKey {

		case hand_height = "hand_height"
		case hand_length = "hand_length"
		case hand_weight = "hand_weight"
		case hand_width = "hand_width"
		case hold_dimensions_sum = "hold_dimensions_sum"
		case hold_height = "hold_height"
		case hold_length = "hold_length"
		case hold_weight = "hold_weight"
		case hold_width = "hold_width"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		hand_height = try values.decodeIfPresent(Int.self, forKey: .hand_height)
		hand_length = try values.decodeIfPresent(Int.self, forKey: .hand_length)
		hand_weight = try values.decodeIfPresent(Int.self, forKey: .hand_weight)
		hand_width = try values.decodeIfPresent(Int.self, forKey: .hand_width)
		hold_dimensions_sum = try values.decodeIfPresent(Int.self, forKey: .hold_dimensions_sum)
		hold_height = try values.decodeIfPresent(Int.self, forKey: .hold_height)
		hold_length = try values.decodeIfPresent(Int.self, forKey: .hold_length)
		hold_weight = try values.decodeIfPresent(Int.self, forKey: .hold_weight)
		hold_width = try values.decodeIfPresent(Int.self, forKey: .hold_width)
	}

}

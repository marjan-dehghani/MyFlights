//
//  Discount_data.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Discount_data : Codable {
	let original_price : Int?

	enum CodingKeys: String, CodingKey {

		case original_price = "original_price"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		original_price = try values.decodeIfPresent(Int.self, forKey: .original_price)
	}

}

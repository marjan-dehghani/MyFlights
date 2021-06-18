//
//  All_prices.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct All_prices : Codable {
	let zeroToEleven : Int?

	enum CodingKeys: String, CodingKey {

		case zeroToEleven = "0-11"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        zeroToEleven = try values.decodeIfPresent(Int.self, forKey: .zeroToEleven)
	}

}

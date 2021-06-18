//
//  Conversion.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Conversion : Codable {
	let EUR : Int?

	enum CodingKeys: String, CodingKey {

		case EUR = "EUR"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        EUR = try values.decodeIfPresent(Int.self, forKey: .EUR)
	}

}

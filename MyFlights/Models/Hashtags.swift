//
//  Hashtags.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Hashtags : Codable {
	let count : Int?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case count = "count"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}

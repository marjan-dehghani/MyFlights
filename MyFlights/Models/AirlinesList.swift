//
//  AirlinesList.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//

import Foundation
struct AirlinesList : Codable {
	let filterName : String?

	enum CodingKeys: String, CodingKey {

		case filterName = "filterName"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		filterName = try values.decodeIfPresent(String.self, forKey: .filterName)
	}

}

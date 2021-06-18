//
//  Search_params.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct Search_params : Codable {
	let flyFrom_type : String?
	let to_type : String?
	let seats : Seats?

	enum CodingKeys: String, CodingKey {

		case flyFrom_type = "flyFrom_type"
		case to_type = "to_type"
		case seats = "seats"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		flyFrom_type = try values.decodeIfPresent(String.self, forKey: .flyFrom_type)
		to_type = try values.decodeIfPresent(String.self, forKey: .to_type)
		seats = try values.decodeIfPresent(Seats.self, forKey: .seats)
	}

}

//
//  FlightsSearchResult.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//


import Foundation
struct FlightsSearchResult : Codable {
	let search_id : String?
	let time : Int?
	let currency : String?
	let fx_rate : Int?
	let data : [Flight]?
	let _results : Int?
	let best_results : [String]?
	let search_params : Search_params?
	let hashtags : [Hashtags]?
	let location_hashtags : [String]?
	let airlinesList : [AirlinesList]?
	let airportsList : [String]?
	let all_airlines : [String]?
	let all_stopover_airports : [String]?
	let all_stopover_countries : [String]?
	let all_prices : All_prices?
	let del : Int?
	let currency_rate : Int?
	let connections : [String]?
	let refresh : [String]?
	let ref_tasks : [String]?

	enum CodingKeys: String, CodingKey {

		case search_id = "search_id"
		case time = "time"
		case currency = "currency"
		case fx_rate = "fx_rate"
		case data = "data"
		case _results = "_results"
		case best_results = "best_results"
		case search_params = "search_params"
		case hashtags = "hashtags"
		case location_hashtags = "location_hashtags"
		case airlinesList = "airlinesList"
		case airportsList = "airportsList"
		case all_airlines = "all_airlines"
		case all_stopover_airports = "all_stopover_airports"
		case all_stopover_countries = "all_stopover_countries"
		case all_prices = "all_prices"
		case del = "del"
		case currency_rate = "currency_rate"
		case connections = "connections"
		case refresh = "refresh"
		case ref_tasks = "ref_tasks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		search_id = try values.decodeIfPresent(String.self, forKey: .search_id)
		time = try values.decodeIfPresent(Int.self, forKey: .time)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		fx_rate = try values.decodeIfPresent(Int.self, forKey: .fx_rate)
		data = try values.decodeIfPresent([Flight].self, forKey: .data)
		_results = try values.decodeIfPresent(Int.self, forKey: ._results)
		best_results = try values.decodeIfPresent([String].self, forKey: .best_results)
		search_params = try values.decodeIfPresent(Search_params.self, forKey: .search_params)
		hashtags = try values.decodeIfPresent([Hashtags].self, forKey: .hashtags)
		location_hashtags = try values.decodeIfPresent([String].self, forKey: .location_hashtags)
		airlinesList = try values.decodeIfPresent([AirlinesList].self, forKey: .airlinesList)
		airportsList = try values.decodeIfPresent([String].self, forKey: .airportsList)
		all_airlines = try values.decodeIfPresent([String].self, forKey: .all_airlines)
		all_stopover_airports = try values.decodeIfPresent([String].self, forKey: .all_stopover_airports)
		all_stopover_countries = try values.decodeIfPresent([String].self, forKey: .all_stopover_countries)
		all_prices = try values.decodeIfPresent(All_prices.self, forKey: .all_prices)
		del = try values.decodeIfPresent(Int.self, forKey: .del)
		currency_rate = try values.decodeIfPresent(Int.self, forKey: .currency_rate)
		connections = try values.decodeIfPresent([String].self, forKey: .connections)
		refresh = try values.decodeIfPresent([String].self, forKey: .refresh)
		ref_tasks = try values.decodeIfPresent([String].self, forKey: .ref_tasks)
	}

}

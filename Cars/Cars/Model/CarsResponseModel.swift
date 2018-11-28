

import Foundation
struct CarsResponseModel : Codable {
	let alertEn : String?
	let alertAr : String?
	let error : Error?
	let refreshInterval : Int?
	let ticks : String?
	let count : Int?
	let endDate : Int?
	let sortOption : String?
	let sortDirection : String?
	let cars : [Cars]?

	enum CodingKeys: String, CodingKey {

		case alertEn = "alertEn"
		case alertAr = "alertAr"
		case error = "Error"
		case refreshInterval = "RefreshInterval"
		case ticks = "Ticks"
		case count = "count"
		case endDate = "endDate"
		case sortOption = "sortOption"
		case sortDirection = "sortDirection"
		case cars = "Cars"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		alertEn = try values.decodeIfPresent(String.self, forKey: .alertEn)
		alertAr = try values.decodeIfPresent(String.self, forKey: .alertAr)
        error = try values.decodeIfPresent(Error.self, forKey: .error)
        refreshInterval = try values.decodeIfPresent(Int.self, forKey: .refreshInterval)
        ticks = try values.decodeIfPresent(String.self, forKey: .ticks)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		endDate = try values.decodeIfPresent(Int.self, forKey: .endDate)
		sortOption = try values.decodeIfPresent(String.self, forKey: .sortOption)
		sortDirection = try values.decodeIfPresent(String.self, forKey: .sortDirection)
        cars = try values.decodeIfPresent([Cars].self, forKey: .cars)
	}

}

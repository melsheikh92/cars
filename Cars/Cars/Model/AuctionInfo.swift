

import Foundation
struct AuctionInfo : Codable {
	let bids : Int?
	let endDate : Int?
	let endDateEn : String?
	let endDateAr : String?
	let currencyEn : String?
	let currencyAr : String?
	let currentPrice : Int?
	let minIncrement : Int?
	let lot : Int?
	let priority : Int?
	let vATPercent : Int?
	let itemAuctionType : Int?
	let isModified : Int?
	let itemid : Int?
	let iCarId : Int?
	let iVinNumber : String?

	enum CodingKeys: String, CodingKey {

		case bids = "bids"
		case endDate = "endDate"
		case endDateEn = "endDateEn"
		case endDateAr = "endDateAr"
		case currencyEn = "currencyEn"
		case currencyAr = "currencyAr"
		case currentPrice = "currentPrice"
		case minIncrement = "minIncrement"
		case lot = "lot"
		case priority = "priority"
		case vATPercent = "VATPercent"
		case itemAuctionType = "itemAuctionType"
		case isModified = "isModified"
		case itemid = "itemid"
		case iCarId = "iCarId"
		case iVinNumber = "iVinNumber"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		bids = try values.decodeIfPresent(Int.self, forKey: .bids)
		endDate = try values.decodeIfPresent(Int.self, forKey: .endDate)
		endDateEn = try values.decodeIfPresent(String.self, forKey: .endDateEn)
		endDateAr = try values.decodeIfPresent(String.self, forKey: .endDateAr)
		currencyEn = try values.decodeIfPresent(String.self, forKey: .currencyEn)
		currencyAr = try values.decodeIfPresent(String.self, forKey: .currencyAr)
		currentPrice = try values.decodeIfPresent(Int.self, forKey: .currentPrice)
		minIncrement = try values.decodeIfPresent(Int.self, forKey: .minIncrement)
		lot = try values.decodeIfPresent(Int.self, forKey: .lot)
		priority = try values.decodeIfPresent(Int.self, forKey: .priority)
        vATPercent = try values.decodeIfPresent(Int.self, forKey: .vATPercent)
		itemAuctionType = try values.decodeIfPresent(Int.self, forKey: .itemAuctionType)
		isModified = try values.decodeIfPresent(Int.self, forKey: .isModified)
		itemid = try values.decodeIfPresent(Int.self, forKey: .itemid)
		iCarId = try values.decodeIfPresent(Int.self, forKey: .iCarId)
		iVinNumber = try values.decodeIfPresent(String.self, forKey: .iVinNumber)
	}

}

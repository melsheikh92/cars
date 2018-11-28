

import Foundation
import RealmSwift
class Cars : Codable , Object {
	let carID : Int?
	let image : String?
	let descriptionAr : String?
	let descriptionEn : String?
	let imgCount : Int?
	let sharingLink : String?
	let sharingMsgEn : String?
	let sharingMsgAr : String?
	let mileage : String?
	let makeID : Int?
	let modelID : Int?
	let bodyId : Int?
	let year : Int?
	let makeEn : String?
	let makeAr : String?
	let modelEn : String?
	let modelAr : String?
	let bodyEn : String?
	let bodyAr : String?
	let auctionInfo : AuctionInfo?

	enum CodingKeys: String, CodingKey {

		case carID = "carID"
		case image = "image"
		case descriptionAr = "descriptionAr"
		case descriptionEn = "descriptionEn"
		case imgCount = "imgCount"
		case sharingLink = "sharingLink"
		case sharingMsgEn = "sharingMsgEn"
		case sharingMsgAr = "sharingMsgAr"
		case mileage = "mileage"
		case makeID = "makeID"
		case modelID = "modelID"
		case bodyId = "bodyId"
		case year = "year"
		case makeEn = "makeEn"
		case makeAr = "makeAr"
		case modelEn = "modelEn"
		case modelAr = "modelAr"
		case bodyEn = "bodyEn"
		case bodyAr = "bodyAr"
		case auctionInfo = "AuctionInfo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		carID = try values.decodeIfPresent(Int.self, forKey: .carID)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		descriptionAr = try values.decodeIfPresent(String.self, forKey: .descriptionAr)
		descriptionEn = try values.decodeIfPresent(String.self, forKey: .descriptionEn)
		imgCount = try values.decodeIfPresent(Int.self, forKey: .imgCount)
		sharingLink = try values.decodeIfPresent(String.self, forKey: .sharingLink)
		sharingMsgEn = try values.decodeIfPresent(String.self, forKey: .sharingMsgEn)
		sharingMsgAr = try values.decodeIfPresent(String.self, forKey: .sharingMsgAr)
		mileage = try values.decodeIfPresent(String.self, forKey: .mileage)
		makeID = try values.decodeIfPresent(Int.self, forKey: .makeID)
		modelID = try values.decodeIfPresent(Int.self, forKey: .modelID)
		bodyId = try values.decodeIfPresent(Int.self, forKey: .bodyId)
		year = try values.decodeIfPresent(Int.self, forKey: .year)
		makeEn = try values.decodeIfPresent(String.self, forKey: .makeEn)
		makeAr = try values.decodeIfPresent(String.self, forKey: .makeAr)
		modelEn = try values.decodeIfPresent(String.self, forKey: .modelEn)
		modelAr = try values.decodeIfPresent(String.self, forKey: .modelAr)
		bodyEn = try values.decodeIfPresent(String.self, forKey: .bodyEn)
		bodyAr = try values.decodeIfPresent(String.self, forKey: .bodyAr)
        auctionInfo = try values.decodeIfPresent(AuctionInfo.self, forKey: .auctionInfo)
	}

}

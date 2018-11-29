

import Foundation
import RealmSwift
class Cars : Object,Decodable  {
    @objc  dynamic var carID : Int = 0
    @objc  dynamic var image : String?
    @objc  dynamic var descriptionAr : String?
    @objc  dynamic var descriptionEn : String?
    @objc  dynamic var imgCount : Int = 0
    @objc  dynamic var sharingLink : String?
    @objc  dynamic var sharingMsgEn : String?
    @objc  dynamic var sharingMsgAr : String?
    @objc  dynamic var mileage : String?
    @objc  dynamic var makeID : Int = 0
    @objc  dynamic var modelID : Int = 0
    @objc  dynamic var bodyId : Int = 0
    @objc  dynamic var year : Int = 0
    @objc  dynamic var makeEn : String?
    @objc  dynamic var makeAr : String?
    @objc  dynamic var modelEn : String?
    @objc  dynamic var modelAr : String?
    @objc  dynamic var bodyEn : String?
    @objc  dynamic var bodyAr : String?
    var auctionInfo : AuctionInfo?
    
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
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        carID = try values.decodeIfPresent(Int.self, forKey: .carID) ?? 0
        image = try values.decodeIfPresent(String.self, forKey: .image)
        descriptionAr = try values.decodeIfPresent(String.self, forKey: .descriptionAr)
        descriptionEn = try values.decodeIfPresent(String.self, forKey: .descriptionEn)
        imgCount = try values.decodeIfPresent(Int.self, forKey: .imgCount) ?? 0
        sharingLink = try values.decodeIfPresent(String.self, forKey: .sharingLink)
        sharingMsgEn = try values.decodeIfPresent(String.self, forKey: .sharingMsgEn)
        sharingMsgAr = try values.decodeIfPresent(String.self, forKey: .sharingMsgAr)
        mileage = try values.decodeIfPresent(String.self, forKey: .mileage)
        makeID = try values.decodeIfPresent(Int.self, forKey: .makeID) ?? 0
        modelID = try values.decodeIfPresent(Int.self, forKey: .modelID) ?? 0
        bodyId = try values.decodeIfPresent(Int.self, forKey: .bodyId) ?? 0
        year = try values.decodeIfPresent(Int.self, forKey: .year) ?? 0
        makeEn = try values.decodeIfPresent(String.self, forKey: .makeEn)
        makeAr = try values.decodeIfPresent(String.self, forKey: .makeAr)
        modelEn = try values.decodeIfPresent(String.self, forKey: .modelEn)
        modelAr = try values.decodeIfPresent(String.self, forKey: .modelAr)
        bodyEn = try values.decodeIfPresent(String.self, forKey: .bodyEn)
        bodyAr = try values.decodeIfPresent(String.self, forKey: .bodyAr)
        auctionInfo = try values.decodeIfPresent(AuctionInfo.self, forKey: .auctionInfo)
    }
    
}

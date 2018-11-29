

import Foundation
import RealmSwift
class  AuctionInfo : Object,Decodable{
    @objc dynamic var bids : Int = 0
    @objc dynamic var endDate : Int = 0
    @objc dynamic var endDateEn : String?
    @objc dynamic var endDateAr : String?
    @objc dynamic var currencyEn : String?
    @objc dynamic var currencyAr : String?
    @objc dynamic var currentPrice : Int = 0
    @objc dynamic var minIncrement : Int = 0
    @objc dynamic var lot : Int = 0
    @objc dynamic var priority : Int = 0
    @objc dynamic var vATPercent : Int = 0
    @objc dynamic var itemAuctionType : Int = 0
    @objc dynamic var isModified : Int = 0
    @objc dynamic var itemid : Int = 0
    @objc dynamic var iCarId : Int = 0
    @objc dynamic var iVinNumber : String?
    
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
    
    override class func primaryKey() -> String? {
        return "itemid"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bids = try values.decodeIfPresent(Int.self, forKey: .bids) ?? 0
        endDate = try values.decodeIfPresent(Int.self, forKey: .endDate) ?? 0
        endDateEn = try values.decodeIfPresent(String.self, forKey: .endDateEn)
        endDateAr = try values.decodeIfPresent(String.self, forKey: .endDateAr)
        currencyEn = try values.decodeIfPresent(String.self, forKey: .currencyEn)
        currencyAr = try values.decodeIfPresent(String.self, forKey: .currencyAr)
        currentPrice = try values.decodeIfPresent(Int.self, forKey: .currentPrice) ?? 0
        minIncrement = try values.decodeIfPresent(Int.self, forKey: .minIncrement) ?? 0
        lot = try values.decodeIfPresent(Int.self, forKey: .lot) ?? 0
        priority = try values.decodeIfPresent(Int.self, forKey: .priority) ?? 0
        vATPercent = try values.decodeIfPresent(Int.self, forKey: .vATPercent) ?? 0
        itemAuctionType = try values.decodeIfPresent(Int.self, forKey: .itemAuctionType) ?? 0
        isModified = try values.decodeIfPresent(Int.self, forKey: .isModified) ?? 0
        itemid = try values.decodeIfPresent(Int.self, forKey: .itemid) ?? 0
        iCarId = try values.decodeIfPresent(Int.self, forKey: .iCarId) ?? 0
        iVinNumber = try values.decodeIfPresent(String.self, forKey: .iVinNumber)
    }
    
    
}



import Foundation
import RealmSwift
class CarsResponseModel : Object,Decodable {
    @objc  dynamic var alertEn : String?
    @objc  dynamic var alertAr : String?
    var error : Error?
    @objc  dynamic var refreshInterval : Int = 0
    @objc  dynamic var ticks : String?
    var count : Int?
    var endDate : Int?
    @objc  dynamic var sortOption : String?
    @objc  dynamic var sortDirection : String?
    var cars : [Cars]?
    
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
    
    public required convenience   init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        alertEn = try values.decodeIfPresent(String.self, forKey: .alertEn)
        alertAr = try values.decodeIfPresent(String.self, forKey: .alertAr)
        error = try values.decodeIfPresent(Error.self, forKey: .error)
        refreshInterval = try values.decodeIfPresent(Int.self, forKey: .refreshInterval) ?? 0
        ticks = try values.decodeIfPresent(String.self, forKey: .ticks)
        count = try values.decodeIfPresent(Int.self, forKey: .count) ?? 0
        endDate = try values.decodeIfPresent(Int.self, forKey: .endDate) ?? 0
        sortOption = try values.decodeIfPresent(String.self, forKey: .sortOption)
        sortDirection = try values.decodeIfPresent(String.self, forKey: .sortDirection)
        cars = try values.decodeIfPresent([Cars].self, forKey: .cars)
    }
    
}


import Foundation
import RealmSwift
class Error : Object , Decodable {
    @objc  dynamic var code : String?
    @objc  dynamic var en : String?
    @objc  dynamic var ar : String?
    
    enum CodingKeys: String, CodingKey {
        
        case code = "code"
        case en = "en"
        case ar = "ar"
    }
    
    public required convenience   init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        en = try values.decodeIfPresent(String.self, forKey: .en)
        ar = try values.decodeIfPresent(String.self, forKey: .ar)
    }
    
}

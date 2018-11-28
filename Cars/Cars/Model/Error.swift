
import Foundation
struct Error : Codable {
    let code : String?
    let en : String?
    let ar : String?
    
    enum CodingKeys: String, CodingKey {
        
        case code = "code"
        case en = "en"
        case ar = "ar"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        en = try values.decodeIfPresent(String.self, forKey: .en)
        ar = try values.decodeIfPresent(String.self, forKey: .ar)
    }
    
}

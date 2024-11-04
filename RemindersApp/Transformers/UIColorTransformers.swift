

import Foundation
import UIKit
class UIColorTransformers: ValueTransformer {
    
    // serialize the color that you're going to pass in and it is going to bacsically return data
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil}
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
        
    }
    
    
    // take the data and then unarchive it backto color
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {return nil}
        
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return color
        } catch {
            return nil
        }
    }
}
// giúp mã hóa một đối tượng UIColor thành Data để lưu trữ, và giải mã Data trở lại UIColor khi cần dùng.

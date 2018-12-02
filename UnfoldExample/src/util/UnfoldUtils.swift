import UIKit

class UnfoldUtils {//TODO: ⚠️️ Rename to UnfoldUtil.
    /**
     * String
     * ⚠️️ add throws
     */
    static func value(_ dict:[String:Any],_ key:String) -> String?{
        if let value:Any = dict[key] {
            if let str = value as? String {return str}
            else {fatalError("type not supported: \(value)")}
        };return nil
    }
    /**
     * cgFloat
     * ⚠️️ add throws
     */
    static func value(_ dict:[String:Any],_ key:String) -> CGFloat{
        if let value:Any = dict[key] {
            if let str = value as? String {return CGFloat(Double(str)!)}
            else if let int = value as? Int {return CGFloat(int)}
            else {fatalError("type not supported: \(value)")}
        };return CGFloat.nan
    }
}

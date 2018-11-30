import Foundation
@testable import Utils
@testable import Element

/*Key*/
extension Section:UnFoldable{
    enum Key{
        static let group = "group"
    }
}
/*Unfold UI component*/
extension UnFoldable where Self:Section{
    var value: Any {
        get {fatalError("error: \(self)")}
        set {fatalError("error: in \(self) \(newValue)")}
    }
    /**
     * New
     */
    static func unfold(dict:[String:Any]) throws -> UnFoldable{
        let element:ElementConfig = .init(dict)
        return Section.init(size:element.size, id:element.id)
    }
}

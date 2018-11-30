import Foundation
@testable import Utils
@testable import Element
/*Key*/
extension TextButton:UnFoldable{
    enum Key{
        static let text = "text"
    }
}
/*Unfold component*/
extension UnFoldable where Self:TextButton{
    static func unfold(dict:[String:Any]) throws -> UnFoldable {
        let text:String = UnfoldUtils.value(dict, Key.text) ?? ""
        let element:ElementConfig = .init(dict)
        return TextButton.init(text: text, size: element.size, id: element.id)
    }
}

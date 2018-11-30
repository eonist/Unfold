import Foundation
@testable import Utils
@testable import Element
/*Key and get,set*/
extension TextArea:UnFoldable{
    enum Key{
        static let text = "text"
    }
    var value:Any {
        get{return self.getTextValue()}
        set{if let newValue:String = newValue as? String { self.setTextValue(newValue) }}
    }
}
/*Unfold the UI component*/
extension UnFoldable where Self:TextArea{
    static func unfold(dict: [String : Any]) throws -> UnFoldable {
        let elementConfig:ElementConfig = .init(dict)
        let text:String = UnfoldUtils.value(dict, "text") ?? ""
        return TextArea.init(text: text, size: elementConfig.size, id: elementConfig.id)
    }
}

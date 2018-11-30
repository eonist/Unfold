import Foundation
@testable import Utils
@testable import Element

/*Key & get,set*/
extension FilePicker:UnFoldable{
    enum Key{
        static let text = "text"
        static let input = "input"
        static let buttonText = "buttonText"
    }
    var value:Any {
        get{return self.textInput.inputText}//
        set{if let newValue:String = newValue as? String { self.textInput.setInputText(newValue) }}
    }
}
/*Unfold component*/
extension UnFoldable where Self:FilePicker{
    static func unfold(dict:[String:Any]) throws -> UnFoldable {
        let elementConfig:ElementConfig = .init(dict)
        let text:String = UnfoldUtils.value(dict, Key.text) ?? ""
        let inputText:String = UnfoldUtils.value(dict, Key.input) ?? ""
        let buttonText:String = UnfoldUtils.value(dict, Key.buttonText) ?? ""
        return FilePicker.init(text:(text: text, input: inputText, button: buttonText), size: elementConfig.size, id:elementConfig.id )
    }
}

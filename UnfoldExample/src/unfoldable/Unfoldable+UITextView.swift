import UIKit
import Spatial

/*Key and get,set*/
extension UITextView:UnFoldable{
   enum Key{
      static let text = "text"//0//"textView"
   }
   var value:Any {
      get{return self.text ?? ""}
      set{if let newValue:String = newValue as? String { self.text = (newValue) }}
   }
}
/*Unfold the UI component*/
extension UnFoldable where Self:UITextView{
   static func unfold(dict: [String : Any]) throws -> UnFoldable {
      let elementConfig:ElementConfig = .init(dict)
      let textView:UITextView = .init(frame: .zero)
      textView.text = UnfoldUtils.value(dict, key:Key.text/*"text"*/) ?? ""
      textView.tag = 0//elementConfig
      textView.activateSize{ view in
         return Constraint.size(view, size: elementConfig.size)
      }
      return textView
   }
}

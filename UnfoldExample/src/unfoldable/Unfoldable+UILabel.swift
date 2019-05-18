import UIKit
import Spatial

/*Key & get,set*/
extension UILabel: UnFoldable {
   enum Key {
      static let text = "text"
   }
   var value: Any {
      get { return self.text ?? "" }
      set { if let newValue: String = newValue as? String { self.text = (newValue) } }
   }
}
/*Unfold component*/
extension UnFoldable where Self: UILabel {
   static func unfold(dict: [String: Any]) throws -> UnFoldable {
      let elementConfig: ElementConfig = .init(dict)
      let label: UILabel = .init(frame: .zero)//(text: text, size: elementConfig.size, id: elementConfig.id)
      label.tag = 0//elementConfig.id
      label.text = UnfoldUtils.value(dict, key: Key.text) ?? ""
      label.activateSize { view in
         Constraint.size(view, size: elementConfig.size)
      }
      return label
   }
}

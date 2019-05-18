import UIKit
import Spatial

/*Key*/
extension UIButton: UnFoldable {
   enum Key {
      static let text = "text"
   }
}
/*Unfold component*/
extension UnFoldable where Self: UIButton {
   static func unfold(dict: [String: Any]) throws -> UnFoldable {
      let text: String = UnfoldUtils.value(dict, key: Key.text) ?? ""
      _ = text
      let config: ElementConfig = .init(dict)
      let button: UIButton = .init(frame:.zero)//.init(text: text, size: element.size, id: element.id)
      button.tag = 0//config.id
      button.activateSize { view in
         Constraint.size(view, size: config.size)
      }
      return button
   }
}

import UIKit

protocol ElementConfigurable {// Fixme: ⚠️️ rename to Configurable, or UIConfigurable etc? or UnfoldConfgurable ?? ?
   var elementConfig: ElementConfig { get }
   var size: CGSize { get }
   var parent: UIView? { get }
   var id: String? { get }
}
extension ElementConfigurable {
   var size: CGSize { return elementConfig.size }
   var id: String? { return elementConfig.id }
   var parent: UIView? { fatalError("err") }
}
/**
 * Fixme: ⚠️️ Rename to DefaultConfig?
 */
struct ElementConfig {/*Default Element config*/
   var size: CGSize
   let id: String? //Fixme: ⚠️️ rename to tag
   init(_ dict: [String: Any]) {
      let width: CGFloat = UnfoldUtils.value(dict, key: "width")
      let height: CGFloat = UnfoldUtils.value(dict, key: "height")
      size = CGSize(width: width, height: height)
      id = UnfoldUtils.value(dict, key: "id")
   }
}

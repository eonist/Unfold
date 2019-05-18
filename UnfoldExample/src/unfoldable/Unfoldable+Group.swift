import Foundation
import Spatial

/*Key*/
extension Group: UnFoldable {
   enum Key {
      static let group = 0//"group"
   }
}
/*Unfold UI component*/
extension UnFoldable where Self: Group {
   var value: Any {
      get { fatalError("error: \(self)") }
      set { fatalError("error: in \(self) \(newValue)") }
   }
   /**
    * New
    */
   static func unfold(dict: [String: Any]) throws -> UnFoldable {
      let config: ElementConfig = .init(dict)
      let group: Group = .init(frame: .zero)
      group.tag = 0//group.id
      group.activateSize { view in
         Constraint.size(view, size: config.size)
      }
      return group
   }
}

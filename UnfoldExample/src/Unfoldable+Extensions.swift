import UIKit

extension UnFoldable {
   /**
    * Unfold
    */
   static func unfold(dict: [String: Any]) throws -> UnFoldable {
      fatalError("error must be overridden in \(self)")
   }
   /**
    * Returns the UI component data
    */
   var value: Any {
      get { fatalError("error: \(self)") }
      set { fatalError("error: in \(self) \(newValue)") }
   }
   /**
    * Retrives a value
    * NOTE: Can't use generics because subscript doesn't support generics other than in classes
    */
   func retrieve<T>(_ path: [String]) throws -> T {
      return try UnfoldParser.value(self, path: path)
   }
   /**
    * EXAMPLE: self.apply([PrefsType.login,TextInput.Key.inputText],prefs.login)
    */
   func apply(_ path: [String], value: Any) {
      UnfoldModifier.applyData(self, path: path, value: value)
   }
   /**
    * New unfolds ui
    */
   //    func unfold(path:[String]) throws -> UnFoldable{
   //        return try UnfoldParser.unfoldable(parent:self, path)/*, let last = path.last*/
   //    }
}
//    var data: [String : Any] {
//        get {fatalError("error")}
//        set {fatalError("error")}
//    }
//    var data:[String:Any] {get set}//this should probably be just any? Fixme: Rename to unfoldData, as data is ambigiouse

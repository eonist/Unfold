import UIKit

protocol ElementConfigurable{//TODO: ⚠️️ rename to Configurable, or UIConfigurable etc? or UnfoldConfgurable ?? ?
   var elementConfig:ElementConfig {get}
   var size:CGSize {get}
   var parent:UIView? {get}
   var id:String? {get}
}
extension ElementConfigurable{
   var size:CGSize {return elementConfig.size}
   var id:String? {return elementConfig.id}
   var parent:UIView? {fatalError("err")}
}
//TODO: ⚠️️ Rename to DefaultConfig?
struct ElementConfig {/*Default Element config*/
   var size:CGSize
   let id:String?//TODO: ⚠️️ rename to tag
   init(_ dict:[String:Any]){
      let width:CGFloat = UnfoldUtils.value(dict, "width")
      let height:CGFloat = UnfoldUtils.value(dict, "height")
      size = CGSize(width:width,height:height)
      id = UnfoldUtils.value(dict, "id")
   }
}


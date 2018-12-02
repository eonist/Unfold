import UIKit
import JSONSugar
import FileSugar
/**
 * TODO: ⚠️️ Rename unFold to unfold
 * NOTE: https://github.com/Zewo/Reflection  (native swift KVC KeyValueCoding, but complex and brittle)
 * NOTE: 🔑 The reason we are not using Decodable available in swift 4. Is because it requires the use of required init. Which clutters up UI component classes. UnFold lib can be used along side UI components. Or not at all.
 * IMPORTANT: ⚠️️ The reason we don't use convenience init is because it cannot be overriden in extensions, But a static func can if its added inside  an extension that uses where and Self:ClassName. Also init cant be defined as a method pointer
 */
public class Unfold{
   /**
    * Creates UI components and adds them to a parent
    * TODO: ⚠️️ In the future you will use a json method that can take an [Any] that contains str and int for the path. so you can do path:["app",0,"repoView"] etc
    */
   public static func unFold(fileURL:String, path:String, parent:UIView){
      //      Swift.print("Unfold.unFold")
      guard let fileContent:String = FileParser.content(fileURL) else {fatalError("no content at: \(fileURL)")}
      guard let json:Any = JSONParser.json(fileContent) else {fatalError("content is not json: \(fileURL)")}
      guard let jsonDict:[String: Any] = JSONParser.dict(json) else {fatalError("fileURL: is incorrect: \(fileURL)")}
      unFold(jsonDict:jsonDict,path:path,parent:parent)
   }
   /**
    * Unfold many UI Items
    */
   public static func unFold(jsonDict:[String: Any], path:String, parent:UIView){
      guard let jsonDictItem:Any = jsonDict[path] else{fatalError("path is incorrect: \(path)")}
      unFold(jsonDictItem:jsonDictItem, parent:parent)
   }
   /**
    * New
    */
   public static func unFold(jsonDictItem:Any, parent:UIView){
      guard let jsonArr:[[String:Any]] = JSONParser.dictArr(jsonDictItem) else{fatalError("jsonDictItem: is incorrect")}
      unFold(jsonArr: jsonArr, parent: parent)
   }
   /**
    * New
    */
   public static func unFold(jsonArr:[[String:Any]], parent:UIView){
      jsonArr.forEach{ dict in
         guard let element:UIView = unFold(dict:dict) else{fatalError("unFold failed")}
         parent.addSubview(element)
         if let content:Any = dict["content"] {/*figure out if item has arg: content, if it does, then keep unfolding down hirerarchy*/
            //Swift.print("had content \(content)")
            unFold(jsonDictItem:content,parent:element)
         }
      }
   }
   /**
    * Initiates and returns a UI Component
    * TODO: maybe use generics
    */
   private static func unFold(dict:[String:Any]) -> UIView?{
      guard let type:String = dict["type"] as? String else {fatalError("type must be string")}
      //Swift.print("type: " + "\(type)")
      guard let unfoldMethod:UnFoldable.UnFoldMethod = Unfoldables.dict[type] else {fatalError("Type is not unFoldable: \(type)")}/*we return nil here instead of fatalError, as this method could be wrapped in a custom method to add other types etc*/
      let item = try? unfoldMethod(dict)
      //Swift.print("item: " + "\(item)")
      return item as? UIView
   }
}


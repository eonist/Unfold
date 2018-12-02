import UIKit

class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
}
class CustomView:UIView,UnFoldable{
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      //🏀
      //add json to assets
      //load json
      //access props in json
      //try to unfold UIButton and TextField
      //Layout ad style these
      
      Unfold.unFold(fileURL: "Config.Bundle.structure", path: 0 /*"mergeConflictView"*/,parent: self)
      Swift.print("unfold completed")
      self.apply([Key.issue, UITextView.Key.text], value: "Conflict: Local file is older than the remote file")
      self.apply([Key.file, UITextView.Key.text], value: "File: AppDelegate.swift")
      self.apply([Key.repo, UITextView.Key.text], value: "Repository: Element - iOS")
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension CustomView{
//   func setData(_ mergeConflict:MergeConflict){
//      Swift.print("MergeConflictView.setData")
//      self.apply([Key.issue], mergeConflict.issue)
//      self.apply([Key.file], mergeConflict.file)
//      self.apply([Key.repo], mergeConflict.repo)
//   }
   enum Key{
      static let issue = "0"//"issueText"
      static let file = "1"//"fileText"
      static let repo = "2"//"repoText"
//      static let keepLocal = "keepLocalVersion"
//      static let keepRemote = "keepRemoteVersion"
//      static let keepMixed = "keepMixedVersion"
//      static let applyAllConflicts = "applyAllConflicts"
//      static let applyAllRepos = "applyAllRepos"
   }
}

# Unfold
Unfold UI components

```swift
enum CompassDirection: CaseIterable {
    case north
    case south
    case east
    case west
}

CompassDirection.allCases // → [north, south, east, west]
CompassDirection.allCases.count // → 4



let caseList = CompassDirection.allCases
    .map { "\($0)" }
    .joined(separator: ", ")
// → "north, south, east, west"

```

```swift
 MergeConflictView:Element,UnFoldable,Closable

 Unfold.unFold(fileURL: Config.Bundle.structure,path: "mergeConflictView",parent: self)
        Swift.print("unfold completed")

        self.apply([Key.issue,Text.Key.text], "Conflict: Local file is older than the remote file")
        self.apply([Key.file,Text.Key.text], "File: AppDelegate.swift")
        self.apply([Key.repo,Text.Key.text], "Repository: Element - iOS")

        _ = radioButtonGroup

        lazy var radioButtonGroup:SelectGroup = {//TODO: ⚠️️  move this into an extension
        let buttons:[RadioButton] = ElementParser.children(self)
        let group = SelectGroup(buttons,buttons.first)
        group.addHandler(type: SelectGroupEvent.change, self.onSelectGroupChange)
        return group
    }()


    extension MergeConflictView{
    func setData(_ mergeConflict:MergeConflict){
        Swift.print("MergeConflictView.setData")
        self.apply([Key.issue], mergeConflict.issue)
        self.apply([Key.file], mergeConflict.file)
        self.apply([Key.repo], mergeConflict.repo)
    }
    enum Key{
        static let issue = "issueText"
        static let file = "fileText"
        static let repo = "repoText"
        static let keepLocal = "keepLocalVersion"
        static let keepRemote = "keepRemoteVersion"
        static let keepMixed = "keepMixedVersion"
        static let applyAllConflicts = "applyAllConflicts"
        static let applyAllRepos = "applyAllRepos"
    }




        let selectedRadioButtonId:String = (radioButtonGroup.selected as? ElementKind)?.id ?? {fatalError("error")}()
        Swift.print("selectedRadioButtonId: " + "\(String(describing: selectedRadioButtonId))")

        guard let isApplyAllConflictsChecked:Bool = try? self.retrieve([Key.applyAllConflicts])  else {fatalError("error")}
        Swift.print("isApplyAllConflictsChecked: " + "\(String(describing: isApplyAllConflictsChecked))")
        guard let isApplyApplyAllReposChecked:Bool = try? self.retrieve([Key.applyAllRepos]) else {fatalError("error")}
        Swift.print("isApplyApplyAllReposChecked: " + "\(String(describing: isApplyApplyAllReposChecked))")

        enum Key{
        static let repo = "repo"
        static let title = "title"
        static let desc = "desc"
    }
    /**
     * New
     */
    func setData(_ repoItem:RepoItem, _ commitMessage:CommitMessage, _ onCommitDialogComplete:@escaping Completed){
        self.onCommitDialogComplete = onCommitDialogComplete
        self.repoItem = repoItem
        self.apply([Key.repo,TextInput.Key.inputText],repoItem.title)
        self.apply([Key.title,TextInput.Key.inputText],commitMessage.title)
        self.apply([Key.desc,TextInput.Key.inputText],commitMessage.description)
    }
```
### Todo:

- Load remote images via NetworkSugar
- Use class name as identifier
- Load a UIbutton, a UILabel, UITextView
- Make the one-liners for spatial (prove that AL-Distro is the future)
- Ready Unfold for UIKit
- Move Programatic UIComponents to own Library
- Use CaseLiteral in enums to avoid setting double info in enum string cases etc case text = "text" etc
- make unfold a carthage lib, that can be used in external projects
- make unfold be more do, try centric

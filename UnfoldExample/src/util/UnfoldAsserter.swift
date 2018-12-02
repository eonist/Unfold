import UIKit

class UnfoldAsserter{
    /**
     * PARAM: id: is the id of the element
     */
    static func isMatch(_ unfoldable:UnFoldable, _ tag:Int) -> Bool{
        if let view = unfoldable as? UIView, view.tag == tag {/*found a match*/
            return true
        } else { /*no match*/
            return false
        }
    }
}

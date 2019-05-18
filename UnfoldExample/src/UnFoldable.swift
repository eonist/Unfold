import Foundation

/**
 * Consider adding default data methods in an extension that prints error if called to, or not as you probably wont be able to as easily override it etc
 */
protocol UnFoldable: AnyObject {
    /*Unfold metod signature, Fixme: ⚠️️ Move to extension?*/
    typealias UnFoldMethod = ([String: Any]) throws -> UnFoldable
    static func unfold(dict: [String: Any]) throws -> UnFoldable
    var value: Any { get set }
}

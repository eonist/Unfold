import Foundation

//Fixme: ⚠️️ Use typed erorrs instead, remove this extension

extension String: Error {}/*Then you can just throw a string*/

extension String: LocalizedError {/*adds error.localizedDescription*/
   public var errorDescription: String? { return self }
}

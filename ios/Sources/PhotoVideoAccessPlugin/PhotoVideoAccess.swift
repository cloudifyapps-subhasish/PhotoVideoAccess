import Foundation

@objc public class PhotoVideoAccess: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}

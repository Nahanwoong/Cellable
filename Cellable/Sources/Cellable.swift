import Foundation
import UIKit

public protocol Cellable {
    static var bundle: Bundle { get }
    static var Identifier: String { get }
}

extension Cellable {
    public static func loadXIB() -> UINib {
        return UINib(nibName: Identifier, bundle: bundle)
    }
}

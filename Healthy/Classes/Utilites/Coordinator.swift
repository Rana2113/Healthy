import Foundation
import UIKit

protocol Coordinator {
    var navigationControl: UINavigationController { get }

    func start()
}

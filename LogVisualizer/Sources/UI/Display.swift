import UIKit

public extension VisualLogHandler {
    static var logDisplayer: UIViewController {
        let controller = LogDisplayViewController()
        LogListener.shared.delegate = controller

        return controller
    }
}

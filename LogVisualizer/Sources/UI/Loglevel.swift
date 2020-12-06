import Logging
import UIKit

extension Logger.Level {
    var color: UIColor {
        switch self {
        case .trace:
            return UIColor(red: 174/255, green: 174/255, blue: 178/255, alpha: 1)
        case .debug:
            return UIColor(red: 59/255, green: 159/255, blue: 1, alpha: 1)
        case .info:
            return UIColor(red: 47/255, green: 217/255, blue: 91/255, alpha: 1)
        case .notice:
            return UIColor(red: 1, green: 210/255, blue: 38/255, alpha: 1)
        case .warning:
            return UIColor(red: 1, green: 126/255, blue: 0, alpha: 1)
        case .error:
            return UIColor(red: 1, green: 105/255, blue: 97/255, alpha: 1)
        case .critical:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}

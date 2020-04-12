import Foundation
import UIKit

struct ConfirmationAlert {

    func show(on viewController: UIViewController, title: String, message: String, yesText: String,
              noText: String, yesAction: @escaping () -> Void, noAction: @escaping () -> Void) {

        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)

        alertController.addAction(
            UIAlertAction(title: noText, style: .default, handler: { action in
                DispatchQueue.main.async {
                   viewController.dismiss(animated: true, completion: nil)
                   noAction()
                }
        }))

        alertController.addAction(
            UIAlertAction(title: yesText, style: .default, handler: { action in
                DispatchQueue.main.async {
                    viewController.dismiss(animated: false, completion: nil)
                    yesAction()
            }
        }))

        viewController.present(alertController, animated: true, completion: nil)
    }
}

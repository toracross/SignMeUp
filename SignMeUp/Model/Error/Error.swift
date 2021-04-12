//
//  Error.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

typealias ErrorHandler = ((UIAlertAction) -> Void)?

class Error {

    enum ErrorMessage {
        case custom(title: String, body: String)
        case missingInfo
        case special

        var details: (title: String, body: String) {
            switch self {
            case .custom(let title, let body):
                return (title: title, body: body)
            case .missingInfo:
                return (title: "Missing Information", body: "You must enter an email address and a password.")
            case .special:
                return (title: "The end", body: "It's the end, thanks for coming along!")
            }
        }
    }

    class func presentError(error: ErrorMessage, handler: ErrorHandler = nil) {
        let alert = UIAlertController(title: error.details.title, message: error.details.body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))

        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }

}

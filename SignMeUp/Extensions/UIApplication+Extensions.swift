//
//  UIApplication+Extensions.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

extension UIApplication {
    class func topViewController() -> UIViewController? {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first,
              let rootViewController = window.rootViewController else { return nil }
        
        var topController = rootViewController
        
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        return topController
    }
}


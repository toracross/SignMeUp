//
//  String+Extensions.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import Foundation

extension String {
    func isValidUrl() -> Bool {
        let regex = "((http|https|ftp)://)?((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}


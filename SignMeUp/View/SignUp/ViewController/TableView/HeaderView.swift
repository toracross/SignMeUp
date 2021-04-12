//
//  HeaderCell.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    // MARK: - Interface Outlets

    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var helpLabel: UILabel!
    
    // MARK: - Setup
    
    public func configure(headerText: String?, helpText: String?) {
        headerLabel.text = headerText
        helpLabel.text = helpText
    }

}

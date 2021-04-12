//
//  UserDetailCell.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

class UserDetailCell: UITableViewCell {
    
    // MARK: - Interface Outlets
    
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    // MARK: - Public Methods
    
    public func configure(delegate: ConfirmProfileViewModel?) {
        self.selectionStyle = .none
        
        urlLabel.text = delegate?.user.website
        nameLabel.text = delegate?.user.firstName
        emailLabel.text = delegate?.user.email
        
        if let website = delegate?.user.website, website.isValidUrl() {
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
            let underlineAttributedString = NSAttributedString(string: website, attributes: underlineAttribute)
            urlLabel.attributedText = underlineAttributedString
            urlLabel.textColor = .blue
        }
    }
}

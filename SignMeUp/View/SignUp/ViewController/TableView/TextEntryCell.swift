//
//  TextEntryCell.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

class TextEntryCell: UITableViewCell {
    
    override var inputAccessoryView: UIView? { customButton }
    override var canBecomeFirstResponder: Bool { true }
    
    // MARK: - Enum
    
    public enum TextEntryType {
        case firstName
        case emailAddress
        case password
        case website

        var placeholder: String {
            switch self {
            case .firstName: return "First Name"
            case .emailAddress: return "Email Address"
            case .password: return "Password"
            case .website: return "Website"
            }
        }

        var keyboardType: UIKeyboardType {
            switch self {
            case .emailAddress: return .emailAddress
            case .website: return .URL
            default: return .alphabet
            }
        }
    }

    // MARK: - Interface Outlets

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var view: UIView!

    // MARK: - Private Variables
    
    private var customButton: CustomButton?
    private var textEntryType: TextEntryType = .firstName
    private weak var delegate: CreateProfileViewModel?
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        styleView()
    }

    // MARK: - Public Methods
    
    public func configure(_ index: Int, _ delegate: CreateProfileViewModel?) {
        self.customButton = delegate?.customButton
        self.delegate = delegate
        self.selectionStyle = .none
        self.textEntryType = delegate?.cellConfiguration[index] ?? .firstName
        
        customButton?.button.setTitle("Submit", for: .normal)
        customButton?.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        textField.keyboardType = textEntryType.keyboardType
        textField.isSecureTextEntry = textEntryType == .password
        textField.placeholder(textEntryType.placeholder, #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.3294117647, alpha: 1))

        if index == 0 { becomeFirstResponder() }
    }

    // MARK: - Private Methods
    
    private func styleView() {
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        view.layer.cornerRadius = 12
    }
    
    @IBAction private func textFieldEditingChanged(_ sender: UITextField) {
        delegate?.textUpdated(sender.text, type: textEntryType)
    }
    
    @objc private func buttonPressed() {
        delegate?.submitButtonPressed()
    }

}

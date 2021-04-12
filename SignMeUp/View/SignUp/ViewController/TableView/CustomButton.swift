//
//  CustomButton.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

typealias ButtonAction = () -> ()

protocol CustomButtonDelegate: AnyObject {
    var action: ButtonAction { get }
}

class CustomButton: UIView {
    
    // MARK: - Interface Outlets

    @IBOutlet weak var button: UIButton!
    @IBOutlet private weak var view: UIView!
    
    // MARK: - Button Delegate

    private var delegate: CustomButtonDelegate?
    
    // MARK: - Public Methods
    
    public func configure(delegate: CustomButtonDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Interface Action

    @IBAction private func customButtonPressed(_ sender: UIButton) {
        delegate?.action()
    }
}

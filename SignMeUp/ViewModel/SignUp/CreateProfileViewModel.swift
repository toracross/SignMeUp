//
//  CreateProfileViewModel.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import Foundation

protocol CreateProfileDelegate: AnyObject {
    var cellConfiguration: [TextEntryCell.TextEntryType] { get }
    var customButton: CustomButton { get }
    var headerText: String { get }
    var helpText: String { get }
    var user: User? { get }
    
    func submitButtonPressed()
    func textUpdated(_ text: String?, type: TextEntryCell.TextEntryType)
}

class CreateProfileViewModel: CreateProfileDelegate {
    
    // MARK: - Public Variables
    
    public var cellConfiguration: [TextEntryCell.TextEntryType] = [.firstName, .emailAddress, .password, .website]
    public var customButton: CustomButton { .fromNib() }
    public var headerText: String { return "Profile Creation" }
    public var helpText: String { return "Use the form below to submit your portfolio. An email and password are required." }
    public var user: User?
    
    // MARK: - Private Variables
    
    private var coordinator: CreateProfileCoordinator
    private var controller: CreateProfileViewController
    
    // MARK: - Initializer
    
    init(coordinator: CreateProfileCoordinator, controller: CreateProfileViewController) {
        self.coordinator = coordinator
        self.controller = controller
        user = User()
    }

    // MARK: - Delegate Methods

    @objc func submitButtonPressed() {
        guard let user = user,
              let email = user.email,
              let password = user.password,
              !email.isEmpty && !password.isEmpty else {
            Error.presentError(error: .missingInfo)
            return
        }

        coordinator.didPressSubmitButton(user: user)
    }

    func textUpdated(_ text: String?, type: TextEntryCell.TextEntryType) {
        switch type {
        case .firstName: user?.firstName = text
        case .emailAddress: user?.email = text ?? ""
        case .password: user?.password = text ?? ""
        case .website: user?.website = text ?? ""
        }
    }
}

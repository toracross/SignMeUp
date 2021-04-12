//
//  ConfirmProfileViewModel.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

protocol ConfirmProfileDelegate: AnyObject {
    var coordinator: ConfirmProfileCoordinator { get }
    var controller: ConfirmProfileViewController { get }
    var customButton: CustomButton { get }
    var helpText: String { get }
    var user: User { get }

    func headerText() -> String
    func signInButtonPressed()
}

class ConfirmProfileViewModel: ConfirmProfileDelegate {

    // MARK: - Public Variables

    var coordinator: ConfirmProfileCoordinator
    var controller: ConfirmProfileViewController
    var customButton: CustomButton { .fromNib() }
    var helpText: String { "Your super-awesome portfolio has been successfully submitted! The details below will be public within your community!" }
    var user: User

    // MARK: - Initializer

    init(coordinator: ConfirmProfileCoordinator, controller: ConfirmProfileViewController, user: User) {
        self.coordinator = coordinator
        self.controller = controller
        self.user = user
    }

    // MARK: - Delegate Methods

    func headerText() -> String {
        guard let name = user.firstName, !name.isEmpty else { return "Hello!" }
        return "Hello, \(name)!"
    }

    @objc func signInButtonPressed() {
        coordinator.didPressSignInButton()
    }
}

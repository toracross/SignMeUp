//
//  AppCoordinator.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

class AppCoordinator {

    // MARK: - Private Variables

    private var window: UIWindow
    private var controller: UIViewController

    // MARK: - Initializer

    init(window: UIWindow, controller: UIViewController) {
        self.window = window
        self.controller = controller
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    convenience init() {
        self.init(window: UIWindow(), controller: UIViewController())
    }

    // MARK: - Public Methods

    func start() {
        let controller = CreateProfileViewController(coordinator: self)
        controller.modalPresentationStyle = .overFullScreen

        self.controller.present(controller, animated: false)
        self.controller = controller
    }
}

// MARK: - Coordinator

extension AppCoordinator: CreateProfileCoordinator {
    func didPressSubmitButton(user: User) {
        let controller = ConfirmProfileViewController(coordinator: self, user: user)
        controller.modalPresentationStyle = .overFullScreen

        self.controller.present(controller, animated: true)
        self.controller = controller
    }
}

extension AppCoordinator: ConfirmProfileCoordinator {
    func didPressSignInButton() {
        Error.presentError(error: .special)
    }
}

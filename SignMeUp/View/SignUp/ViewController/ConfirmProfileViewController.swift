//
//  ConfirmProfileViewController.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

protocol ConfirmProfileCoordinator: AnyObject {
    func didPressSignInButton()
}

class ConfirmProfileViewController: UIViewController {

    // MARK: - Class Overrides

    override var inputAccessoryView: UIView? { customButton }
    override var canBecomeFirstResponder: Bool { true }

    // MARK: - Interface Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private Variables

    private var delegate: ConfirmProfileViewModel?
    private var customButton: CustomButton?

    // MARK: - Initializer

    init(coordinator: ConfirmProfileCoordinator, user: User) {
        super.init(nibName: "ConfirmProfileViewController", bundle: nil)

        self.delegate = ConfirmProfileViewModel(coordinator: coordinator, controller: self, user: user)
        self.customButton = delegate?.customButton
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    // MARK: - Private Methods

    private func configureView() {
        let header = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(header, forHeaderFooterViewReuseIdentifier: "HeaderView")

        let cell = UINib(nibName: "UserDetailCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "UserDetailCell")

        tableView.delegate = self
        tableView.dataSource = self

        customButton?.button.setTitle("Sign In", for: .normal)
        customButton?.button.addTarget(delegate, action: #selector(delegate?.signInButtonPressed), for: .touchUpInside)

        becomeFirstResponder()
    }

}

extension ConfirmProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else { return nil }
        header.configure(headerText: delegate?.headerText(), helpText: delegate?.helpText)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as? UserDetailCell else { return UITableViewCell() }
        cell.configure(delegate: delegate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

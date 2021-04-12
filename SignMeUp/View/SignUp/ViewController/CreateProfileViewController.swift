//
//  CreateProfileViewController.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

protocol CreateProfileCoordinator: AnyObject {
    func didPressSubmitButton(user: User)
}

class CreateProfileViewController: UIViewController {
    
    // MARK: - Interface Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private Variables

    private var viewModel: CreateProfileViewModel?
    
    // MARK: - Initializer

    init(coordinator: CreateProfileCoordinator) {
        super.init(nibName: "CreateProfileViewController", bundle: nil)
        
        self.viewModel = CreateProfileViewModel(coordinator: coordinator, controller: self)
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
        let cell = UINib(nibName: "TextEntryCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "TextEntryCell")
        
        let header = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(header, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - UITableViewDelegate/UITableViewDataSource

extension CreateProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else { return nil }
        header.configure(headerText: viewModel?.headerText, helpText: viewModel?.helpText)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellConfiguration.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextEntryCell", for: indexPath) as? TextEntryCell else { return UITableViewCell() }
        cell.configure(indexPath.row, viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
}

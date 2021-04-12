//
//  ConfirmProfileViewController.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

protocol ConfirmProfileCoordinator: AnyObject {
    
}

class ConfirmProfileViewController: UIViewController {
    
    // MARK: - Initializer
    
    init(coordinator: ConfirmProfileCoordinator, user: User) {
        super.init(nibName: "ConfirmProfileViewController", bundle: nil)

    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}

//
//  CreateProfileViewController.swift
//  SignMeUp
//
//  Created by Wellison Pereira on 4/12/21.
//

import UIKit

protocol CreateProfileCoordinator: AnyObject {
    
}

class CreateProfileViewController: UIViewController {
    
    // MARK: - Initializer

    init(coordinator: CreateProfileCoordinator) {
        super.init(nibName: "CreateProfileViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}

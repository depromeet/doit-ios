//
//  SplashViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    // MARK: - UI elements
    private lazy var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(label)
        
        label.text = "Do it!"
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            if SettingsProvider.shared.isUserLoggedIn {
                let viewController = CustomTabBarController()
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.isNavigationBarHidden = true
                self?.makeRootViewController(viewController: navigationController)
            } else {
                let viewController = LoginViewController()
                self?.makeRootViewController(viewController: viewController)
            }
        }
    }
    
    private func makeRootViewController(viewController: UIViewController) {
        let applicationDelegate = (UIApplication.shared.delegate as? AppDelegate)
        applicationDelegate?.window?.rootViewController = viewController
        applicationDelegate?.window?.makeKeyAndVisible()
    }
}

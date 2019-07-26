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
    private lazy var logoImageView = UIImageView()
    private lazy var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(logoImageView)
        view.addSubview(label)
        
        logoImageView.image = UIImage(named: "loginDoItLogo")
        let text = NSMutableAttributedString(string: "오늘 할 일을 미루지 말고, 두잇",
                                             attributes: [
                                                .font: UIFont(name: "AppleSDGothicNeo-Regular",
                                                              size: 14.0)!,
                                                .foregroundColor: UIColor(white: 155.0 / 255.0,
                                                                          alpha: 1.0),
                                                .kern: -0.2
            ])
        text.addAttributes([
            .font: UIFont(name: "AppleSDGothicNeo-Bold", size: 14.0)!,
            .foregroundColor: UIColor.white
            ], range: NSRange(location: 16, length: 2))
        label.attributedText = text
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-35)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
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

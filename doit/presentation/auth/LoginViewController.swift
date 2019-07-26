//
//  LoginViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var logoImageView = UIImageView()
    private lazy var label = UILabel()
    private lazy var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blackFour
        view.addSubview(logoImageView)
        view.addSubview(label)
        view.addSubview(loginButton)
        
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
        
        loginButton.setTitle("카카오톡으로 로그인하기", for: .normal)
        loginButton.setTitleColor(.veryLightPink, for: .normal)
        loginButton.backgroundColor = .blackFive
        loginButton.titleLabel?.font = .loginButton
        loginButton.layer.roundCorners(radius: 4)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-35)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.left.equalToSuperview().inset(38)
            make.right.equalToSuperview().inset(38)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(46)
        }
        
        bindToSubViews()
    }
    
    private func bindToSubViews() {
        loginButton.rx.tap
            .bind { [weak self] in
                let session: KOSession = KOSession.shared();
                
                if session.isOpen() {
                    session.close()
                }
                
                session.open(completionHandler: { (error) -> Void in
                    
                    if !session.isOpen() {
                        if let error = error as NSError? {
                            switch error.code {
                            case Int(KOErrorCancelled.rawValue):
                                break
                            default:
                                print(error.localizedDescription)
                            }
                        }
                    }
                    print("Kakaotalk login complete")
                    print("Access token 🔑 : \(session.accessToken)")
                    
                    SettingsProvider.shared.isUserLoggedIn = true
                    
                    let viewController = CustomTabBarController()
                    let navigationController = UINavigationController(rootViewController: viewController)
                    navigationController.isNavigationBarHidden = true
                    self?.makeRootViewController(viewController: navigationController)
                })
        }.disposed(by: disposeBag)
    }
    
    private func makeRootViewController(viewController: UIViewController) {
        let applicationDelegate = (UIApplication.shared.delegate as? AppDelegate)
        applicationDelegate?.window?.rootViewController = viewController
        applicationDelegate?.window?.makeKeyAndVisible()
    }
}

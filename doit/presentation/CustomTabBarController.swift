//
//  CustomTabBarController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class CustomTabBarController: UIViewController {
    
    // MARK: - UI elements
    private lazy var navigationBar = NavgiationBarView()
    private lazy var innerView = UIView()
    private var disposeBag = DisposeBag()
    private var viewControllers = [GoalsViewController(), ProfileViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(innerView)
        view.addSubview(navigationBar)
        
        innerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        navigationBar.snp.makeConstraints { make in
            make.height.equalTo(116)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        let initialViewController = viewControllers.first!
        addChild(initialViewController)
        innerView.addSubview(initialViewController.view)
        initialViewController.didMove(toParent: self)
        
        initialViewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bindToSubViews()
    }
    
    private func bindToSubViews() {
        navigationBar
            .selectedIndex
            .debug()
            .bind { [weak self] index in
                guard let self = self else { return }
                let selectedViewController = self.viewControllers.item(at: index)!
                self.addChild(selectedViewController)
                self.innerView.addSubview(selectedViewController.view)
                selectedViewController.didMove(toParent: self)
            }
            .disposed(by: disposeBag)
        
        navigationBar
            .isHighlightButtonSelected
            .debug()
            .bind { [weak self] in
                let modalViewController = AddShootViewController()
                self?.present(modalViewController, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
    }
}

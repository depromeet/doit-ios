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
        
        view.backgroundColor = .black
        view.addSubview(innerView)
        view.addSubview(navigationBar)
        
        innerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(navigationBar.snp.top)
        }
        
        navigationBar.snp.makeConstraints { make in
            make.height.equalTo(82)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
            .bind { [weak self] index in
                guard let self = self else { return }
                let selectedViewController = self.viewControllers.item(at: index)!
                self.addChild(selectedViewController)
                self.innerView.addSubview(selectedViewController.view)
                selectedViewController.didMove(toParent: self)
                
                selectedViewController.view.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }
            .disposed(by: disposeBag)
        
        navigationBar
            .isHighlightButtonSelected
            .bind { [weak self] in
                let modalViewController = AddShootViewController()
                self?.present(modalViewController, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
    }
}

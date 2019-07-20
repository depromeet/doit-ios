//
//  AddShootViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class AddShootViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var navigationBar = UINavigationBar(frame: CGRect.zero)
    private lazy var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(navigationBar)
        view.addSubview(tableView)
        
        let navigationItem = UINavigationItem(title: "Goals")
        let closeImage = UIImage(named: "btnNaviBackN")
        let doneButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(done))
        
        navigationItem.leftBarButtonItem = doneButtonItem
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .black
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.delegate = self
        
        navigationBar.snp.makeConstraints { make in
            make.height.equalTo(88)
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)

            
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationBarDelegate
extension AddShootViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}


// MARK: - UIGestureRecognizerDelegate
extension AddShootViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
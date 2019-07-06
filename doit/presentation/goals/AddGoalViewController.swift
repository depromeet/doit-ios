//
//  AddGoalViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController {
    
    // MARK: - UI elements
    private lazy var navigationBar = UINavigationBar(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(navigationBar)
        
        let navigationItem = UINavigationItem(title: "Make Goal")
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
    
    @objc func done() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UINavigationBarDelegate
extension AddGoalViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

//
//  MainViewControlller.swift
//  happyhouse
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import Foundation
import RxSwift

class MainViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(label)
        
        label.text = "Do it right now!"
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
}

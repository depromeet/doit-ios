//
//  MainViewControlller.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import Foundation
import RxSwift

class MainViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var label = UILabel()
    private lazy var imagePickerButton = UIButton()
    private lazy var timerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(imagePickerButton)
        view.addSubview(timerButton)
        
        label.text = "Do it right now!"
        
        imagePickerButton.setTitle("사진찍으러 가기", for: .normal)
        imagePickerButton.setTitleColor(UIColor.black, for: .normal)
        
        timerButton.setTitle("타이머로 가기", for: .normal)
        timerButton.setTitleColor(UIColor.black, for: .normal)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imagePickerButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalToSuperview()
            make.right.equalTo(self.view.snp.centerX)
            make.bottom.equalToSuperview()
        }
        
        timerButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalTo(self.view.snp.centerX)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        
        bindToSubViews()
    }
    
    
    private func bindToSubViews() {
        
        imagePickerButton.rx.tap
            .bind {
                // TODO
                let viewController = ImagePickerViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
            }
            .disposed(by: disposeBag)
        
        timerButton.rx.tap
            .bind {
                let viewController = TimerViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
            }
            .disposed(by: disposeBag)
    }
}

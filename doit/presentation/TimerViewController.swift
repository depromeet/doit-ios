//
//  TimerViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class TimerViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    private var startedDate: Date = Date()
    private weak var timer: Timer?
    
    // MARK: - UI elements
    private lazy var label = UILabel()
    private lazy var startButton = UIButton()
    private lazy var pauseButton = UIButton()
    private lazy var resetButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(resetButton)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        startButton.setTitle("시작", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        
        pauseButton.setTitle("일시정지", for: .normal)
        pauseButton.setTitleColor(.black, for: .normal)
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalToSuperview()
            make.right.equalTo(self.view.snp.centerX)
            make.bottom.equalToSuperview()
        }
        
        pauseButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalTo(self.view.snp.centerX)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { timer in
            let timeElapsed = timer.fireDate - self.startedDate
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm SSS"
        })
        
        bindToSubViews()
    }
    
    private func bindToSubViews() {
        startButton.rx.tap
            .bind {
                self.startedDate = Date()
            }
            .disposed(by: disposeBag)
    }
}

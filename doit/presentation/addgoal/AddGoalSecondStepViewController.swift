//
//  AddGoalSecondStepViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddGoalSecondStepViewController: UIViewController {
    
    // MARK: - UI elements
    private lazy var navigationBar = UINavigationBar(frame: CGRect.zero)
    private lazy var progressBar = LinearProgressBar()
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var frequencyPicker = FrequencyPickerView()
    private lazy var membersPicker = MembersPickerView()
    private lazy var penaltyPicker = PenaltyPickerView()
    private lazy var colorPicker = ColorPickerView()
    private lazy var addGoalButton = AddGoalButton()
    
    private let selectedFrequency: BehaviorRelay<Frequency?> = BehaviorRelay(value: nil)
    private let selectedPenalty: BehaviorRelay<Penalty?> = BehaviorRelay(value: nil)
    private let selectedColor: BehaviorRelay<GoalColor?> = BehaviorRelay(value: nil)
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(navigationBar)
        view.addSubview(progressBar)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(frequencyPicker)
        contentView.addSubview(membersPicker)
        contentView.addSubview(penaltyPicker)
        contentView.addSubview(colorPicker)
        contentView.addSubview(addGoalButton)
        
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
            make.height.equalTo(44)
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(scrollView.snp.height)
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    
        frequencyPicker.snp.makeConstraints { make in
            make.height.equalTo(120)
            
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        membersPicker.snp.makeConstraints { make in
            make.height.equalTo(120)
            
            make.top.equalTo(frequencyPicker.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        penaltyPicker.snp.makeConstraints { make in
            make.height.equalTo(120)
            
            make.top.equalTo(membersPicker.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        colorPicker.snp.makeConstraints { make in
            make.height.equalTo(120)
            
            make.top.equalTo(penaltyPicker.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        addGoalButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            
            make.top.equalTo(colorPicker.snp.bottom).offset(18)
            make.left.equalToSuperview().inset(28)
            make.right.equalToSuperview().inset(28)
            make.bottom.lessThanOrEqualToSuperview().inset(30)
        }
        
        bindToSubViews()
        bindToViewModel()
    }
    
    @objc func done() {
        navigationController?.popViewController(animated: true)
    }
    
    func showSuccessDialog() {
        
    }
    
    private func bindToViewModel() {
        Frequency.allCases.forEach({ frequency in
            let button = FrequencyButton()
            button.frequency = frequency
            
            selectedFrequency
                .bind { selectedFrequency in
                    if button.frequency == selectedFrequency {
                        button.isOn = true
                    } else {
                        button.isOn = false
                    }
                }
                .disposed(by: disposeBag)
            
            button.rx.tap
                .bind { [weak self] in
                    self?.selectedFrequency.accept(frequency)
                }
                .disposed(by: disposeBag)
            
            frequencyPicker.stackView.addArrangedSubview(button)
        })
        
        Penalty.allCases.forEach({ penalty in
            let button = PenaltyButton()
            button.penalty = penalty
            
            selectedPenalty
                .bind { selectedPenalty in
                    if button.penalty == selectedPenalty {
                        button.isOn = true
                    } else {
                        button.isOn = false
                    }
                }
                .disposed(by: disposeBag)
            
            button.rx.tap
                .bind { [weak self] in
                    self?.selectedPenalty.accept(penalty)
                }
                .disposed(by: disposeBag)
            
            penaltyPicker.stackView.addArrangedSubview(button)
        })
        
        GoalColor.allCases.forEach({ color in
            let button = GoalColorButton()
            button.goalColor = color
            
            selectedColor
                .bind { selectedColor in
                    if button.goalColor == selectedColor {
                        button.isOn = true
                    } else {
                        button.isOn = false
                    }
                }
                .disposed(by: disposeBag)
            
            button.rx.tap
                .bind { [weak self] in
                    self?.selectedColor.accept(color)
                }
                .disposed(by: disposeBag)
            
            colorPicker.stackView.addArrangedSubview(button)
        })
        
        colorPicker.stackView.layoutIfNeeded()
        
        // TODO - Fix this!
        GoalColor.allCases.enumerated().forEach({ (index, color) in
            (colorPicker.stackView.arrangedSubviews[index] as? GoalColorButton)?.goalColor = color
        })
    }
    
    private func bindToSubViews() {
        Observable.combineLatest(
                selectedFrequency,
                selectedPenalty,
                selectedColor
            )
            .bind { [weak self] frequency, penalty, color in
                let canProceed = frequency != nil &&
                    penalty != nil &&
                    color != nil
                
                self?.addGoalButton.isEnabled = canProceed
            }
            .disposed(by: disposeBag)
        
        addGoalButton.button.rx.tap
            .bind { [weak self] in
                if let button = self?.addGoalButton, button.isEnabled {
                    let viewController = AddGoalSuccessDialogViewController()
                    viewController.modalPresentationStyle = .overFullScreen
                    viewController.modalTransitionStyle = .crossDissolve
                    viewController.dismissHandler = { [weak self] in
                       self?.goBackToGoals()
                    }
                    
                    self?.present(viewController, animated: true, completion: {})
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func goBackToGoals() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - UINavigationBarDelegate
extension AddGoalSecondStepViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}


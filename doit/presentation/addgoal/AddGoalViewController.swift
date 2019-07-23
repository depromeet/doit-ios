//
//  AddGoalViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AddGoalViewController: UIViewController {
    
    // MARK: - UI elements
    private lazy var navigationBar = UINavigationBar(frame: CGRect.zero)
    private lazy var progressBar = LinearProgressBar()
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var categoryPicker = CategoryPickerView()
    private lazy var titlePicker = TitlePickerView()
    private lazy var datePicker = DatePickerView()
    private lazy var verificationPicker = VerificationPickerView()
    private lazy var proceedButton = ProceedButton()
    
    private var disposeBag = DisposeBag()
    private let selectedCategory: BehaviorRelay<Category?> = BehaviorRelay(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(navigationBar)
        view.addSubview(progressBar)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(categoryPicker)
        contentView.addSubview(titlePicker)
        contentView.addSubview(datePicker)
        contentView.addSubview(verificationPicker)
        contentView.addSubview(proceedButton)
        
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
        
//        progressBar.snp.makeConstraints { make in
//            make.height.equalTo(3)
//            make.top.equalTo(navigationBar.snp.bottom)
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
        
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
        
        categoryPicker.snp.makeConstraints { make in
            make.height.equalTo(147)
            
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        titlePicker.snp.makeConstraints { make in
            make.top.equalTo(categoryPicker.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(titlePicker.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        verificationPicker.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            
        }
        
        proceedButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            
            make.top.equalTo(verificationPicker.snp.bottom)
            make.left.equalToSuperview().inset(28)
            make.right.equalToSuperview().inset(28)
            make.bottom.lessThanOrEqualToSuperview().inset(30)
        }
        
        // Needed for category picker
        view.layoutIfNeeded()
        
        bindToViewModel()
        bindToSubViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        progressBar.progress = 1.0
    }
    
    @objc func done() {
        navigationController?.popViewController(animated: true)
    }
    
    private func bindToViewModel() {
        categoryPicker.categoryTagsView.categoryTabs = Category.allCases.map { category in
            let button = CategoryTagButton(category: category)
            
            selectedCategory
                .bind { selectedCategory in
                    if button.category == selectedCategory {
                        button.isOn = true
                    } else {
                        button.isOn = false
                    }
                }
                .disposed(by: disposeBag)
            
            button.rx.tap
                .bind { [weak self] in
                    self?.selectedCategory.accept(category)
                }
                .disposed(by: disposeBag)
            return button
        }
    }
    
    private func bindToSubViews() {
        Observable.combineLatest(
                selectedCategory,
                titlePicker.title.rx.text,
                datePicker.start.rx.text,
                datePicker.end.rx.text
            )
            .bind { [weak self] category, title, start, end in
                let canProceed = category != nil &&
                                 (title?.isNotEmpty ?? false) &&
                                 (start?.isNotEmpty ?? false) &&
                                 (end?.isNotEmpty ?? false)
                
                self?.proceedButton.isEnabled = canProceed
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UINavigationBarDelegate
extension AddGoalViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

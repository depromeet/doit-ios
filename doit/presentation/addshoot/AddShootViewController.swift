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
    var goalId: Int?
    
    // MARK: - UI elements
    private lazy var navigationBar = UINavigationBar(frame: CGRect.zero)
    private lazy var placeHolderLabel = UILabel()
    private lazy var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Gradient backgroud
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.softBlue.cgColor, UIColor.purplyBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(navigationBar)
        view.addSubview(placeHolderLabel)
        view.addSubview(textView)
        
        let navigationItem = UINavigationItem(title: "Upload")
        let closeImage = UIImage(named: "btnNaviBackN")
        let doneButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(done))
        
        let cameraImage = UIImage(named: "cameraIcon")
        let imagePickerButtonItem = UIBarButtonItem(image: cameraImage, style: .plain, target: self, action: #selector(showImagePicker))
        
        navigationItem.leftBarButtonItem = doneButtonItem
        navigationItem.rightBarButtonItem = imagePickerButtonItem
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.delegate = self
        
        placeHolderLabel.font = .addShootTextView
        placeHolderLabel.textColor = UIColor.white.withAlphaComponent(0.7)
        placeHolderLabel.numberOfLines = 0
        placeHolderLabel.textAlignment = .center
        placeHolderLabel.text = """
                                오늘 Goal을 이루기 위해
                                어떤 노력했는지 적어주세요!
                                느낀 감정도 좋아요.
                                """
        
        textView.font = .addShootTextView
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.textAlignment = .center
        textView.returnKeyType = .done
        textView.delegate = self
        
        navigationBar.snp.makeConstraints { make in
            make.height.equalTo(44)
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)

            
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
        
        placeHolderLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.left.equalToSuperview().inset(60)
            make.right.equalToSuperview().inset(60)
            make.centerY.equalToSuperview()
        }
        
        bindToViewModel()
        bindToSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func showImagePicker() {
        let viewController = ImagePickerViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    private func bindToViewModel() {
        
    }
    
    private func bindToSubViews() {
        view.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                self?.textView.resignFirstResponder()
            }
            .disposed(by: disposeBag)
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

// MARK: - UITextViewDelegate
extension AddShootViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeHolderLabel.isHidden = true
        
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
        } else {
            placeHolderLabel.isHidden = true
        }
    }
}

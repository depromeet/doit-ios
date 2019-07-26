//
//  ImagePickerViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class ImagePickerViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var imageView = UIImageView()
    private lazy var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(button)
        
        button.setTitle("사진찍기", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(view.snp.width)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        bindToSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    private func bindToSubViews() {
        
        button.rx.tap
            .bind { [weak self] _ in
                // TODO
                let pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.allowsEditing = true
                pickerController.mediaTypes = ["public.image", "public.movie"]
                pickerController.sourceType = .camera
                self?.present(pickerController, animated: true, completion: {})
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension ImagePickerViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        picker.dismiss(animated: true, completion: {
            self.imageView.image = image
        })
    }
}

// MARK: - UINavigationControllerDelegate
extension ImagePickerViewController: UINavigationControllerDelegate {
    
}

// MARK: - UIGestureRecognizerDelegate
extension ImagePickerViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

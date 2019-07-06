//
//  GoalsViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import Foundation
import RxSwift

class GoalsViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var collectionView = UICollectionView(frame: CGRect.zero,
                                                       collectionViewLayout: PagingCollectionViewFlowLayout.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
        titleLabel.font = .title1
        titleLabel.textColor = . white
        titleLabel.text = "Do it"
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.masksToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(GoalViewCell.self, forCellWithReuseIdentifier: GoalViewCell.identifier)
        let itemSize = CGSize.init(width: 270,  height: 404)
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = itemSize
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(46)
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(404)
            
            make.left.equalToSuperview().inset(21)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bindToSubViews()
    }
    
    
    private func bindToSubViews() {
        
    }
}

// MARK: - UICollectionViewDataSource
extension GoalsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalViewCell.identifier, for: indexPath) as! GoalViewCell
        
//        let info = resultArray[indexPath.row]
//        cell.bind(to: info)
//        cell.button().addTarget(self, action: #selector(toggleSubscribeAction(_:)), for: .touchUpInside)
        cell.type = .addGoal
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let viewController = AddGoalViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GoalsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 9, bottom: 0, right: 9)
    }
    
}


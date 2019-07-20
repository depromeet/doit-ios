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
    private var viewModel: GoalsViewModel!
    
    // MARK: - UI elements
    private lazy var titleLabel = UILabel()
    private lazy var quoteLabel = UILabel()
    private lazy var collectionViewContainer = UIView()
    private lazy var collectionView = UICollectionView(frame: CGRect.zero,
                                                       collectionViewLayout: PagingCollectionViewFlowLayout.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(quoteLabel)
        view.addSubview(collectionViewContainer)
        
        collectionViewContainer.addSubview(collectionView)
        
        titleLabel.font = .title1
        titleLabel.textColor = .white
        titleLabel.text = "Do it"
        
        quoteLabel.font = .title2
        quoteLabel.textColor = .white
        quoteLabel.numberOfLines = 0
        quoteLabel.text = """
                          날도 더운데 목표를 이루러 왔네요!
                          오늘 하루도 화이팅
                          """
        
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
        
        quoteLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        collectionViewContainer.snp.makeConstraints { make in
            make.top.equalTo(quoteLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(404)
            
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        viewModel = GoalsViewModel()
        
        bindToViewModel()
        bindToSubViews()
        
        viewModel.fetchGoals()
    }
    
    private func bindToViewModel() {
        viewModel
            .goals
            .bind { [weak self] goals in
                self?.collectionView.reloadData()
            }
            .disposed(by: disposeBag)
    }
    
    private func bindToSubViews() {
        
    }
}

// MARK: - UICollectionViewDataSource
extension GoalsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.goals.value.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalViewCell.identifier, for: indexPath) as! GoalViewCell
        
        if indexPath.row == viewModel.goals.value.count {
            cell.type = .addGoal
        } else {
            cell.type = .normal
            cell.goal = viewModel.goals.value.item(at: indexPath.row)
            cell.button.rx.tap
                .debug()
                .bind { [weak self] _ in
                    
                }
                .disposed(by: cell.disposeBag)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.goals.value.count {
            let viewController = AddGoalViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GoalsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
}


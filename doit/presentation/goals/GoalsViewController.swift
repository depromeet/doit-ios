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
    private lazy var logoImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var quoteLabel = UILabel()
    private lazy var collectionViewContainer = UIView()
    private lazy var collectionView = UICollectionView(frame: CGRect.zero,
                                                       collectionViewLayout: PagingCollectionViewFlowLayout.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(quoteLabel)
        view.addSubview(collectionViewContainer)
        
        collectionViewContainer.addSubview(collectionView)
        
        logoImageView.image = UIImage(named: "goalsDoItIcon")
        
        let text = NSMutableAttributedString(string: "오늘 할 일을 미루지 말고, 두잇",
                                             attributes: [
                                                .font: UIFont(name: "AppleSDGothicNeo-Regular",
                                                              size: 14.0)!,
                                                .foregroundColor: UIColor(white: 155.0 / 255.0,
                                                                          alpha: 1.0),
                                                .kern: -0.2
            ])
        text.addAttributes([
            .font: UIFont(name: "AppleSDGothicNeo-Bold", size: 14.0)!,
            .foregroundColor: UIColor.white
            ], range: NSRange(location: 16, length: 2))
        quoteLabel.attributedText = text
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.masksToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(GoalViewCell.self, forCellWithReuseIdentifier: GoalViewCell.identifier)
        let itemSize = CGSize.init(width: 270,  height: 404)
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = itemSize
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        
        logoImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(33)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(52)
        }

        quoteLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(33)
            make.top.equalTo(logoImageView.snp.bottom).offset(15)
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
            cell.goal = viewModel.goals.value.item(at: indexPath.row)?.goal
            cell.button.rx.tap
                .bind { [weak self] _ in
                    
                }
                .disposed(by: cell.disposeBag)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.goals.value.count {
            // ADD GOAL
            let viewController = AddGoalFirstStepViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            // GOAL DETAIL
            let viewController = GoalDetailViewController()
            let goal = viewModel.goals.value.item(at: indexPath.row)?.goal
            viewController.goalId = goal?.id
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


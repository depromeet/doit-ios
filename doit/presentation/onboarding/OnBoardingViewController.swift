//
//  OnBoardingViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    // MARK: - UI elements
    private lazy var collectionView = UICollectionView(frame: CGRect.zero,
                                                       collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var startButton = UIButton()
    private lazy var pageControl = UIPageControl()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        view.addSubview(startButton)
        view.addSubview(pageControl)
        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(OnBoardingViewCell.self, forCellWithReuseIdentifier: OnBoardingViewCell.identifier)
        collectionView.isPagingEnabled = true
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        
        startButton.layer.roundCorners(radius: 4)
        startButton.backgroundColor = .blackFive
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.veryLightPink, for: .normal)
        startButton.titleLabel?.font = FontProvider.font(size: 15, weight: .bold)
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        startButton.alpha = 0.0
        
        pageControl.numberOfPages = OnBoardingPage.allCases.count
        pageControl.currentPageIndicatorTintColor = UIColor.burple
        pageControl.pageIndicatorTintColor = UIColor.burple.withAlphaComponent(0.25)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            
            make.left.equalTo(view).inset(24)
            make.right.equalTo(view).inset(24)
            
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(26)
            } else {
                make.bottom.equalTo(view).inset(26)
            }
        }
        
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(startButton).inset(50.5)
            make.centerX.equalTo(view)
        }
    }
    
    // MARK: - Actions
    @objc func start() {
        let viewController = LoginViewController()
        makeRootViewController(viewController: viewController)
    }
    
    // MARK: - Helpers
    private func showButton() {
        UIView.animate(withDuration: CATransaction.animationDuration(), animations: {
            self.startButton.alpha = 1.0
        })
    }
    
    private func hideButton() {
        UIView.animate(withDuration: CATransaction.animationDuration(), animations: {
            self.startButton.alpha = 0.0
        })
    }
    
    private func makeRootViewController(viewController: UIViewController) {
        let applicationDelegate = (UIApplication.shared.delegate as? AppDelegate)
        
        guard let window = applicationDelegate?.window else { return }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

// MARK: - UICollectionViewDataSource
extension OnBoardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return OnBoardingPage.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingViewCell.identifier, for: indexPath) as! OnBoardingViewCell
        let page =  OnBoardingPage.allCases[indexPath.row]
        cell.page = page
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension OnBoardingViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewOffset = scrollView.contentOffset.x
        let scrollViewWidth = scrollView.bounds.size.width
        
        if scrollViewWidth == 0 {
            return
        }
        
        let currentPage = Int(ceil(scrollViewOffset/scrollViewWidth))
        
        pageControl.currentPage = currentPage
        
        let lastPageIndex = OnBoardingPage.fifth.rawValue - 1
        
        if currentPage == lastPageIndex {
            showButton()
        } else {
            hideButton()
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    
    // Remove spacing between blocks
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

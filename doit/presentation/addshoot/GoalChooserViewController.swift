//
//  GoalChooserViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class GoalChooserViewController: UIViewController {
    
    // MARK: - UI elements
    private var viewModel: GoalChooserViewModel!
    private var disposeBag = DisposeBag()
    
    // MARK: - UI elements
    private lazy var navigationBar = UINavigationBar(frame: CGRect.zero)
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(navigationBar)
        view.addSubview(tableView)
        
        let navigationItem = UINavigationItem(title: "Goals")
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
        
        tableView.rowHeight = 97
        tableView.register(GoalChooserViewCell.self,
                           forCellReuseIdentifier: GoalChooserViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        
        navigationBar.snp.makeConstraints { make in
            make.height.equalTo(44)
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            
            
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).offset(83)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        viewModel = GoalChooserViewModel()
        
        bindToViewModel()
        bindToSubViews()
        
        viewModel.fetchGoals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    private func bindToViewModel() {
        viewModel
            .goals
            .bind { [weak self] _ in
                self?.tableView.reloadData()
            }
            .disposed(by: disposeBag
        )
    }
    
    private func bindToSubViews() {
        
    }
}

extension GoalChooserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.goals.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoalChooserViewCell.identifier) as! GoalChooserViewCell
        
        guard let joinedGoal = viewModel.goals.value.item(at: indexPath.row) else {
            return cell
        }
        cell.goal = joinedGoal.goal
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = AddShootViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UINavigationBarDelegate
extension GoalChooserViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}


// MARK: - UIGestureRecognizerDelegate
extension GoalChooserViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

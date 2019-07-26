//
//  GoalDetailViewController.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

import UIKit
import RxSwift

class GoalDetailViewController: UIViewController {
    
    private var viewModel: GoalDetailViewModel!
    var disposeBag = DisposeBag()
    var goalId: Int?
    
    // MARK: - UI elements
    private lazy var navigationBar = UINavigationBar(frame: CGRect.zero)
    private lazy var titleLabel = UILabel()
    private lazy var dateLabel = UILabel()
    private lazy var metaView = GoalDetailMetaView()
    private lazy var tableView = UITableView()
    
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
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        view.addSubview(tableView)
        
        tableView.tableHeaderView = metaView
        
        let navigationItem = UINavigationItem(title: "Timeline")
        let closeImage = UIImage(named: "btnNaviBackN")
        let doneButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(done))
        
        navigationItem.leftBarButtonItem = doneButtonItem
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.delegate = self

        titleLabel.font = .goalDetailTitle
        titleLabel.textColor = .white
        
        dateLabel.font = .goalDetailDate
        dateLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        
        tableView.rowHeight = 100
        tableView.register(MemberRankViewCell.self,
                           forCellReuseIdentifier: MemberRankViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .clear
        
        navigationBar.snp.makeConstraints { make in
            make.height.equalTo(44)
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            
            
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).offset(26)
            make.centerX.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        metaView.snp.makeConstraints { make in
            make.height.equalTo(108)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(9)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(17)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        viewModel = GoalDetailViewModel()
        
        bindToViewModel()
        bindToSubViews()
        
        viewModel.fetchGoal()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.sizeHeaderToFit()
    }
    
    @objc func done() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showImagePicker() {
        let viewController = ImagePickerViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    private func bindToViewModel() {
        viewModel
            .goal
            .bind { [weak self] goal in
                guard let goal = goal else { return }
                self?.titleLabel.text = goal.title
                self?.dateLabel.addCharactersSpacing(spacing: 1.5, text: goal.dateText)
                self?.metaView.daysLeftText = goal.daysLeftText
                self?.metaView.penaltyText = goal.penaltyText
            }
            .disposed(by: disposeBag)
    }
    
    private func bindToSubViews() {
    }
}

// MARK: - UINavigationBarDelegate
extension GoalDetailViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}


// MARK: - UIGestureRecognizerDelegate
extension GoalDetailViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension GoalDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.members.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemberRankViewCell.identifier) as! MemberRankViewCell
        
        guard let member = viewModel.members.value.item(at: indexPath.row) else {
            return cell
        }
        cell.row = indexPath.row
        cell.member = member
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

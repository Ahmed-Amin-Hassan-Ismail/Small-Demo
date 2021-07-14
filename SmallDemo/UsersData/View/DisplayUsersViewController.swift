//
//  DisplayUsersViewController.swift
//  SmallDemo
//
//  Created by Amin  on 11/07/2021.
//

import UIKit
import SnapKit
import RxSwift

class DisplayUsersViewController: UIViewController {
    
    // MARK: - Properties
    
    fileprivate var tableView: UITableView = {
        let table = UITableView()
        table.register(UsersViewCell.self, forCellReuseIdentifier: "usersCell")
        table.separatorStyle = .singleLine
        table.separatorColor = .black
        table.backgroundColor = .clear
        return table
    }()
    
    fileprivate var disposeBag = DisposeBag()
    private var cell: UsersViewCell?
    private var usersViewModel: UsersViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializer cell
        cell = UsersViewCell()
        
        // Initializer View Model
        usersViewModel = UsersViewModel()
        
        // setup tableview
        tableSetup()
        
        // Configure Navigation Bar
        configureNavigationBar()
        
        // RxSwift
        setupRxswift()
    }
    
}

// MARK: - Methods

extension DisplayUsersViewController {
    
    fileprivate func tableSetup() {
        
        // Add Tableview with constraints
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Hide empty cells
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func configureNavigationBar() {
        title = "Users Data"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40)
        ]
    }
    
}

// MARK: - RXSwift TableView

extension DisplayUsersViewController {
    
    fileprivate func setupRxswift() {
        subscribeToData()
        subscribeToTableView()
    }
    
    private func subscribeToData() {
        usersViewModel?.getData()
    }
    
    private func subscribeToTableView() {
        self.usersViewModel?.userModelObserver
            .bind(to: self.tableView
                    .rx
                    .items(cellIdentifier: "usersCell",
                           cellType: UsersViewCell.self)) { row, user, cell in
                cell.idLabel.text = (String(describing: user.id ?? 0))
                cell.titleLabel.text = user.name
                cell.bodyLabel.text = user.email
            }
            .disposed(by: disposeBag)
    }
}


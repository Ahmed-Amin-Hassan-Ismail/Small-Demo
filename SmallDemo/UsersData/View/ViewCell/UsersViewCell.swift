//
//  UsersViewCell.swift
//  SmallDemo
//
//  Created by Amin  on 11/07/2021.
//

import UIKit
import SnapKit

class UsersViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    let cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    let idNameLabel: UILabel = {
       let label = UILabel()
        label.text = "ID:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    let titleNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    let bodyNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setupUI() {
        
        contentView.addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        cellView.addSubview(idNameLabel)
        idNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cellView.snp.top).offset(10)
            make.left.equalTo(cellView.snp.left).offset(10)
            make.height.equalTo(22)
        }
        
        cellView.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(cellView.snp.top).offset(11)
            make.left.equalTo(idNameLabel.snp.right).offset(5)
            make.right.equalTo(cellView.snp.right).offset(10)
            make.height.equalTo(22)
        }
        
        cellView.addSubview(titleNameLabel)
        titleNameLabel.snp.makeConstraints { make in
            make.top.equalTo(idNameLabel.snp.bottom).offset(10)
            make.left.equalTo(cellView.snp.left).offset(10)
            make.height.equalTo(22)
        }
        
        
        cellView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(10)
            make.left.equalTo(titleNameLabel.snp.right).offset(5)
            make.right.equalTo(cellView.snp.right).offset(10)
            make.height.equalTo(22)
        }
        
        cellView.addSubview(bodyNameLabel)
        bodyNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleNameLabel.snp.bottom).offset(10)
            make.left.equalTo(cellView.snp.left).offset(10)
            make.bottom.equalTo(cellView.snp.bottom).offset(-10)
            make.height.equalTo(22)
        }
        
        cellView.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(bodyNameLabel.snp.right).offset(5)
            make.right.equalTo(cellView.snp.right).offset(10)
            make.bottom.equalTo(cellView.snp.bottom).offset(-10)
            make.height.equalTo(22)
        }
    }
}

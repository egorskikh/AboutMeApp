//
//  AboutMeView.swift
//  AboutMeApp
//
//  Created by Egor Gorskikh on 31.05.2021.
//

import UIKit

class AboutMeView: UIView {
    
    // scroll view
    // stack view
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "your name"
        return textField
    }()
    
    lazy var secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "second name"
        label.textAlignment = .center
        return label
    }()
    
    lazy var secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "your second name"
        return textField
    }()
    
    lazy var middleNameLabel: UILabel = {
        let label = UILabel()
        label.text = "middle name"
        label.textAlignment = .center
        return label
    }()
    
    lazy var middleNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "your middle name"
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add child +", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    
}

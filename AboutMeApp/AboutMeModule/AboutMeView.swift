//
//  AboutMeView.swift
//  AboutMeApp
//
//  Created by Egor Gorskikh on 31.05.2021.
//

import UIKit

class AboutMeView: UIView {
    
    // MARK: - UI Elements
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ nameLabel,
                                                        nameTextField,
                                                        secondNameLabel,
                                                        secondNameTextField,
                                                        middleNameLabel,
                                                        middleNameTextField,
                                                        ageLabel,
                                                        ageTextField,
                                                        addChildButton,
                                                        childrenTableView,])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " your name?"
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
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
        textField.placeholder = " your second name?"
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
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
        textField.placeholder = " your middle name?"
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "age"
        label.textAlignment = .center
        return label
    }()
    
    lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " your age?"
        textField.keyboardType = .numbersAndPunctuation
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var addChildButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add child +", for: .normal)
        return button
    }()
    
    lazy var childrenTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutConstraintTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private
    
    private func setupLayoutConstraintTableView() {
        NSLayoutConstraint.activate([
            childrenTableView.heightAnchor.constraint(equalToConstant: 250),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 30),
            middleNameTextField.heightAnchor.constraint(equalToConstant: 30),
            ageTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}

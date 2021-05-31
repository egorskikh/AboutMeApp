//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Egor Gorskikh on 31.05.2021.
//

import UIKit

class AboutMeVC: UIViewController {
    
    // MARK: - Property
    private var amv = AboutMeView()
    
    private var childs: [Child] = [] {
        didSet {
            if childs.count == 5 {
                amv.addChildButton.tintColor = .gray
                amv.addChildButton.isUserInteractionEnabled = false
            } else {
                amv.addChildButton.tintColor = .systemBlue
                amv.addChildButton.isUserInteractionEnabled = true
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupDelegates()
        setupLayoutConstraint()
        addActionToButton()
    }
    
    // MARK: - Action
    @objc func buttonAction(_ : UIButton) {
       
        let alertName = UIAlertController(title: "Name", message: "Add a name", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let saveActionName = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard
                let textFieldName = alertName.textFields?.first,
                let name = textFieldName.text
            else {
                return
            }
            
            let alertAge = UIAlertController(title: "Age", message: "Add an age", preferredStyle: .alert)
            let saveActionAge = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
                guard
                    let textFieldAge = alertAge.textFields?.first,
                    let age = textFieldAge.text
                else {
                    return
                }
                childs.append(Child(name: name, age: age))
                amv.childrenTableView.reloadData()
            }
            alertAge.addTextField()
            alertAge.addAction(saveActionAge)
            alertAge.addAction(cancelAction)
            present(alertAge, animated: true)
        }
        alertName.addTextField()
        alertName.addAction(saveActionName)
        alertName.addAction(cancelAction)
        present(alertName, animated: true)
    }
    
    // MARK: - Private Method
    private func setupLayoutConstraint() {
        view.addSubview(amv.scrollView)
        let frameLayoutGuide = amv.scrollView.frameLayoutGuide
        let contentLayoutGuide = amv.scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            amv.stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 10),
            amv.stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -5),
            amv.stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor, constant: 5),
            amv.stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: -5),
            amv.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setupViewController() {
        view.backgroundColor = .white
        title = "AboutMe"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupDelegates() {
        amv.nameTextField.delegate = self
        amv.middleNameTextField.delegate = self
        amv.ageTextField.delegate = self
        amv.childrenTableView.dataSource = self
    }
    
    private func addActionToButton(){
        amv.addChildButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    
}

// MARK: - UITableViewDataSource

extension AboutMeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        childs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let child = childs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = child.name + " " + child.age
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        childs.remove(at: indexPath.row)
        amv.childrenTableView.reloadData()
    }
    
    
}

// MARK: - UITextFieldDelegate

extension AboutMeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

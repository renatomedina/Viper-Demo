//
//  ListViewController.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 29/03/19.
//  Copyright (c) 2019 Renato Medina. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: - Public properties -
    var presenter: ListPresenterInterface!

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loginButton: UIBarButtonItem!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.updateLoginButtonTitle()
    }
    
    
    @IBAction private func tapLoginButton() {
        presenter.tapLoginButton()
    }
	
}

// MARK: - Extensions -

extension ListViewController: ListViewInterface {
    func setButtonTitle(text: String) {
        loginButton.title = text
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PropertyTableViewCell else {fatalError("Error dequeing")}
        
        let item = presenter.item(at: indexPath)
        cell.configure(with: item)
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
}
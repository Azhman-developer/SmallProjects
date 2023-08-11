//
//  InitialViewController.swift
//  CADISplayLink
//
//  Created by Azhman Adam on 8/9/23.
//

import UIKit

final class InitialViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    let rows = [
        "Time counting animation",
        "Changing color alpha animation"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
}

// MARK: - Setup Views
extension InitialViewController {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    }
}

// MARK: - Action Functions
extension InitialViewController {
    
    func handleTableViewCellDidTapped(index: Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        switch index {
        case 0:
            let vc = storyBoard.instantiateViewController(withIdentifier: "TimeCounterAnimationViewController")
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyBoard.instantiateViewController(withIdentifier: "ChangingColorAlphaViewController")
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("Invalid Cell with index \(index)")
        }
    }
}

// MARK: - TableView Functions
extension InitialViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        // Configure the cell
        cell.textLabel?.text = rows[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleTableViewCellDidTapped(index: indexPath.row)
    }
}

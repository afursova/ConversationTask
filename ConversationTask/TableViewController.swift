//
//  TableViewController.swift
//  ConversationTask
//
//  Created by Александра on 19.07.2024.
//

import UIKit

class TableViewController: UITableViewController {
    private var characters: [Character] = []
    private let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        apiService.fetchCharacters { [weak self] characters in
            DispatchQueue.main.async {
                self?.characters = characters ?? []
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at index: \(indexPath.row)")
        let detailVC = DetailViewController()
        detailVC.character = characters[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

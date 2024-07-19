//
//  ViewController.swift
//  ConversationTask
//
//  Created by Александра on 19.07.2024.
//

import UIKit

class ViewController: UIViewController {
    private var characters: [Character] = []
    private let tableView = UITableView()
    private let apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
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
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
}

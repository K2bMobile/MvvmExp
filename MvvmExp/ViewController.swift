//
//  ViewController.swift
//  MvvmExp
//
//  Created by suresh k on 27/04/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    private var models = [Person]()
    private let tableView:UITableView = {
        let table = UITableView()
        table.register(PersonFollowingTableViewCell.self, forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfiguredModel()
        view.addSubview(tableView)
       
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    private func ConfiguredModel(){
        let names = ["Joe","John","Jock"]
        for name in names{
            models.append(Person(name: name))
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PersonFollowingTableViewCell.identifier,
            for: indexPath) as? PersonFollowingTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: PersonFollowingTableViewCellViewModel(with:model))
        return cell
    }

}


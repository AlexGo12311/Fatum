//
//  HomeController.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

final class HomeController: UIViewController {
    
    let homeFeedTable: UITableView = {
        $0.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.identifier)
        
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTable)
        setupHomeFeedTable()
        title = "Fatum"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.DPHelix.Bold.size(of: 28), .foregroundColor: AccentColors.titleColor]
        view.backgroundColor = AccentColors.bgColor
    }
    
    override func viewDidLayoutSubviews() {
        homeFeedTable.frame = view.bounds
    }
}

private extension HomeController {
    func setupHomeFeedTable() {
        homeFeedTable.backgroundColor = AccentColors.bgColor
        homeFeedTable.dataSource = self
        homeFeedTable.delegate = self
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesCell.identifier, for: indexPath) as? StoriesCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100
        default:
            return tableView.estimatedRowHeight
        }
    }
    
    
}

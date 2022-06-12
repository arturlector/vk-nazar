//
//  FriendsVC.swift
//  vk-nazar
//
//  Created by Artur Igberdin on 07.06.2022.
//

import UIKit

struct Friend {
    var name = "test user"
    var image = UIImage(named: "avatar")
}

final class FriendsVC: UIViewController {

    var friends: [Friend] = [Friend()]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        //Делегатом назначили контроллер
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
       
        tableView.pinEdgesToSuperView()
    }
}


extension FriendsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as! FriendCell
        
        let friend = self.friends[indexPath.row]
        
        //cell.textLabel?.text = friend.name
        cell.configure(friend)
        
        return cell
    }
    
    
}

extension FriendsVC: UITableViewDelegate {
    
}

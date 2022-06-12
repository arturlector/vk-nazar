//
//  MainTabVC.swift
//  vk-nazar
//
//  Created by Artur Igberdin on 12.06.2022.
//

import UIKit

class MainTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let friendsVC = FriendsVC()
        let friendsTabBarItem = UITabBarItem()
        friendsTabBarItem.title = "Друзья"
        friendsTabBarItem.image = UIImage(systemName: "person")
        friendsVC.tabBarItem = friendsTabBarItem
        
        let groupsVC = GroupsVC()
        let groupsTabBarItem = UITabBarItem()
        groupsTabBarItem.title = "Группы"
        groupsTabBarItem.image = UIImage(systemName: "person.3")
        groupsVC.tabBarItem = groupsTabBarItem
        
        let navigationFriendsVC = UINavigationController(rootViewController: friendsVC)
        let navigationGroupsVC = UINavigationController(rootViewController: groupsVC)
        
        
        self.viewControllers = [navigationFriendsVC, navigationGroupsVC]
    }
    



}

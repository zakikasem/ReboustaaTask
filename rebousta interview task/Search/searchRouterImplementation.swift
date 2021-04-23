//
//  searchRouterImplementation.swift
//  rebousta interview task
//
//  Created by zaki kasem on 22/04/2021.
//

import Foundation
import UIKit
protocol searchRouter {
    func navigateToRepositryViewController(name : RepoModel)
}
class HomeRouterImplementation : searchRouter {
    
    let searchViewController:ViewController!
    
    init(searchViewController:ViewController) {
        self.searchViewController = searchViewController
    }
    
    func navigateToRepositryViewController(name : RepoModel) {
       //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       // let repoViewController = storyBoard.instantiateViewController(identifier: "repooViewController") as! RepooViewController
       
        //ViewController.navigationController?.pushViewController(repoViewController, animated: true)
    }
}


//
//  RepoDetails.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit

class RepoDetailsViewController: UIViewController {
    //MARK:-Declarations
    private var presenter:IRepoDetailsPresenter?

    //MARK:-Outlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryOwnerLabel: UILabel!
    @IBOutlet weak var accountDateLabel: UILabel!
    
    //MARK:-ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupUI()
    }
    //MARK:-Functions
    private func configuration() {
        setUserData()
    }
    private func setupUI() {
        
    }
    private func setUserData() {
        let userDetails = presenter?.getSelectedRepo()
       
        ImageDownloader.downloadImage(downloadableImage: userDetails?.owner?.ownerAvatar ?? "") { (image) in
            self.userImageView.image = image
            self.hideLoading()
        }
        usernameLabel.text = userDetails?.owner?.ownerName
        repositoryNameLabel.text = userDetails?.repoName
        repositoryOwnerLabel.text = userDetails?.repoDescription
        accountDateLabel.text = userDetails?.owner?.type
    }
    
    
    ///Dependency injection using method injection which achieves encapsulation principle
    func setPresenter(presenter:IRepoDetailsPresenter?) {
        self.presenter = presenter
    }
    //MARK:-Actions
}

extension RepoDetailsViewController:IRepoDetailsView {
    
}

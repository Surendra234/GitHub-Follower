//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Admin on 13/09/22.
//

import Foundation

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.setItemInfo(itemInfo: ItemInfo.init(title: "Public repos", value: String(user.publicRepos), sysImageIcon: SFSymbols.repos))
        
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGitHubProfile(for: user)
    }
}

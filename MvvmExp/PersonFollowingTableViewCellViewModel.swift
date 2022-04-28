//
//  PersonFollowingTableViewCellViewModel.swift
//  MvvmExp
//
//  Created by suresh k on 27/04/22.
//

import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let userName: String
    let currentlyFollowing: Bool
    let image:UIImage?
    
    init(with model:Person){
        name = model.name
        userName = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}

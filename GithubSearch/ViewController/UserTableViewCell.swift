//
//  UserTableViewCell.swift
//  GithubSearch
//
//  Created by 양어진 on 05/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var userRepoNum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImg.circleImageView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

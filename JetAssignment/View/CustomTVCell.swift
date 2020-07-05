//
//  CustomTVCell.swift
//  JetAssignment
//
//  Created by Vikash on 04/07/20.
//  Copyright © 2020 Vikash. All rights reserved.
//

import UIKit

class CustomTVCell: UITableViewCell {

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userDesignationLbl: UILabel!
    @IBOutlet weak var articleContentLbl: UILabel!
    @IBOutlet weak var articleTitleLbl: UILabel!
    @IBOutlet weak var articleUrlLbl: UILabel!
    @IBOutlet weak var articleLikesLbl: UILabel!
    @IBOutlet weak var articleCommentLbl: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        avatar.layer.borderWidth = CGFloat(AppConstant.avatarBorderWidth)
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.clipsToBounds = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.userNameLbl.text = ""
        self.userDesignationLbl.text = ""
        self.articleCommentLbl.text = ""
        self.articleLikesLbl.text = ""
        self.articleContentLbl.text = ""
        self.articleTitleLbl.text = ""
        self.articleUrlLbl.text = ""
        self.avatar.image = nil
        self.articleImage.image = nil
        self.imageHeightConstraint.constant = CGFloat(AppConstant.mediaImageHeight)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfiguration(cellInfo: CellModel) {
        self.userNameLbl.text = cellInfo.userName
        self.userDesignationLbl.text = cellInfo.userDesignation
        
        if let comments = cellInfo.comments?.formatUsingAbbrevation() {
            self.articleCommentLbl.text = "\(comments)\(AppConstant.comments)"
        }
        
        if let likes = cellInfo.likes?.formatUsingAbbrevation() {
            self.articleLikesLbl.text = "\(likes)\(AppConstant.likes)"
        }
        
        self.articleContentLbl.text = cellInfo.articleDescription
        self.articleTitleLbl.text = cellInfo.articleTitle
        self.articleUrlLbl.text = cellInfo.articleUrl
        
        if let avatar = cellInfo.avatarurl,
            let avatarUrl = URL(string: avatar) {
            self.avatar.load(url: avatarUrl)
        }
        
        if let image = cellInfo.imageurl,
            let imageUrl = URL(string: image) {
            self.articleImage.load(url: imageUrl)
        } else {
            self.imageHeightConstraint.constant = 0
        }
    }
}




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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfiguration(cellInfo: CellModel) {
        self.userNameLbl.text = cellInfo.userName
        self.userDesignationLbl.text = cellInfo.userDesignation
        self.articleCommentLbl.text = String(cellInfo.comments!)
        self.articleLikesLbl.text = String(cellInfo.likes!)
        self.articleContentLbl.text = cellInfo.articleDescription
    }

}

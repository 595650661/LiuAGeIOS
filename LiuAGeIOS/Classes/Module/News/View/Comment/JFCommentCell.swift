//
//  JFCommentCell.swift
//  BaoKanIOS
//
//  Created by zhoujianfeng on 16/5/18.
//  Copyright © 2016年 六阿哥. All rights reserved.
//

import UIKit
import pop

protocol JFCommentCellDelegate {
    func didTappedStarButton(_ button: UIButton, commentModel: JFCommentModel)
}

class JFCommentCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    var delegate: JFCommentCellDelegate?
    
    var commentModel: JFCommentModel? {
        didSet {
            avatarImageView.yy_setImage(with: URL(string: commentModel?.userpic ?? ""), placeholder: UIImage(named: "default－portrait"))
            usernameLabel.text = commentModel?.plnickname == "" ? commentModel?.plusername : commentModel?.plnickname
            timeLabel.text = commentModel?.saytime
            contentLabel.text = commentModel?.saytext
            starButton.setTitle("\(commentModel?.zcnum ?? 0)", for: UIControlState())
            starButton.isSelected = commentModel?.isStar ?? false
            stepLabel.text = "楼层:\(commentModel?.plstep ?? 0)"
        }
    }
    
    func getCellHeight(_ commentModel: JFCommentModel) -> CGFloat {
        self.commentModel = commentModel
        layoutIfNeeded()
        return contentLabel.frame.maxY + 10
    }
    
    /**
     点击了赞
     */
    @IBAction func didTappedStarButton(_ sender: UIButton) {
        delegate?.didTappedStarButton(sender, commentModel: commentModel!)
    }
    
}

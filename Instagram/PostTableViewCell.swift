//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Hiroki Sato on 2020/06/18.
//  Copyright © 2020 hiroki.sato. All rights reserved.
//

import UIKit
import FirebaseUI

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var comentButton: UIButton!
    @IBOutlet weak var comentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // PostDataの内容をセルに表示
    func setPostData(_ postData: PostData) {
        // 画像の表示
        postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
        postImageView.sd_setImage(with: imageRef)

        // キャプションの表示
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"

        // 日時の表示
        self.dateLabel.text = ""
        if let date = postData.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            self.dateLabel.text = dateString
        }   

        // いいね数の表示
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"

        // いいねボタンの表示
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
        // コメントの表示
        var wkComent:String = " コメントなし"
        var comentNo:Int = 1
        if postData.coments.count != 0 {
            wkComent = " ↓↓ 投稿No.投稿者::コメント ↓↓\n"

            postData.coments.forEach {
                wkComent = wkComent + " No\(comentNo)." + $0 + "\n"
                comentNo += 1
            }
        }
        comentLabel.text = wkComent
        // 枠のカラー
        comentLabel.layer.borderColor = UIColor.black.cgColor
        // 枠の幅
        comentLabel.layer.borderWidth = 1.0
        // 枠を角丸にする
        comentLabel.layer.cornerRadius = 10.0
        comentLabel.layer.masksToBounds = true

    }
    
}

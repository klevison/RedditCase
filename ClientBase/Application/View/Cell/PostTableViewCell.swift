//
//  PostTableViewCell.swift
//  ClientBase
//
//  Created by Klevison Matias on 8/31/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

import UIKit
import Haneke

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titlePostLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    var post: Post? {
        didSet {
            titlePostLabel.text = post!.title
            authorLabel.text = post!.author
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbImageView.image = nil
        self.titlePostLabel.text = ""
        self.authorLabel.text = ""
    }

}

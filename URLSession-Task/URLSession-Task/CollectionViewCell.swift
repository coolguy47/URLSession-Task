//
//  CollectionViewCell.swift
//  URLSession-Task
//
//  Created by Jeremiah on 02/06/17.
//  Copyright © 2017 Jeremiah. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelAuthor: UILabel!
    
    @IBOutlet weak var buttonLink: UIButton!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var textviewDescription: UITextView!
    
    @IBOutlet weak var viewDetail: UIView!
    @IBOutlet weak var labelDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //labelTitle.sizeToFit()
        labelTitle.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        labelTitle.numberOfLines = 0
        viewDetail.layer.cornerRadius = 4
        viewDetail.layer.borderWidth = 0.5
        viewDetail.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        viewDetail.layer.shadowColor = UIColor.black.cgColor
        viewDetail.layer.shadowOffset =   CGSize(width: 0, height: 0)
        viewDetail.layer.shadowOpacity = 0.2
        viewDetail.layer.shadowRadius = 4.0
    }
}

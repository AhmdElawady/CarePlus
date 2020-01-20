//
//  ImageViewCell.swift
//  CarePlus
//
//  Created by Awady on 1/13/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    
    var image: UIImage! {
        didSet {
            imageCell.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCell.layer.cornerRadius = 10
    }

}

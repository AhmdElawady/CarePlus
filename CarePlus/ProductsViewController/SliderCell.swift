//
//  SliderCell.swift
//  CarePlus
//
//  Created by Awady on 1/9/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    
    var image: UIImage! {
        didSet {
            imageCell.image = image
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCell.layer.cornerRadius = 10
        imageCell.clipsToBounds = true
    }

}

//
//  CategoriesViewCell.swift
//  CarePlus
//
//  Created by Awady on 12/30/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    
    var image: UIImage! {
        didSet {
            imageCell.image = image
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 10
        viewCell.clipsToBounds = true
    }

}

//
//  productViewCell.swift
//  CarePlus
//
//  Created by Awady on 1/9/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class ProductViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet var ViewCell: UIView!
    
    var tableImage: UIImage! {
        didSet {
            imageCell.image = tableImage
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewCell.layer.borderWidth = 1
        ViewCell.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1)).cgColor
        ViewCell.layer.cornerRadius = 10
        ViewCell.layer.shadowOpacity = 1.0
        ViewCell.layer.shadowRadius = 3
        ViewCell.layer.shadowOffset = CGSize(width: 0, height: 0)
        ViewCell.layer.shadowColor = UIColor(cgColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)).cgColor
        ViewCell.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

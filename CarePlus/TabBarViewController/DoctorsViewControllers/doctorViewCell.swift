//
//  doctorViewCell.swift
//  CarePlus
//
//  Created by Awady on 1/13/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class doctorViewCell: UITableViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var docPic: UIImageView!
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        docPic.layer.cornerRadius = docPic.frame.size.width / 2
        viewCell.layer.cornerRadius = 10
        viewCell.layer.borderWidth = 1
        viewCell.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1)).cgColor
        viewCell.layer.shadowOpacity = 1.0
        viewCell.layer.shadowRadius = 3
        viewCell.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewCell.layer.shadowColor = UIColor(cgColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

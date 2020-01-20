//
//  DocDetailsViewController.swift
//  CarePlus
//
//  Created by Awady on 1/13/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class DocDetailsViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var docPic: UIImageView!
    @IBOutlet weak var docNameLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var certifcateLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        docPic.layer.cornerRadius = docPic.frame.size.width / 2
        detailsView.layer.cornerRadius = 10
        detailsView.clipsToBounds = true
        detailsView.layer.borderWidth = 1
        detailsView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1)).cgColor
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(DocDetailsViewController.closeTab(_:)))
        backgroundView.addGestureRecognizer(closeTouch)
    }
    @objc func closeTab(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func reservePressed(_ sender: Any) {
        
    }
    
   

}

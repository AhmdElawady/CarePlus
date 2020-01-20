//
//  VerifiedCodeViewController.swift
//  CarePlus
//
//  Created by Awady on 1/13/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class VerifiedCodeViewController: UIViewController {
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var labelBox1: UILabel!
    @IBOutlet weak var labelBox2: UILabel!
    @IBOutlet weak var labelBox3: UILabel!
    @IBOutlet weak var labelBox4: UILabel!
    @IBOutlet weak var sendAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        labelBox1.layer.borderWidth = 1
        labelBox1.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3333333333, green: 0.7137254902, blue: 0.6274509804, alpha: 1)).cgColor
        labelBox2.layer.borderWidth = 1
        labelBox2.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3333333333, green: 0.7137254902, blue: 0.6274509804, alpha: 1)).cgColor
        labelBox3.layer.borderWidth = 1
        labelBox3.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3333333333, green: 0.7137254902, blue: 0.6274509804, alpha: 1)).cgColor
        labelBox4.layer.borderWidth = 1
        labelBox4.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3333333333, green: 0.7137254902, blue: 0.6274509804, alpha: 1)).cgColor
        sendAgainButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func sendAgainPressed(_ sender: Any) {
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let confirmationVC = ReserveConfirmationViewController()
        confirmationVC.modalPresentationStyle = .fullScreen
        confirmationVC.modalTransitionStyle = .crossDissolve
        present(confirmationVC, animated: true, completion: nil)
    }
    
    
}

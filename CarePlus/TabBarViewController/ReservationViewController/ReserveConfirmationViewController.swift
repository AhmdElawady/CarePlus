//
//  ReserveConfirmationViewController.swift
//  CarePlus
//
//  Created by Awady on 1/12/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class ReserveConfirmationViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var chooseCaseTextField: UITextField!
    @IBOutlet weak var chooseDoctorTextField: UITextField!
    @IBOutlet weak var boyButton: UIButton!
    @IBOutlet weak var girlButton: UIButton!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var dateReserveTextField: UITextField!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boyButton.layer.cornerRadius = 10
        girlButton.layer.cornerRadius = 10
        boyButton.layer.borderWidth = 1
        boyButton.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1)).cgColor
        girlButton.layer.borderWidth = 1
        girlButton.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1)).cgColor
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
    }
    
    @IBAction func boyPressed(_ sender: UIButton) {
        boyButton.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.3333333333, green: 0.7137254902, blue: 0.6274509804, alpha: 1))
        boyButton.isSelected = true
        girlButton.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        girlButton.isSelected = false
    }
    
    @IBAction func girlPressed(_ sender: UIButton) {
        girlButton.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.3333333333, green: 0.7137254902, blue: 0.6274509804, alpha: 1))
        girlButton.isSelected = true
        boyButton.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        boyButton.isSelected = false
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        if  sender.isSelected == false {
            let homeImage = UIImage(systemName: "checkmark")
            checkBoxButton.setImage(homeImage, for: .normal)
            sender.isSelected = true
        } else {
            checkBoxButton.setImage(nil, for: .normal)
            sender.isSelected = false
        }
    }
    
    @IBAction func policyPressed(_ sender: Any) {
        let policyVC = PolicyViewController()
        policyVC.modalPresentationStyle = .custom
        policyVC.modalTransitionStyle = .crossDissolve
        present(policyVC, animated: true, completion: nil)
    }
    
    @IBAction func reserveConfirmationPressed(_ sender: Any) {
        let VerficationVC = VerifiedCodeViewController()
        VerficationVC.modalPresentationStyle = .custom
        VerficationVC.modalTransitionStyle = .crossDissolve
        present(VerficationVC, animated: true, completion: nil)
    }
    
    
}

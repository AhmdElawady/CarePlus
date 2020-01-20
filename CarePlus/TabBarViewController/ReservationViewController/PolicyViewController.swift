//
//  PolicyViewController.swift
//  CarePlus
//
//  Created by Awady on 1/12/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class PolicyViewController: UIViewController {
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var policyLabel: UILabel!
    @IBOutlet weak var policyContainerView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        policyContainerView.layer.cornerRadius = 10
        policyContainerView.clipsToBounds = true
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(PolicyViewController.closeTab(_:)))
        backgroundView.addGestureRecognizer(closeTouch)
    }
    @objc func closeTab(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func acceptPressed(_ sender: Any) {
        let confirmationVC = ReserveConfirmationViewController()
        confirmationVC.modalPresentationStyle = .fullScreen
        present(confirmationVC, animated: true, completion: nil)
    }
    

}

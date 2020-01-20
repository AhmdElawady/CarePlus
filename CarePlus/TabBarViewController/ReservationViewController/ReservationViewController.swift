//
//  ReservationViewController.swift
//  CarePlus
//
//  Created by Awady on 1/12/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func reservePressed(_ sender: Any) {
        let policyVC = PolicyViewController()
        policyVC.modalPresentationStyle = .custom
        policyVC.modalTransitionStyle = .crossDissolve
        present(policyVC, animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
    }
    


}

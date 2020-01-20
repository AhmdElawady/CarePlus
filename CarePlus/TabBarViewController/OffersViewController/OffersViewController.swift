//
//  OffersViewController.swift
//  CarePlus
//
//  Created by Awady on 1/12/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {
    @IBOutlet weak var offersTableView: UITableView!
    
//    var sliderData = [UIImage(named: "3"), UIImage(named: "3")]
    var sliderData = [UIImage()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offersTableView.delegate = self
        offersTableView.dataSource = self
        
        let offerNib = UINib(nibName: "OfferCell", bundle: nil)
        offersTableView.register(offerNib, forCellReuseIdentifier: "OfferCell")
        self.offersTableView.separatorColor = UIColor.clear
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
    }
    

}

extension OffersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sliderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as! OfferCell
        cell.images = sliderData[indexPath.row]
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.black
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    
}

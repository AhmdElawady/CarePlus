//
//  DoctorsViewController.swift
//  CarePlus
//
//  Created by Awady on 1/13/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class DoctorsViewController: UIViewController {
    @IBOutlet weak var doctorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        doctorsTableView.delegate = self
        doctorsTableView.dataSource = self
        
        let docNib = UINib(nibName: "doctorViewCell", bundle: nil)
        doctorsTableView.register(docNib, forCellReuseIdentifier: "doctorViewCell")
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
    }
    
 

}

extension DoctorsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctorViewCell", for: indexPath) as! doctorViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let docDetails = DocDetailsViewController()
        docDetails.modalPresentationStyle = .custom
        docDetails.modalTransitionStyle = .crossDissolve
        present(docDetails, animated: true, completion: nil)
    }
}

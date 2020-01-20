//
//  ProductViewController.swift
//  CarePlus
//
//  Created by Awady on 1/9/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var productTableView: UITableView!
    
    var categoryData = [UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        productTableView.delegate = self
        productTableView.dataSource = self
        
        let sliderNib = UINib(nibName: "SliderCell", bundle: nil)
        sliderCollectionView.register(sliderNib, forCellWithReuseIdentifier: "SliderCell")
        let productNib = UINib(nibName: "ProductViewCell", bundle: nil)
        productTableView.register(productNib, forCellReuseIdentifier: "ProductViewCell")
        self.productTableView.separatorColor = UIColor.clear
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(identifier: "ChooseCityViewController") as! ChooseCityViewController
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
    }
    
    
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        cell.image = categoryData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
}



extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
//        let bgColorView = UIView()
//        bgColorView.backgroundColor = UIColor.black
//        cell.selectedBackgroundView = bgColorView
        cell.tableImage = categoryData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = self.storyboard?.instantiateViewController(identifier: "TabBarController") as! TabBarController
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
    }
    
}

//
//  CategoriesViewController.swift
//  CarePlus
//
//  Created by Awady on 12/30/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var sliderData = [UIImage(named: "3"), UIImage(named: "3")]
    var categoryData = [UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3"), UIImage(named: "3")]
    var categoryData2 = [UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1"), UIImage(named: "1")]
    
    enum SelectedService {
        case medical
        case health
    }
    var service = SelectedService.medical
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        let categoryCellNib = UINib(nibName: "CategoriesViewCell", bundle: nil)
        self.categoriesCollectionView.register(categoryCellNib, forCellWithReuseIdentifier: "CategoriesViewCell")
        
        
        let sliderCellNib = UINib(nibName: "SliderViewCell", bundle: nil)
        self.sliderCollectionView.register(sliderCellNib, forCellWithReuseIdentifier: "SliderViewCell")
        
    }
    
        
    
    
    @IBAction func backPressed(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        self.present(view, animated: true, completion: nil)
    }
    
    var collectionViewOffset = CGPoint(x: 0, y: 0)
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        collectionViewOffset = self.sliderCollectionView.contentOffset
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.sliderCollectionView.contentOffset = collectionViewOffset
    }
    
    

}


extension CategoriesViewController: UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView {
            return sliderData.count
        } else {
            return categoryData.count
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderViewCell", for: indexPath) as! SliderViewCell
            cell.image = sliderData[indexPath.item]
            return cell
        } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesViewCell", for: indexPath) as! CategoriesViewCell
                cell.image = categoryData[indexPath.item]
            switch service {
            case .health:
                cell.viewCell.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
                return cell
            default:
                cell.viewCell.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1))
                return cell
            }
        }
    }
    
     func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()

        visibleRect.origin = sliderCollectionView.contentOffset
        visibleRect.size = sliderCollectionView.bounds.size

        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = sliderCollectionView.indexPathForItem(at: visiblePoint) else { return }

        if indexPath == [0, 1] {
            self.service = SelectedService.health
            categoriesCollectionView.reloadData()
        } else {
            self.service = SelectedService.medical
            categoriesCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == sliderCollectionView {
            return CGSize(width: 350, height: collectionView.frame.height)
        } else {
            return CGSize(width: CGFloat(collectionView.frame.width / 2) - 15, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == sliderCollectionView{
            return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0  )
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoriesCollectionView {
            let view = self.storyboard?.instantiateViewController(identifier: "LocationSearchViewController") as! LocationSearchViewController
            view.modalPresentationStyle = .fullScreen
            view.modalTransitionStyle = .crossDissolve
            switch service {
            case .health:
                view.service = SelectedService.health
                self.present(view, animated: true, completion: nil)
            default:
                view.service = SelectedService.medical
                self.present(view, animated: true, completion: nil)
            }
        }
    }
}









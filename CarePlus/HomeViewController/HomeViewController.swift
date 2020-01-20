//
//  ViewController.swift
//  CarePlus
//
//  Created by Awady on 12/30/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var fieldsCollectionView: UICollectionView!
    
    var imageSlider = [UIImage(named: "3"), UIImage(named: "3"),  UIImage(named: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HomeCellNib = UINib(nibName: "SliderCollectionCell", bundle: nil)
        self.fieldsCollectionView.register(HomeCellNib, forCellWithReuseIdentifier: "SliderCollectionCell")
        fieldsCollectionView.delegate = self
        fieldsCollectionView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionCell", for: indexPath) as! SliderCollectionCell
        cell.image = imageSlider[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellScale: CGFloat = 0.8
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0

        let layout = self.fieldsCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

        return UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.fieldsCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing

        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)

        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)

        targetContentOffset.pointee = offset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let view = self.storyboard?.instantiateViewController(identifier: "CategoriesViewController") as! CategoriesViewController
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true, completion: nil)
        
    }
}



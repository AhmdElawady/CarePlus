//
//  ImagesViewController.swift
//  CarePlus
//
//  Created by Awady on 1/13/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController {
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    var images = [UIImage(named: "image1"), UIImage(named: "image2"),UIImage(named: "image3"), UIImage(named: "3"), UIImage(named: "image4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        let imageNib = UINib(nibName: "ImageViewCell", bundle: nil)
        imagesCollectionView.register(imageNib, forCellWithReuseIdentifier: "ImageViewCell")
        
    }
    

    @IBAction func backPressed(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
    }
    

}

extension ImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell", for: indexPath) as! ImageViewCell
        cell.image = images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 2) , height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ImageViewCell
        let imagePreview = PreviewViewController()
        imagePreview.selectedImage = cell.imageCell.image
        imagePreview.modalTransitionStyle = .crossDissolve
        imagePreview.modalPresentationStyle = .custom
        present(imagePreview, animated: true, completion: nil)
        
    }
}

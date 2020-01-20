//
//  PreviewViewController.swift
//  CarePlus
//
//  Created by Awady on 1/13/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        closeTouch()
        imageView.image = selectedImage
    }
    func closeTouch() {
    let closeTouch = UITapGestureRecognizer(target: self, action: #selector(PreviewViewController.closeTab(_:)))
        backgroundView.addGestureRecognizer(closeTouch)
    }
    @objc func closeTab(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }


}

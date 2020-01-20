//
//  LocationSearchViewController.swift
//  CarePlus
//
//  Created by Awady on 1/6/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class LocationSearchViewController: UIViewController {
    @IBOutlet weak var searchInLocationButton: UIButton!
    @IBOutlet weak var chooseCityButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleVCLabel: UILabel!
    @IBOutlet weak var centerBGView: UIView!
    @IBOutlet weak var youCanSearchNormalLabel: UILabel!
    @IBOutlet weak var searchByLabel: UILabel!
    
    var service = CategoriesViewController.SelectedService.medical

    override func viewDidLoad() {
        super.viewDidLoad()
        separateServiceView()
    }
    
    func separateServiceView() {
        
        let healthColorAtt = UIColor(cgColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.7394049658))
        let medicalColorAtt = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1))
        switch service {
        case .health:
            searchInLocationButton.setTitleColor(healthColorAtt, for: .normal)
            centerBGView.backgroundColor = healthColorAtt
            chooseCityButton.backgroundColor = healthColorAtt
            backButton.setImageTintColor(healthColorAtt)
            titleVCLabel.textColor = healthColorAtt
            youCanSearchNormalLabel.textColor = healthColorAtt
            searchByLabel.textColor = healthColorAtt
            
        default:
            searchInLocationButton.setTitleColor(medicalColorAtt, for: .normal)
            centerBGView.backgroundColor = medicalColorAtt
            chooseCityButton.backgroundColor = medicalColorAtt
            backButton.setImageTintColor(medicalColorAtt)
            titleVCLabel.textColor = medicalColorAtt
            youCanSearchNormalLabel.textColor = medicalColorAtt
            searchByLabel.textColor = medicalColorAtt
        }
        searchInLocationButton.layer.cornerRadius = 15
        chooseCityButton.layer.cornerRadius = 15
    }
    
    @IBAction func searchLocationPressed(_ sender: Any) {
        
    }
    
    @IBAction func chooseCityPressed(_ sender: Any) {
//        let view = self.storyboard?.instantiateViewController(identifier: "ChooseCityViewController") as! ChooseCityViewController
//        view.modalPresentationStyle = .fullScreen
//        view.modalTransitionStyle = .crossDissolve
//        present(view, animated: true, completion: nil)
        
        let view = self.storyboard?.instantiateViewController(identifier: "ChooseCityViewController") as! ChooseCityViewController
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        switch service {
        case .health:
            view.service = CategoriesViewController.SelectedService.health
            self.present(view, animated: true, completion: nil)
        default:
            view.service = CategoriesViewController.SelectedService.medical
            self.present(view, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(identifier: "CategoriesViewController") as! CategoriesViewController
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
//        switch service {
//        case .health:
//            view.service = CategoriesViewController.SelectedService.health
//            present(view, animated: true, completion: nil)
//        default:
//            view.service = CategoriesViewController.SelectedService.medical
//            present(view, animated: true, completion: nil)
//        }
    }
    
    
    


}

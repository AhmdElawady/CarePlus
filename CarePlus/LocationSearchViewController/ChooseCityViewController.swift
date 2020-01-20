//
//  ChooseCityViewController.swift
//  CarePlus
//
//  Created by Awady on 1/6/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import UIKit

class ChooseCityViewController: UIViewController {
 
    @IBOutlet weak var backImageButton: UIButton!
    @IBOutlet weak var searchInSelectedLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var pickCityButton: UIButton!
    @IBOutlet weak var separateCityView: UIView!
    
    @IBOutlet weak var neighborhoodLabel: UILabel!
    @IBOutlet weak var pickNeighborhoodButton: UIButton!
    @IBOutlet weak var separateNeighborhoodView: UIView!
    
    @IBOutlet weak var neighborhoodStack: UIStackView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var CityPicker: UIPickerView!
    @IBOutlet weak var NeighborhoodPicker: UIPickerView!
    
    
    var Cairo = ["Nasr City", "Abbasiah", "Sheraton", "Mohandseen"]
    var Alex = ["Sedy Gaber", "Smouha", "Ma'mora", "Gleem"]
    var Sharkia = ["Zagazig", "Abou Hammad", "Menia Elkamh", "Diarb Negm"]
    
    var cities = ["Cairo", "Alex", "Sharkia"]
    var selectedCity: String = ""
    var service = CategoriesViewController.SelectedService.medical
    override func viewDidLoad() {
        super.viewDidLoad()
        separateServiceView()
        CityPicker.delegate = self
        NeighborhoodPicker.delegate = self
    }
    
    func separateServiceView() {
        
        let healthColorAtt = UIColor(cgColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.7394049658))
        let medicalColorAtt = UIColor(cgColor: #colorLiteral(red: 0.3332580081, green: 0.7124048223, blue: 0.6265390506, alpha: 1))
        switch service {
        case .health:
            backImageButton.setImageTintColor(healthColorAtt)
            searchInSelectedLabel.textColor = healthColorAtt
            separateCityView.backgroundColor = healthColorAtt
            searchButton.backgroundColor = healthColorAtt
            pickCityButton.setImageTintColor(healthColorAtt)
            pickNeighborhoodButton.setImageTintColor(healthColorAtt)
            separateNeighborhoodView.backgroundColor = healthColorAtt
            cityLabel.textColor = healthColorAtt
            neighborhoodLabel.textColor = healthColorAtt
            
        default:
            backImageButton.setTitleColor(medicalColorAtt, for: .normal)
            searchInSelectedLabel.textColor = medicalColorAtt
            searchButton.backgroundColor = medicalColorAtt
            separateCityView.backgroundColor = medicalColorAtt
            pickCityButton.setImageTintColor(medicalColorAtt)
            pickNeighborhoodButton.setImageTintColor(medicalColorAtt)
            separateNeighborhoodView.backgroundColor = medicalColorAtt
            cityLabel.textColor = medicalColorAtt
            neighborhoodLabel.textColor = medicalColorAtt
        }
        searchButton.layer.cornerRadius = 15
    }
    
    @IBAction func pickCityPressed(_ sender: Any) {
        CityPicker.isHidden = false
    }
    
    @IBAction func pickNeighborhoodPressed(_ sender: Any) {
        NeighborhoodPicker.isHidden = false
    }

    @IBAction func searchPressed(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        present(view, animated: true, completion: nil)
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        let view = self.storyboard?.instantiateViewController(identifier: "LocationSearchViewController") as! LocationSearchViewController
            view.modalPresentationStyle = .fullScreen
            view.modalTransitionStyle = .crossDissolve
            switch service {
            case .health:
                view.service = CategoriesViewController.SelectedService.health
                present(view, animated: true, completion: nil)
            default:
                view.service = CategoriesViewController.SelectedService.medical
                present(view, animated: true, completion: nil)
            
        }
    }
    
    

}

extension ChooseCityViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == CityPicker {
            return cities.count
        } else {
            return Alex.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == CityPicker {
            return cities[row]
        }else {
            return Alex[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == CityPicker {
            selectedCity = cities[row]
            cityLabel.text = selectedCity
            CityPicker.isHidden = true
            neighborhoodStack.isHidden = false
            neighborhoodLabel.text = "الحي"
            
        } else {
            selectedCity = Alex[row]
            neighborhoodLabel.text = selectedCity
            NeighborhoodPicker.isHidden = true
        }
    }
    
    
}

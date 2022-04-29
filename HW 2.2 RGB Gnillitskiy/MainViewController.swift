//
//  ViewController.swift
//  HW 2.2 RGB Gnillitskiy
//
//  Created by Александр on 29.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setUI(for color: UIColor)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? SettingsViewController else { return }
        navigationVC.delegate = self
        navigationVC.colorSet = view.backgroundColor
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setUI(for color: UIColor) {
        view.backgroundColor = color
    }
}


    





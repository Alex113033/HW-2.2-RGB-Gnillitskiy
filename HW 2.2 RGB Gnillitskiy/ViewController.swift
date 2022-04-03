//
//  ViewController.swift
//  HW 2.2 RGB Gnillitskiy
//
//  Created by Александр on 29.03.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var viewRGB: UIView!
  
    @IBOutlet var redInfo: UILabel!
    @IBOutlet var greenInfo: UILabel!
    @IBOutlet var blueInfo: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewRGB.backgroundColor = .black
    }
    
    @IBAction func mixColor(_ sender: UISlider) {
        viewRGB.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderBlue.value), blue: CGFloat(sliderGreen.value), alpha: 1)
       
        redInfo.text = String(round(sliderRed.value * 100) / 100)
        greenInfo.text = String(round(sliderGreen.value * 100) / 100)
        blueInfo.text = String(round(sliderBlue.value * 100) / 100)
    }
}






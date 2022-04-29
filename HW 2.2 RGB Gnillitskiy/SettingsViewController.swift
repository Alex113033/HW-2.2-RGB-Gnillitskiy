//
//  SettingsViewController.swift
//  HW 2.2 RGB Gnillitskiy
//
//  Created by Александр on 26.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var viewRGB: UIView!
    
    @IBOutlet var infoRed: UILabel!
    @IBOutlet var infoGreen: UILabel!
    @IBOutlet var infoBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var colorSet: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldRed.delegate = self
        textFieldGreen.delegate = self
        textFieldBlue.delegate = self
        
        viewRGB.layer.cornerRadius = 10
        
        setSliders()
        textInSlider()
    }
    
    
// MARK: - метод слайдеров
    
    @IBAction func mixColor(_ sender: UISlider) {
        colorUI()
        textInSlider()
    }
    
//  MARK: - кнопка возврата
    
    @IBAction func reloadedDelegate() {
        dismiss(animated: true)
        delegate.setUI(for: viewRGB.backgroundColor ?? .gray)
        view.endEditing(true)
    }
    
// MARK: - приватные методы
    
    private func textInSlider () {
        
        infoRed.text = String(round(sliderRed.value * 100) / 100)
        infoGreen.text = String(round(sliderGreen.value * 100) / 100)
        infoBlue.text = String(round(sliderBlue.value * 100) / 100)
        
        textFieldRed.text = String(round(sliderRed.value * 100) / 100)
        textFieldGreen.text = String(round(sliderGreen.value * 100) / 100)
        textFieldBlue.text = String(round(sliderBlue.value * 100) / 100)
        
        colorUI()
    }
    
    private func colorUI() {
        viewRGB.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: colorSet)
        
        sliderRed.value = Float(ciColor.red)
        sliderGreen.value = Float(ciColor.green)
        sliderBlue.value = Float(ciColor.blue)
        
        colorUI()
    }
    
}

// MARK: - передача текста в слайдер
     
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }

        if textField == textFieldRed {
            sliderRed.setValue(numberValue, animated: true)
            colorUI()
            textInSlider()
        } else if textField == textFieldGreen {
            sliderGreen.setValue(numberValue, animated: true)
            colorUI()
            textInSlider()
        } else if textField == textFieldBlue {
            sliderBlue.setValue(numberValue, animated: true)
            colorUI()
            textInSlider()
        }
    }

}


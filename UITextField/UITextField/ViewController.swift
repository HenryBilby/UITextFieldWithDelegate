//
//  ViewController.swift
//  UITextField
//
//  Created by Henry Bilby on 16/08/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField1.delegate = self
        textField2.delegate = self
        
        textField1.clearButtonMode = .always
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            if string == "A"{
                textField1.text! += "Z"
                return false
            }
            
            if string == ""{//Foi digitado o backspace, verifica se existe "b" no textField
                return existsBInTextField1()
            }
        }
        
        return true
    }
    
    func existsBInTextField1() -> Bool{
        if let text = textField1.text {
            if text.contains("b"){
                return true
            }
        }
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            return existsBInTextField1()
        }
        return false
    }

    func countHowManyZsInTheString(text: String) -> Int {
        var quantityOfZ : Int = 0
        if (text.contains("Z")) {
            for char in text{
                if (char == "Z"){
                    quantityOfZ += 1
                }
            }
        }
        return quantityOfZ
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 2{
            if textField1.hasText {
                let quantityOfZ = countHowManyZsInTheString(text: textField1.text!)
                
                if quantityOfZ > 3 {
                    textField1.layer.borderColor = UIColor.red.cgColor
                    textField1.layer.borderWidth = 1.0
                    textField2.isEnabled = false
                }
            }
        }
    }
    
}

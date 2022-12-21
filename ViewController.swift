//
//  ViewController.swift
//  Currency Converter
//
//  Created by Dev Salvi on 21/12/22.
//

import UIKit
//, UIPickerViewDelegate, UIPickerViewDataSource


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var calculateButtonPressed: UIButton!
    
    
    let currencyManager = CurrencyManager()
//    let currencySelect = currencyManager.currencyArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource=self
        currencyPicker.delegate=self
        
       
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        print(currencyManager.currencyArray.count)
        if component==0 {
            return currencyManager.currencyArray.count
        }
        else {
            return currencyManager.currencyArray.count
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0 {
            return currencyManager.currencyArray[row]
        }
        else {
            return currencyManager.currencyArray[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component==0 {
            let rowName = currencyManager.currencyArray[row]
            fromTextField.text = rowName
        }
        else {
            let rowName = currencyManager.currencyArray[row]
            toTextField.text = rowName
        }
        currencyManager.getCurrencyPrice()
//        print(rowName)
        
    }
}


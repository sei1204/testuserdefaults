//
//  ViewController.swift
//  testuserdefaults
//
//  Created by 三城聖 on 2017/09/17.
//  Copyright © 2017年 三城聖. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var someoneTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    let userdefaults: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        someoneTextField.text = userdefaults.object(forKey: "some") as? String
        someoneTextField.delegate = self
        
        resultLabel.text = "----"
        button.setTitle("----", for: UIControlState.normal)
        
    }
    
    @IBAction func save() {
        userdefaults.set(someoneTextField.text, forKey: "some")
        userdefaults.synchronize()
        
        let alert: UIAlertController = UIAlertController(title: "saved!", message: "saved some word.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {ACTION in self.resultLabel.text = self.result(number: 0)}))
        
        present(alert, animated: true, completion: nil)
        
        button.setTitle("more", for: UIControlState.normal)
    }
    
    @IBAction func more() {
        
        let alert: UIAlertController = UIAlertController(title: "more", message: "please select any button.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {ACTION in self.resultLabel.text = self.result(number: 0)}))
        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: {ACTION in self.resultLabel.text = self.result(number: 1)}))
        alert.addAction(UIAlertAction(title: "remove", style: .default, handler: {ACTION in self.resultLabel.text = self.result(number: 2)}))
        alert.addAction(UIAlertAction(title: "edit", style: .default, handler: {ACTION in self.resultLabel.text = self.result(number: 3)}))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func result(number: Int) -> String {
        switch number {
        case 0:
            return "*pushed ok"
        case 1:
            return "*pushed cancel"
        case 2:
            return "*pushed remove"
        case 3:
            return "*pushed edit"
        default:
            return "*out of range"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

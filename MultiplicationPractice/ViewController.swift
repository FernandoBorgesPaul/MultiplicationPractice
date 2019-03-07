//
//  ViewController.swift
//  MultiplicationPractice
//
//  Created by Fernando Borges Paul on 18/02/19.
//  Copyright © 2019 Fernando Borges Paul. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var multiplicationLabel: UILabel!
    
    @IBOutlet weak var answerField: UITextField!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       updateMultiplicationLabel()
        
    }
    
    //Button method
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if(String(result) == answerField.text! ) {
            answerField.text! = ""
            ProgressHUD.showSuccess("Correcto!")
        } else {
            answerField.text! = ""
            ProgressHUD.showError("Error!")
            
        }
        updateMultiplicationLabel()
    }
    

//MARK
    func updateMultiplicationLabel() {
        
        let num1 = Int.random(in: 1...10)
        let num2 = Int.random(in: 1...10)
        
        multiplicationLabel.text! = "\(num1) * \(num2)"
        
        result = num1 * num2
    }
}

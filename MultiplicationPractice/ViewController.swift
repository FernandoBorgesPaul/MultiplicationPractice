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
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: - Global Variables
    var result = 0
    var score = 0
    
    //MARK:- viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMultiplicationLabel()
    }
    
    //MARK:- Button Implementation
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        //Pressing the button will checki if the multiplication of the 2 random numbers
        // is equal to the number that the user input in the answerTextField.
        // If so, the program throws the ProgressHUD animation for CORRECT!
        
        if(String(result) == answerField.text! ) {
            answerField.text! = ""
            ProgressHUD.showSuccess("Correcto!")
            sumPoints()
        } else {
            answerField.text! = ""
            ProgressHUD.showError("Incorrecto!")
            
        }
        updateMultiplicationLabel()
    }
    
    
    //MARK: - Principal Function for Random Numbers
    func updateMultiplicationLabel() {
        
        let num1 = Int.random(in: 1...10)
        let num2 = Int.random(in: 1...10)
        
        multiplicationLabel.text! = "\(num1) * \(num2)"  // the label will display the 2 previous random numbers
        
        result = num1 * num2                             // Multiply both random numbers
    }
    
    func sumPoints(){                      // This function is called everytime the user gets a correct answer
        score = score + 1                  // and updates de intercafe form the scoreLabel.
        scoreLabel.text! = String(score)
    }
    
}

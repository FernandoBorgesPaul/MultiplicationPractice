//
//  ViewController.swift
//  MultiplicationPractice
//
//  Created by Fernando Borges Paul on 18/02/19.
//  Copyright © 2019 Fernando Borges Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    var randNumber1 = Int.random(in: 1...10)
    var randNumber2 = Int.random(in: 1...10)
   
    
    //MARK: - IBOutlets
    @IBOutlet weak var multiplicationLabel: UILabel!
    
    @IBOutlet weak var answerField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        multiplicationLabel.text = "\(randNumber1) * \(randNumber2)"
    }
    
    //Button method
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       /*if answerField is equal to randomnumber then it will print correct answer */
        multiplicationLabel.text = "\(randNumber1) * \(randNumber2)"
        
        let num1 = randNumber1
        let num2 = randNumber2
        
        let result = String(num1 * num2)
        
        if(result == answerField.text!) {
           print("Correct!")
        }
        
        print(result)
    }
}

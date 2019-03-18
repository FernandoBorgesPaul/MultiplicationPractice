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
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    //MARK: - Global Variables
    var result = 0
    var score = 0
    var counter = 1
    
    //MARK:- viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMultiplicationLabel()
        counterLabel.text! = "1/10"
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
            addCount()
        } else {
            answerField.text! = ""
            ProgressHUD.showError("Incorrecto!")
            addCount()
        }
        
        if(counter > 10) {
            
            ProgressHUD.dismiss()
            let alert = UIAlertController(title: "Juego Finalizado!", message: "Obtuviste \(score) correctas de 10!", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Empezar de nuevo", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            
            present(alert,animated:true)
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
    //MARK:- Methods to add points, count and restart.
    
    func sumPoints(){                      // This function is called everytime the user gets a correct answer
        score = score + 1                  // and updates de intercafe form the scoreLabel.
        scoreLabel.text! = String(score)
    }
    
    func addCount() {                            // This method will be increasing every time the user passes to another round.
        counter = counter + 1
        counterLabel.text! = "\(counter)/10"
    }
    
    func startOver() {                          // This method will restart the game in the alert when user presses "Empezar de
        score = 0                               // nuevo" as well as the score, counter, etc.
        counter = 1
        scoreLabel.text! = "\(score)"
        counterLabel.text! = "\(counter)/10"
        updateMultiplicationLabel()
    }
}

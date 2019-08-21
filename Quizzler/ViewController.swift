//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestion = QuestionBank()
    // Não passamos nada no parateses pq nao ha parametros na inicializacao QuestionBank
    var pickedAnwser : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnwser = true
        }
        else if
            sender.tag == 2{
                pickedAnwser = false
        }
        //Call de method check the anwser
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
        
    }
    
    
    func updateUI() {//Update user interface
        scoreLabel.text = "Scroe: \(score)"
        progressLabel.text = "\(questionNumber) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat( questionNumber)
      
    }
    

    func nextQuestion() {
        if questionNumber <= 12{
            //Updating de question label with the next question
        questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
        }   else{
            let alert = UIAlertController(title: "Awesome" , message: "You've finished all the questions, do you want start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in //Sempre que usar o 'in'precisa usar o 'self'
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated : true, completion : nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnwser = allQuestion.list[questionNumber].answer
        if correctAnwser == pickedAnwser{
            ProgressHUD.showSuccess("Correct")
            score = score + 1
        }else{
            ProgressHUD.showError("Wrong")
            
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
       
    }
    

    
}

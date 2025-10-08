//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabelBackground: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let firstQuestion = allQuestions.list[0]
        //questionLabel.text = firstQuestion.text
        nextQuestion()
        questionLabel.layer.cornerRadius = 25  // Ajusta el radio como quieras
        questionLabel.layer.masksToBounds = true // Necesario para que se aplique el redondeado
        
        buttonTrue.layer.cornerRadius = 20
        buttonTrue.layer.masksToBounds = true
        
        buttonFalse.layer.cornerRadius = 20
        buttonFalse.layer.masksToBounds = true
        
        questionLabelBackground.layer.cornerRadius = 25
        questionLabelBackground.layer.masksToBounds = true
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1 ) / 13"
        //progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        let progres = Float(questionNumber + 1) / 13.0
        progressView.setProgress(progres, animated: true)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].text
            updateUI()
        }else{
            //questionLabel.text = "End of the Quiz"
            questionNumber = 0
            
            let alert = UIAlertController(title: "Awsome", message: "You're finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].correctAnswer
        
        if correctAnswer == pickedAnswer{
            score += 1
            ProgressHUD.succeed("Correct!", delay: 1.5)
        }else{
            
            ProgressHUD.failed("Wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}

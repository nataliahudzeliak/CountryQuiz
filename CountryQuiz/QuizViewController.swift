//
//  QuizViewController.swift
//  CountryQuiz
//
//  Created by MacOS on 2/24/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var questions: [Question] = [
        Question(text: "Which climate do you like the most?",
        answers: [
            Answer(text: "Hot, dry summers and mild, rainy \nwinters", type: .Spain
            ),
            Answer(text: "Tropical climate", type: .Thailand
            ),
            Answer(text: "Mild winters and mild summers", type: .France
            ),
            Answer(text: "Cold, windy and cloudy climate", type: .Iceland
                
            )
            ],
                 
        type: .single),
        
        Question(text: "Which food do you like?",
                 answers: [
                    Answer(text: "Seafood", type: .Spain
                    ),
                    Answer(text: "Fruit", type: .Thailand
                    ),
                    Answer(text: "Cheese", type: .France
                    ),
                    Answer(text: "Fish", type: .Iceland
                        
                    )
            ],
                 
                 type: .multiple),
        Question(text: "Do you like adventure?",
                 answers: [
                    Answer(text: "I like calm relax", type: .France
                    ),
                    Answer(text: "I like a bit adventure", type: .Spain
                    ),
                    Answer(text: "I like adventure", type: .Iceland
                    ),
                    Answer(text: "I love adventures and unpredictable!", type: .Thailand
                        
                    )
            ],
                 
                 type: .ranged)
        
    ]
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3: answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
            
        default:
            break
        }
        nextQuestion()
        
        
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        if switch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if switch1.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if switch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if switch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
        
        
    }
    
    
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        let index = Int(round(slider.value)*Float(currentAnswers.count-1))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
        
        
        
    }
    
    
    
    
    
    
    
    
    func updateUI(){
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        
         navigationItem.title = "Question # \(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single: updateSingleStack(using: currentAnswers)
        case .multiple: updateMultipleStack(using: currentAnswers)
        case .ranged: updateRangedStack(using: currentAnswers)
        }
        
        
        
        
    }
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
      
        singleButton1.titleLabel?.lineBreakMode = .byWordWrapping
        singleButton1.titleLabel?.numberOfLines = 0
          singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)



        
    }
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false
        switch4.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        slider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
        
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        }
        else {
           
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue"{
            let resultsViewController = segue.destination as! FinishViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()
    }
    

 

}

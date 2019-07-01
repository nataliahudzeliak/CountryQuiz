//
//  FinishViewController.swift
//  CountryQuiz
//
//  Created by MacOS on 2/24/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    var responses: [Answer]!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    
    
    func calculatePersonalityResult(){
        var frequenceOfAnswers: [CountryType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        
        for response in responseTypes{
             frequenceOfAnswers[response] = (frequenceOfAnswers[response] ?? 0) + 1
        }
       
        let mostCommonAnswer = frequenceOfAnswers.sorted{$0.1 > $1.1}.first!.key
        
        resultLabel.text = "It's a  \(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()

        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
    }
    

    

}

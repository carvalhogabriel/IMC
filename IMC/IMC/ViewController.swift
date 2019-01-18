//
//  ViewController.swift
//  IMC
//
//  Created by Gabriel Guerrero on 1/16/19.
//  Copyright © 2019 Gabriel Guerrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Private Var's
    
    private var imc: Double = 0
    
    //MARK: - @IBOutlet's
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var viewResult: UIView!
    
    //MARK : - @IBAction's
    @IBAction func onCalculateClick(_ sender: Any) {
        if let weight = Double(self.weightTextField.text!), let heigth = Double(self.heightTextField.text!) {
            imc = weight / (heigth*heigth)
            self.showResult()
        }
    }
    
    //MARK - Private Method's
    private func showResult() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        self.resultLabel.text = "\(Int(imc)): \(result)"
        self.resultImageView.image = UIImage(named: image)
        self.viewResult.isHidden = false
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


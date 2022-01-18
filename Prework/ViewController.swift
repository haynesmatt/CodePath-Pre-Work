//
//  ViewController.swift
//  Prework
//
//  Created by Matt Haynes on 1/17/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sliderCount: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tipPerPerson: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }

    @IBAction func tipCalculator(_ sender: Any) {
// Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update total amount label
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // Case float to Int
        let currentValue = Int(sender.value)
                // Update label to slider input
                sliderCount.text = "\(currentValue)"
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Get total per person and tip per person by dividing by slider value
        let tipPerPer = Float(tip)/Float(currentValue)
        let totalPerPer = Float(total)/Float(currentValue)
        
        //Update tip per person and total per person amount
        tipPerPerson.text = String(format: "$%.2f", tipPerPer)
        totalPerPerson.text = String(format: "$%.2f", totalPerPer)
        
    }

}


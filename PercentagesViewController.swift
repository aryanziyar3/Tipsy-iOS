//
//  EditingViewController.swift
//  Tab Calculator
//
//  Created by Aryan on 7/16/19.
//  Copyright © 2019 Aryan. All rights reserved.
//

import Foundation
import UIKit
class PercentagesViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var thinLine: UIView!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBAction func editButtonPressed(_ sender: Any) {
        totalLabel.becomeFirstResponder()
        
    }
    @IBOutlet weak var numberOfPeopleIncrementer: UIStepper!
    @IBOutlet weak var subtotalOrTotal: UISegmentedControl!
    @IBOutlet weak var tipOrTotal: UISegmentedControl!
    @IBOutlet weak var thirdLine: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var thirtyPLabel: UILabel!
    @IBOutlet weak var twentyFivePLabel: UILabel!
    @IBOutlet weak var twentyPLabel: UILabel!
    @IBOutlet weak var fifteenPLabel: UILabel!
    @IBOutlet weak var tenPLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var fivePLabel: UITextField!
    @IBOutlet weak var secondLine: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var thirtyLabel: UILabel!
    @IBOutlet weak var twentyFiveLabel: UILabel!
    @IBOutlet weak var twentyLabel: UILabel!
    @IBOutlet weak var fifteenLabel: UILabel!
    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var totalLabel: UITextField!
    let textColor = UIColor(red: 250/255, green: 113/255, blue: 70/255, alpha: 1.0) /* #fa7146 */
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = "";
        editButton.isEnabled = false
        totalLabel.isEnabled = false
        subtotalOrTotal.isEnabled = false
        numberOfPeopleIncrementer.isEnabled = false
        tipOrTotal.isEnabled = false
        peopleLabel.isEnabled = false
        self.navigationItem.backBarButtonItem?.isEnabled = false
        
        let label = UILabel()
        label.text = "Swipe right to go back to the camera"
        label.textAlignment = .center
        label.textColor = .white
        label.frame = self.view.frame
        let backgroundLabel = UILabel()
        backgroundLabel.frame = self.view.frame
        backgroundLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(backgroundLabel)
        self.view.addSubview(label)
        self.view.bringSubviewToFront(label)
        let image = UIImage(named: "swiperightfinal1.png")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        
        ifFirstTimeOpeningApp(label, imageView)
        
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        self.totalLabel.delegate = self
        self.fivePLabel.delegate = self;
        UISetup()
    }
    
    
    
    fileprivate func UISetup() {
        self.view.backgroundColor = UIColor.white;
        totalLabel.textColor = textColor
        fiveLabel.textColor = textColor
        tenLabel.textColor = textColor
        fifteenLabel.textColor = textColor
        twentyLabel.textColor = textColor
        twentyFiveLabel.textColor = textColor
        thirtyLabel.textColor = textColor
        splitLabel.textColor = textColor
        editButton.setImage(UIImage(named: "editIcon.png"), for: .normal)
        self.navigationController?.navigationBar.tintColor = textColor
        editButton.tintColor = UIColor.black
        subtotalOrTotal.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 13.0)! ], for: .normal)
        tipOrTotal.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 13.0)! ], for: .normal)
        /*
         iPhone XR, and iPhone XS Max
         */
        if UIDevice.current.modelName == "iPhone11,6"
            || UIDevice.current.modelName == "iPhone11,4" || UIDevice.current.modelName == "iPhone11,8"  || UIDevice.current.modelName == "x86_64"
        {
            
            thinLine.frame = CGRect(x:20,y:120,width:374, height:1)
            subtotalOrTotal.frame = CGRect(x: 226, y: 129, width: 168, height: 29)
            numberOfPeopleIncrementer.frame = CGRect(x: 300, y: 246, width: 94, height: 29 )
            secondLine.frame = CGRect(x:20,y:237,width:374, height:1)
            thirdLine.frame = CGRect(x:20,y:339,width:374, height:1)
            amountLabel.frame = CGRect(x: 20, y: 129, width: 66, height: 18)
            peopleLabel.frame = CGRect(x: 20, y: 246, width: 60, height: 18)
            totalLabel.frame = CGRect(x: 20, y: 177, width: 354, height: 63)
            splitLabel.frame = CGRect(x: 20, y: 275, width: 46, height: 65)
            editButton.frame = CGRect(x: 367, y: 203, width: 24, height: 24)
            tipOrTotal.frame = CGRect(x: 226, y:348, width: 165,  height: 29)
            fivePLabel.frame = CGRect(x : 20, y: 408, width: 117, height: 51)
            tenPLabel.frame = CGRect(x : 20, y: 488, width: 87, height: 51)
            fifteenPLabel.frame = CGRect(x : 20, y: 568, width: 87, height: 51)
            twentyPLabel.frame = CGRect(x : 20, y: 648, width: 87, height: 51)
            twentyFivePLabel.frame = CGRect(x : 20, y: 728, width: 87, height: 51)
            thirtyPLabel.frame = CGRect(x : 20, y: 808, width: 87, height: 51)
            fiveLabel.frame = CGRect(x : 144, y: 408, width: 247, height: 51)
            tenLabel.frame = CGRect(x : 144, y: 488, width: 247, height: 51)
            fifteenLabel.frame = CGRect(x : 144, y: 568, width: 247, height: 51)
            twentyLabel.frame = CGRect(x : 144, y: 648, width: 247, height: 51)
            twentyFiveLabel.frame = CGRect(x : 144, y: 728, width: 247, height: 51)
            thirtyLabel.frame = CGRect(x : 144, y: 808, width: 247, height: 51)
            
        }
            /*
             iPhone XS
             iPhone X
             */
        else if UIDevice.current.modelName == "iPhone11,2" ||
            UIDevice.current.modelName == "iPhone10,3" || UIDevice.current.modelName == "iPhone10,6" || UIDevice.current.modelName == "x86_64" {
            
            thinLine.frame = CGRect(x:16,y:120,width: 343, height:1)
            subtotalOrTotal.frame = CGRect(x: 191, y: 129, width: 168, height: 29)
            numberOfPeopleIncrementer.frame = CGRect(x: 265, y: 236, width: 94, height: 29)
            secondLine.frame = CGRect(x:16,y:227,width:343, height:1)
            thirdLine.frame = CGRect(x:16,y:330,width:343, height:1)
            amountLabel.frame = CGRect(x: 16, y: 129, width: 66, height: 18)
            peopleLabel.frame = CGRect(x: 16, y: 236, width: 60, height: 18)
            totalLabel.frame = CGRect(x: 16, y: 165, width: 354, height: 63)
            splitLabel.frame = CGRect(x: 16, y: 266, width: 46, height: 65)
            editButton.frame = CGRect(x: 335, y: 196, width: 24, height: 24)
            tipOrTotal.frame = CGRect(x: 194, y:339, width: 165,  height: 29)
            fivePLabel.frame = CGRect(x : 16, y: 390, width: 87, height: 51)
            tenPLabel.frame = CGRect(x : 16, y: 460, width: 87, height: 51)
            fifteenPLabel.frame = CGRect(x : 16, y: 530, width: 87, height: 51)
            twentyPLabel.frame = CGRect(x : 16, y: 600, width: 87, height: 51)
            twentyFivePLabel.frame = CGRect(x : 16, y: 670, width: 87, height: 51)
            thirtyPLabel.frame = CGRect(x : 16, y: 740, width: 87, height: 51)
            fiveLabel.frame = CGRect(x : 144, y: 390, width: 215, height: 51)
            tenLabel.frame = CGRect(x : 144, y: 460, width: 215, height: 51)
            fifteenLabel.frame = CGRect(x : 144, y: 530, width: 215, height: 51)
            twentyLabel.frame = CGRect(x : 144, y: 600, width: 215, height: 51)
            twentyFiveLabel.frame = CGRect(x : 144, y: 670, width: 215, height: 51)
            thirtyLabel.frame = CGRect(x : 144, y: 740, width: 215, height: 51)
        }
            /*
             iPhone 8 Plus
             iPhone 6 plus
             iPhone 7 plus
             iPhone 6s plus
             */
        else if UIDevice.current.modelName == "iPhone10,2" || UIDevice.current.modelName == "iPhone10,5" || UIDevice.current.modelName == "iPhone9,2" || UIDevice.current.modelName == "iPhone9,4" ||
            UIDevice.current.modelName == "iPhone8,2" ||
            UIDevice.current.modelName == "iPhone7,1"  {
            thinLine.frame = CGRect(x:16,y:80,width: 378, height:1)
            subtotalOrTotal.frame = CGRect(x: 226, y: 89, width: 168, height: 29)
            numberOfPeopleIncrementer.frame = CGRect(x: 300, y: 191, width: 94, height: 29)
            secondLine.frame = CGRect(x:16,y:182,width:378, height:1)
            thirdLine.frame = CGRect(x:16,y:275,width:378, height:1)
            amountLabel.frame = CGRect(x: 16, y: 89, width: 66, height: 18)
            peopleLabel.frame = CGRect(x: 16, y: 191, width: 60, height: 18)
            totalLabel.frame = CGRect(x: 16, y: 125, width: 354, height: 63)
            splitLabel.frame = CGRect(x: 16, y: 217, width: 46, height: 65)
            editButton.frame = CGRect(x: 370, y: 150, width: 24, height: 24)
            tipOrTotal.frame = CGRect(x: 229, y:284, width: 165,  height: 29)
            fivePLabel.frame = CGRect(x : 16, y: 320, width: 87, height: 51)
            tenPLabel.frame = CGRect(x : 16, y: 390, width: 87, height: 51)
            fifteenPLabel.frame = CGRect(x : 16, y: 460, width: 87, height: 51)
            twentyPLabel.frame = CGRect(x : 16, y: 530, width: 87, height: 51)
            twentyFivePLabel.frame = CGRect(x : 16, y: 600, width: 87, height: 51)
            thirtyPLabel.frame = CGRect(x : 16, y: 670, width: 87, height: 51)
            fiveLabel.frame = CGRect(x : 179, y: 320, width: 215, height: 51)
            tenLabel.frame = CGRect(x : 179, y: 390, width: 215, height: 51)
            fifteenLabel.frame = CGRect(x : 179, y: 460, width: 215, height: 51)
            twentyLabel.frame = CGRect(x : 179, y: 530, width: 215, height: 51)
            twentyFiveLabel.frame = CGRect(x : 179, y: 600, width: 215, height: 51)
            thirtyLabel.frame = CGRect(x : 179, y: 670, width: 215, height: 51)
            
            
        }/*
             iPhone 8
             iPhone 7
             iPhone 6
             iPhone 6S
             */
            
        else if (UIDevice.current.modelName == "iPhone10,1" ||
            UIDevice.current.modelName == "iPhone10,4" || UIDevice.current.modelName == "iPhone9,1" || UIDevice.current.modelName == "iPhone9,3" ||
            UIDevice.current.modelName == "iPhone7,2" || UIDevice.current.modelName == "iPhone8,1"  ){
            thinLine.isHidden = true
            subtotalOrTotal.frame = CGRect(x: 191, y: 69, width: 168, height: 29)
            numberOfPeopleIncrementer.frame = CGRect(x: 265, y: 163, width: 94, height: 29)
            secondLine.frame = CGRect(x:16,y:154,width:343, height:1)
            thirdLine.frame = CGRect(x:16,y:244,width:343, height:1)
            amountLabel.frame = CGRect(x: 16, y: 69, width: 66, height: 18)
            peopleLabel.frame = CGRect(x: 16, y: 163, width: 60, height: 18)
            totalLabel.frame = CGRect(x: 16, y: 105, width: 354, height: 47)
            splitLabel.frame = CGRect(x: 16, y: 189, width: 46, height: 56)
            editButton.frame = CGRect(x: 335, y: 122, width: 24, height: 24)
            tipOrTotal.frame = CGRect(x: 194, y:253, width: 165,  height: 29)
            fivePLabel.frame = CGRect(x : 16, y: 293, width: 87, height: 51)
            tenPLabel.frame = CGRect(x : 16, y: 358, width: 87, height: 51)
            fifteenPLabel.frame = CGRect(x : 16, y: 423, width: 87, height: 51)
            twentyPLabel.frame = CGRect(x : 16, y: 488, width: 87, height: 51)
            twentyFivePLabel.frame = CGRect(x : 16, y: 553, width: 87, height: 51)
            thirtyPLabel.frame = CGRect(x : 16, y: 618, width: 87, height: 51)
            fiveLabel.frame = CGRect(x : 179, y: 293, width: 180, height: 51)
            tenLabel.frame = CGRect(x : 179, y: 358, width: 180, height: 51)
            fifteenLabel.frame = CGRect(x : 179, y: 423, width: 180, height: 51)
            twentyLabel.frame = CGRect(x : 179, y: 488, width: 180, height: 51)
            twentyFiveLabel.frame = CGRect(x : 179, y: 553, width: 180, height: 51)
            thirtyLabel.frame = CGRect(x : 179, y: 618, width: 180, height: 51)
            
        }else if (UIDevice.current.modelName == "iPhone8,4" || UIDevice.current.modelName == "iPhone6,1" || UIDevice.current.modelName == "iPhone6,2" || UIDevice.current.modelName == "iPhone5,3" || UIDevice.current.modelName == "iPhone5,4" || UIDevice.current.modelName == "iPhone5,1" || UIDevice.current.modelName == "iPhone5,2" ){
            thinLine.isHidden = true
            subtotalOrTotal.frame = CGRect(x: 161, y: 69, width: 140, height: 20)
            numberOfPeopleIncrementer.frame = CGRect(x: 207, y: 163, width: 94, height: 29)
            secondLine.frame = CGRect(x:16,y:150,width:285, height:1)
            thirdLine.frame = CGRect(x:16,y:240,width:285, height:1)
            amountLabel.frame = CGRect(x: 16, y: 69, width: 80, height: 20)
            amountLabel.font = UIFont(name: "Copperplate", size: 14)
            peopleLabel.frame = CGRect(x: 16, y: 159, width: 60, height: 18)
            peopleLabel.font = UIFont(name: "Copperplate", size: 14)
            totalLabel.frame = CGRect(x: 16, y: 105, width: 354, height: 47)
            totalLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 35.0)!
            splitLabel.frame = CGRect(x: 16, y: 189, width: 46, height: 56)
            splitLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 35.0)!
            editButton.frame = CGRect(x: 275, y: 122, width: 24, height: 24)
            tipOrTotal.frame = CGRect(x: 161, y:249, width: 140,  height: 20)
            fivePLabel.frame = CGRect(x : 16, y: 279, width: 87, height: 51)
            fivePLabel.font = UIFont(name: "HelveticaNeue-Light", size: 17)
            tenPLabel.frame = CGRect(x : 16, y: 339, width: 87, height: 51)
            tenPLabel.font = UIFont(name: "HelveticaNeue-Light", size: 17)
            fifteenPLabel.frame = CGRect(x : 16, y: 399, width: 87, height: 51)
            fifteenPLabel.font = UIFont(name: "HelveticaNeue-Light", size: 17)
            twentyPLabel.frame = CGRect(x : 16, y: 459, width: 87, height: 51)
            twentyPLabel.font = UIFont(name: "HelveticaNeue-Light", size: 17)
            twentyFivePLabel.frame = CGRect(x : 16, y: 519, width: 87, height: 51)
            twentyFivePLabel.font = UIFont(name: "HelveticaNeue-Light", size: 17)
            thirtyPLabel.isHidden = true
            fiveLabel.frame = CGRect(x : 110, y: 279, width: 180, height: 51)
            tenLabel.frame = CGRect(x : 110, y: 339, width: 180, height: 51)
            fifteenLabel.frame = CGRect(x : 110, y: 399, width: 180, height: 51)
            twentyLabel.frame = CGRect(x : 110, y: 459, width: 180, height: 51)
            twentyFiveLabel.frame = CGRect(x : 110, y: 519, width: 180, height: 51)
            thirtyLabel.isHidden = true
            
            
        }
        subtotalOrTotal.tintColor = textColor
        numberOfPeopleIncrementer.tintColor = textColor
        numberOfPeopleIncrementer.minimumValue = 1
        numberOfPeopleIncrementer.maximumValue = 30
    }
    
    fileprivate func ifFirstTimeOpeningApp(_ label: UILabel, _ imageView: UIImageView) {
        if UIDevice.current.modelName == "iPhone11,6"
            || UIDevice.current.modelName == "iPhone11,4" || UIDevice.current.modelName == "iPhone11,8" ||
            UIDevice.current.modelName == "x86_64" || UIDevice.current.modelName == "iPhone12,1" || UIDevice.current.modelName == "iPhone12,3"
        {
            /*
             iPhone XR, and iPhone XS Max
             WORKS
             */
            label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
            imageView.frame = CGRect(x: 50, y: 300, width: 64, height: 64)
            let oldCenter = imageView.center
            let newCenter = CGPoint(x: oldCenter.x + 250, y: oldCenter.y)
            UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                
                imageView.center = newCenter
            }) { (success: Bool) in
                
                self.editButton.isEnabled = true
                self.totalLabel.isEnabled = true
                self.subtotalOrTotal.isEnabled = true
                self.numberOfPeopleIncrementer.isEnabled = true
                self.tipOrTotal.isEnabled = true
                self.peopleLabel.isEnabled = true
            }
        } else if UIDevice.current.modelName == "iPhone11,2" ||
            UIDevice.current.modelName == "iPhone10,3" || UIDevice.current.modelName == "iPhone10,6" || UIDevice.current.modelName == "iPhone12,3"
        {
            
            label.font = UIFont(name: "HelveticaNeue-Light", size: 17)
            imageView.frame = CGRect(x: 30, y: 300, width: 64, height: 64)
            let oldCenter = imageView.center
            let newCenter = CGPoint(x: oldCenter.x + 250, y: oldCenter.y)
            UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                imageView.center = newCenter
            }) { (success: Bool) in
                
                self.editButton.isEnabled = true
                self.totalLabel.isEnabled = true
                self.subtotalOrTotal.isEnabled = true
                self.numberOfPeopleIncrementer.isEnabled = true
                self.tipOrTotal.isEnabled = true
                self.peopleLabel.isEnabled = true
                
            }
        } else if UIDevice.current.modelName == "iPhone10,2" || UIDevice.current.modelName == "iPhone10,5" || UIDevice.current.modelName == "iPhone9,2" || UIDevice.current.modelName == "iPhone9,4" ||
            UIDevice.current.modelName == "iPhone8,2" ||
            UIDevice.current.modelName == "iPhone7,1"  {
            
            label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
            imageView.frame = CGRect(x: 30, y: 250, width: 64, height: 64)
            let oldCenter = imageView.center
            let newCenter = CGPoint(x: oldCenter.x + 250, y: oldCenter.y)
            UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                imageView.center = newCenter
            }) { (success: Bool) in
                
                self.editButton.isEnabled = true
                self.totalLabel.isEnabled = true
                self.subtotalOrTotal.isEnabled = true
                self.numberOfPeopleIncrementer.isEnabled = true
                self.tipOrTotal.isEnabled = true
                self.peopleLabel.isEnabled = true
                
            }
        }else if (UIDevice.current.modelName == "iPhone10,1" ||
            UIDevice.current.modelName == "iPhone10,4" || UIDevice.current.modelName == "iPhone9,1" || UIDevice.current.modelName == "iPhone9,3" ||
            UIDevice.current.modelName == "iPhone7,2" || UIDevice.current.modelName == "iPhone8,1"  ){
            
            label.font = UIFont(name: "HelveticaNeue-Light", size: 16)
            imageView.frame = CGRect(x: 20, y: 250, width: 64, height: 64)
            let oldCenter = imageView.center
            let newCenter = CGPoint(x: oldCenter.x + 250, y: oldCenter.y)
            UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                imageView.center = newCenter
            }) { (success: Bool) in
                
                self.editButton.isEnabled = true
                self.totalLabel.isEnabled = true
                self.subtotalOrTotal.isEnabled = true
                self.numberOfPeopleIncrementer.isEnabled = true
                self.tipOrTotal.isEnabled = true
                self.peopleLabel.isEnabled = true
                
            }
        }else if (UIDevice.current.modelName == "iPhone8,4" || UIDevice.current.modelName == "iPhone6,1" || UIDevice.current.modelName == "iPhone6,2" || UIDevice.current.modelName == "iPhone5,3" || UIDevice.current.modelName == "iPhone5,4" || UIDevice.current.modelName == "iPhone5,1" || UIDevice.current.modelName == "iPhone5,2"  ){
            /*
             iPhone SE
             iPhone 5
             iPhone 5s
             iPhone 5c
             */
            label.font = UIFont(name: "HelveticaNeue-Light", size: 17)
            imageView.frame = CGRect(x: 20, y: 180, width: 64, height: 64)
            let oldCenter = imageView.center
            let newCenter = CGPoint(x: oldCenter.x + 220, y: oldCenter.y)
            UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                imageView.center = newCenter
            }) { (success: Bool) in
                self.editButton.isEnabled = true
                self.totalLabel.isEnabled = true
                self.subtotalOrTotal.isEnabled = true
                self.numberOfPeopleIncrementer.isEnabled = true
                self.tipOrTotal.isEnabled = true
                self.peopleLabel.isEnabled = true
                
            }
            
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                // Go back to the camera screen
            case UISwipeGestureRecognizer.Direction.right:
                navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
    @IBAction func stepper(_ sender: UIStepper) {
        if(tipOrTotal.selectedSegmentIndex == 1){
            if subtotalOrTotal.selectedSegmentIndex == 0{
                var tax = 0.0
                if(totalAmount! > subtotalAmount!){
                    tax = totalAmount! - subtotalAmount!
                }
                updatePercentageTotals(val: true)
                if fivePLabel.text != nil {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())!) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + tax + (subtotalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    fiveLabel.text? = (formattedNumber!)
                }
                
            }else {
                updatePercentageTotals(val: false)
                if fivePLabel.text != nil {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (totalAmount! + (totalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    fiveLabel.text? = (formattedNumber!)
                }
            }
        }
        splitLabel.text? = (String(Int(numberOfPeopleIncrementer.value)))
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        
        if(textField == totalLabel){
            textField.resignFirstResponder()
        if subtotalOrTotal.selectedSegmentIndex == 0{
            subtotalAmount = textField.text?.toDouble()
            totalAmount = textField.text?.toDouble()
            updatePercentageTotals(val: true)
            if fivePLabel.text != nil {
                if(tipOrTotal.selectedSegmentIndex == 0){
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    let formattedNumber = numberFormatter.string(from: NSNumber(value: subtotalAmount! * (value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }else {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    let formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + (subtotalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
            }
        }else {
            subtotalAmount = textField.text?.toDouble()
            totalAmount = textField.text?.toDouble()
            updatePercentageTotals(val: false)
            if fivePLabel.text != nil {
                if(tipOrTotal.selectedSegmentIndex == 0){
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    let formattedNumber = numberFormatter.string(from: NSNumber(value: totalAmount! * (value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }else {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    let formattedNumber = numberFormatter.string(from: NSNumber(value: (totalAmount! + (totalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
            }
        }
        return true
        }
        else if (textField == fivePLabel){
            var tax = 0.0
            if(totalAmount! > subtotalAmount!){
                tax = totalAmount! - subtotalAmount!
            }
            if(!((textField.text?.contains("%"))!)){
                textField.text?.append("%")
            }
            var textFieldText = textField.text!.filter("0123456789.".contains)
            
            if let customTip = textFieldText.toInt()  {
            textField.resignFirstResponder()
            
            }else if textFieldText == "" {
                textField.resignFirstResponder()
            }
            if subtotalOrTotal.selectedSegmentIndex == 0{
                if(tipOrTotal.selectedSegmentIndex == 0){
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                numberFormatter.alwaysShowsDecimalSeparator = true
                numberFormatter.maximumFractionDigits = 2
                numberFormatter.minimumFractionDigits = 2
                if(textFieldText == ""){
                    textFieldText = "0.0"
                }
                let value = ((textFieldText.toDouble())! ) / 100
                var formattedNumber = numberFormatter.string(from: NSNumber(value: subtotalAmount! * (value)))
                
                fiveLabel.text? = (formattedNumber!)
                }else {
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + tax + (subtotalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
                
            }else {
                if(tipOrTotal.selectedSegmentIndex == 0){
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                numberFormatter.alwaysShowsDecimalSeparator = true
                numberFormatter.maximumFractionDigits = 2
                numberFormatter.minimumFractionDigits = 2
                if(textFieldText == ""){
                    textFieldText = "0.0"
                }
                let value = ((textFieldText.toDouble())! ) / 100
                var formattedNumber = numberFormatter.string(from: NSNumber(value: totalAmount! * (value)))
                
                fiveLabel.text? = (formattedNumber!)
                
                }else {
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (totalAmount! + (totalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                    
                }
            }
            return true;
        }
        return false;
    }
   
    override func viewDidAppear(_ animated: Bool) {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        subtotalAmount = String(format: "%.2f", subtotalAmount!).toDouble()
        var formattedNumber = numberFormatter.string(from: NSNumber(value:subtotalAmount!))
        totalLabel.text?.append(formattedNumber!)
        fivePercent = String(format: "%.2f", fivePercent!).toDouble()
        formattedNumber = numberFormatter.string(from: NSNumber(value: fivePercent!))
        fiveLabel.text?.append(formattedNumber!)
        tenPercent = String(format: "%.2f", tenPercent!).toDouble()
        formattedNumber = numberFormatter.string(from: NSNumber(value: tenPercent!))
        tenLabel.text?.append(formattedNumber!)
        fifteenPercent = String(format: "%.2f", fifteenPercent!).toDouble()
        formattedNumber = numberFormatter.string(from: NSNumber(value: fifteenPercent!))
        fifteenLabel.text?.append(formattedNumber!)
        twentyPercent = String(format: "%.2f", twentyPercent!).toDouble()
        formattedNumber = numberFormatter.string(from: NSNumber(value: twentyPercent!))
        twentyLabel.text?.append(formattedNumber!)
        twentyFivePercent = String(format: "%.2f", twentyFivePercent!).toDouble()
        formattedNumber = numberFormatter.string(from: NSNumber(value: twentyFivePercent!))
        twentyFiveLabel.text?.append(formattedNumber!)
        thirtyPercent = String(format: "%.2f", thirtyPercent!).toDouble()
        formattedNumber = numberFormatter.string(from: NSNumber(value: thirtyPercent!))
        thirtyLabel.text? = (formattedNumber!)
    
    }
    
    /*
     true: subtotal
     false: total
     */
    func updatePercentageTotals(val: Bool){
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        var tax = 0.0
        if(tipOrTotal.selectedSegmentIndex == 1){
            if(val == true){
                if(totalAmount != 0.0){
                    tax = totalAmount! - subtotalAmount!
                }
                
                tenPercent = String(format: "%.2f", tenPercent!).toDouble()
         
              var  formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + (subtotalAmount! * 0.10) + tax) / Double(numberOfPeopleIncrementer.value)))
                tenLabel.text? =  formattedNumber!
                fifteenPercent = String(format: "%.2f", fifteenPercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + (subtotalAmount! * 0.15) + tax) / Double(numberOfPeopleIncrementer.value)))
                fifteenLabel.text? =  formattedNumber!
                twentyPercent = String(format: "%.2f", twentyPercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + (subtotalAmount! * 0.20) + tax) / Double(numberOfPeopleIncrementer.value)))
                twentyLabel.text? =  formattedNumber!
                
                twentyFivePercent = String(format: "%.2f", twentyFivePercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + (subtotalAmount! * 0.25) + tax) / Double(numberOfPeopleIncrementer.value)))
                twentyFiveLabel.text? =  formattedNumber!
                
                thirtyPercent = String(format: "%.2f", thirtyPercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + (subtotalAmount! * 0.30) + tax) / Double(numberOfPeopleIncrementer.value)))
                thirtyLabel.text? =  formattedNumber!
            }else {
                tenPercentTotal = String(format: "%.2f", tenPercentTotal!).toDouble()
              var  formattedNumber = numberFormatter.string(from: NSNumber(value:  (totalAmount! + (totalAmount! * 0.10)) / Double(numberOfPeopleIncrementer.value)))
                tenLabel.text? =  formattedNumber!
                fifteenPercentTotal = String(format: "%.2f", fifteenPercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  (totalAmount! + (totalAmount! * 0.15)) / Double(numberOfPeopleIncrementer.value)))
                fifteenLabel.text? =  formattedNumber!
                twentyPercentTotal = String(format: "%.2f", twentyPercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  (totalAmount! + (totalAmount! * 0.20)) / Double(numberOfPeopleIncrementer.value)))
                twentyLabel.text? =  formattedNumber!
                twentyFivePercentTotal = String(format: "%.2f", twentyFivePercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  (totalAmount! + (totalAmount! * 0.25)) / Double(numberOfPeopleIncrementer.value)))
                twentyFiveLabel.text? = formattedNumber!
                thirtyPercentTotal = String(format: "%.2f", thirtyPercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  (totalAmount! + (totalAmount! * 0.30)) / Double(numberOfPeopleIncrementer.value)))
                thirtyLabel.text? =  formattedNumber!
            }
        }else {
            
            if(val == true){
               
                if(subtotalAmount == nil){
                    subtotalAmount = 0.0
                }
                
                tenPercent = String(format: "%.2f", tenPercent!).toDouble()
               var formattedNumber = numberFormatter.string(from: NSNumber(value: ((subtotalAmount! * 0.10))))
                tenLabel.text? =  formattedNumber!
                fifteenPercent = String(format: "%.2f", fifteenPercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: ((subtotalAmount! * 0.15))))
                fifteenLabel.text? =  formattedNumber!
                twentyPercent = String(format: "%.2f", twentyPercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: ( (subtotalAmount! * 0.20))))
                twentyLabel.text? =  formattedNumber!
                
                twentyFivePercent = String(format: "%.2f", twentyFivePercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: ((subtotalAmount! * 0.25))))
                twentyFiveLabel.text? =  formattedNumber!
                
                thirtyPercent = String(format: "%.2f", thirtyPercent!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value: ((subtotalAmount! * 0.30))))
                thirtyLabel.text? =  formattedNumber!
            }else {
                if(totalAmount == nil){
                    totalAmount = 0.0
                }
               
                tenPercentTotal = String(format: "%.2f", tenPercentTotal!).toDouble()
               var formattedNumber = numberFormatter.string(from: NSNumber(value:  ((totalAmount! * 0.10))))
                tenLabel.text? =  formattedNumber!
                fifteenPercentTotal = String(format: "%.2f", fifteenPercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  ((totalAmount! * 0.15))))
                fifteenLabel.text? =  formattedNumber!
                twentyPercentTotal = String(format: "%.2f", twentyPercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  ((totalAmount! * 0.20))))
                twentyLabel.text? =  formattedNumber!
                twentyFivePercentTotal = String(format: "%.2f", twentyFivePercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  ((totalAmount! * 0.25))))
                twentyFiveLabel.text? = formattedNumber!
                thirtyPercentTotal = String(format: "%.2f", thirtyPercentTotal!).toDouble()
                formattedNumber = numberFormatter.string(from: NSNumber(value:  ((totalAmount! * 0.30))))
                thirtyLabel.text? =  formattedNumber!
            }
        }
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        var subtotalTotal = true;
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        switch subtotalOrTotal.selectedSegmentIndex {
        case 0:
            subtotalTotal = true;
          
            subtotalAmount = String(format: "%.2f", subtotalAmount!).toDouble()
            let formattedNumber = numberFormatter.string(from: NSNumber(value: subtotalAmount!))
            totalLabel.text? =  formattedNumber!
            updatePercentageTotals(val: subtotalTotal)
            
            if fivePLabel.text != nil {
                if(tipOrTotal.selectedSegmentIndex == 0){
                var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                numberFormatter.alwaysShowsDecimalSeparator = true
                numberFormatter.maximumFractionDigits = 2
                numberFormatter.minimumFractionDigits = 2
                if(textFieldText == ""){
                    textFieldText = "0.0"
                }
                let value = ((textFieldText.toDouble())! ) / 100
                var formattedNumber = numberFormatter.string(from: NSNumber(value: subtotalAmount! * (value)))
                
                fiveLabel.text? = (formattedNumber!)
                }else {
                    var tax = 0.0
                    if(totalAmount! > subtotalAmount!){
                        tax = totalAmount! - subtotalAmount!
                    }
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + tax + (subtotalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
            }
            
        case 1:
            subtotalTotal = false;
            totalAmount = String(format: "%.2f", totalAmount!).toDouble()
            let formattedNumber = numberFormatter.string(from: NSNumber(value: totalAmount!))
            totalLabel.text? = formattedNumber!
            updatePercentageTotals(val: subtotalTotal)
            if fivePLabel.text != nil {
                if(tipOrTotal.selectedSegmentIndex == 0){
                 var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                numberFormatter.alwaysShowsDecimalSeparator = true
                numberFormatter.maximumFractionDigits = 2
                numberFormatter.minimumFractionDigits = 2
                if(textFieldText == ""){
                    textFieldText = "0.0"
                }
                let value = ((textFieldText.toDouble())! ) / 100
                var formattedNumber = numberFormatter.string(from: NSNumber(value: totalAmount! * (value)))
                
                fiveLabel.text? = (formattedNumber!)
                }else {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (totalAmount! + (totalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
            }
        default:
            break;
            
        }
    }
    
    @IBAction func tipOrTotalIndexChanged(_ sender: Any) {
        var tipTotal = true
        let subtotalTotal = subtotalOrTotal.selectedSegmentIndex
        switch tipOrTotal.selectedSegmentIndex{
            /*Display the tip's*/
        case 0:
            tipTotal = true
            /*Subtotal*/
            if(subtotalTotal == 0){
                updatePercentageTotals(val: true)
                if fivePLabel.text != nil {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: subtotalAmount! * (value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
            }
                /*Total*/
            else if (subtotalTotal == 1){
                updatePercentageTotals(val: false)
                if fivePLabel.text != nil {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: totalAmount! * (value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
                
            }
            /*Display the totals*/
        case 1:
            tipTotal = false
            /*Subtotal*/
            if(subtotalTotal == 0){
                updatePercentageTotals(val: true)
                var tax = 0.0
                if(totalAmount! > subtotalAmount!){
                    tax = totalAmount! - subtotalAmount!
                }
                if fivePLabel.text != nil {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (subtotalAmount! + tax +  (subtotalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
            }/*Total*/
            else if(subtotalTotal == 1){
                updatePercentageTotals(val: false)
                if fivePLabel.text != nil {
                    var textFieldText = fivePLabel.text!.filter("0123456789.".contains)
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    numberFormatter.alwaysShowsDecimalSeparator = true
                    numberFormatter.maximumFractionDigits = 2
                    numberFormatter.minimumFractionDigits = 2
                    if(textFieldText == ""){
                        textFieldText = "0.0"
                    }
                    let value = ((textFieldText.toDouble())! ) / 100
                    var formattedNumber = numberFormatter.string(from: NSNumber(value: (totalAmount! + (totalAmount! * (value))) / Double(numberOfPeopleIncrementer.value)))
                    
                    fiveLabel.text? = (formattedNumber!)
                }
            }
            
        default:
            break;
        }
        
    }
    
}

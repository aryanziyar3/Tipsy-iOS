//
//  ViewController.swift
//  Tab Calculator
//
//  Created by Aryan on 6/21/19.
//  Copyright © 2019 Aryan. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

var subtotalOrTotal: Bool? = true
var totalAmount : Double? = 0.0
var subtotalAmount: Double? = 0.0
var fivePercent : Double? = 0.0
var tenPercent : Double? = 0.0
var fifteenPercent: Double? = 0.0
var twentyPercent: Double? = 0.0
var twentyFivePercent: Double? = 0.0
var thirtyPercent: Double?  = 0.0
var fivePercentTotal : Double? = 0.0
var tenPercentTotal : Double? = 0.0
var fifteenPercentTotal: Double? = 0.0
var twentyPercentTotal: Double? = 0.0
var twentyFivePercentTotal: Double? = 0.0
var thirtyPercentTotal: Double?  = 0.0

class ViewController: UIViewController, UINavigationControllerDelegate{
    
    // getter for screen width
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // getter for screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    var captureSession = AVCaptureSession()
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    var photoOutput: AVCapturePhotoOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the camera
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: .video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backFacingCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontFacingCamera = device
            }
        }
        currentDevice = backFacingCamera
        
        // Adding a gesture recognizer for swiping left to manually enter bill amount
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                //change view controllers
                self.performSegue(withIdentifier: "percentageSegue", sender: self)
            default:
                break
            }
        }
    }
    
    @objc func action(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "percentageSegue", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let navigationTitleFont = UIFont(name: "Copperplate", size: 40)!
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: navigationTitleFont], for: .normal)
        let buttonFont = UIFont(name: "Copperplate", size: 15)!
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: buttonFont], for: .normal)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationTitleFont]
        begin()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func begin() {
        let stillImageOutput = AVCapturePhotoOutput()
        var stillImage: UIImage?
        var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
        
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .auto
       
        currentDevice = backFacingCamera
    
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "capture9.png"), for: .normal)
            btn.addTarget(self, action: #selector(self.captureButtonPressed(sender:)), for: .touchUpInside)
            let label = UILabel()
            label.frame = self.view.frame
            label.textAlignment = .center
            label.text = "Swipe left to enter amount manually"
            label.textColor = .white
            label.adjustsFontSizeToFitWidth = true
            let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
            if !launchedBefore{
                let welcomeLabel = UILabel()
                UserDefaults.standard.set(true, forKey: "launchedBefore")
                btn.isEnabled = false
                let image = UIImage(named: "swipeleftfinal1.png")
                let imageView = UIImageView(image: image)
                let backgroundLabel = UILabel()
                backgroundLabel.frame = self.view.frame
                backgroundLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                self.view.addSubview(label)
                self.view.addSubview(imageView)
     
                if UIDevice.current.modelName == "iPhone11,6"
                    || UIDevice.current.modelName == "iPhone11,4" || UIDevice.current.modelName == "iPhone11,8"
                {
                    label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
                    imageView.frame = CGRect(x: 300, y: 300, width: 64, height: 64)
                    let oldCenter = imageView.center
                    let newCenter = CGPoint(x: oldCenter.x - 250, y: oldCenter.y)
                    UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                        imageView.center = newCenter
                    }) { (success: Bool) in
                        imageView.removeFromSuperview()
                        label.removeFromSuperview()
                        backgroundLabel.removeFromSuperview()
                        welcomeLabel.removeFromSuperview()
                        btn.isEnabled = true
                    }
                }else if UIDevice.current.modelName == "iPhone11,2" ||
                    UIDevice.current.modelName == "iPhone10,3" || UIDevice.current.modelName == "iPhone10,6"
                {
                    
                    label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
                    imageView.frame = CGRect(x: 280, y: 300, width: 64, height: 64)
                    let oldCenter = imageView.center
                    let newCenter = CGPoint(x: oldCenter.x - 250, y: oldCenter.y)
                    UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                        imageView.center = newCenter
                    }) { (success: Bool) in
                        
                        imageView.removeFromSuperview()
                        label.removeFromSuperview()
                        backgroundLabel.removeFromSuperview()
                        btn.isEnabled = true
                    }
                }else if UIDevice.current.modelName == "iPhone10,2" || UIDevice.current.modelName == "iPhone10,5" || UIDevice.current.modelName == "iPhone9,2" || UIDevice.current.modelName == "iPhone9,4" ||
                    UIDevice.current.modelName == "iPhone8,2" ||
                    UIDevice.current.modelName == "iPhone7,1"  {
                    /*
                     iPhone 8 Plus
                     iPhone 6 plus
                     iPhone 7 plus
                     iPhone 6s plus
                     */
                    label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
                    imageView.frame = CGRect(x: 300, y: 250, width: 64, height: 64)
                    let oldCenter = imageView.center
                    let newCenter = CGPoint(x: oldCenter.x - 250, y: oldCenter.y)
                    UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                        imageView.center = newCenter
                    }) { (success: Bool) in
                        
                        imageView.removeFromSuperview()
                        label.removeFromSuperview()
                        backgroundLabel.removeFromSuperview()
                        btn.isEnabled = true
                    }
                }else if (UIDevice.current.modelName == "iPhone10,1" ||
                    UIDevice.current.modelName == "iPhone10,4" || UIDevice.current.modelName == "iPhone9,1" || UIDevice.current.modelName == "iPhone9,3" ||
                    UIDevice.current.modelName == "iPhone7,2" || UIDevice.current.modelName == "iPhone8,1"  ){
                    /*
                     iPhone 8
                     iPhone 7
                     iPhone 6
                     iPhone 6S
                     4.7 in
                     */
                    
                    label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
                    imageView.frame = CGRect(x: 270, y: 250, width: 64, height: 64)
                    let oldCenter = imageView.center
                    let newCenter = CGPoint(x: oldCenter.x - 250, y: oldCenter.y)
                    UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                        imageView.center = newCenter
                    }) { (success: Bool) in
                        imageView.removeFromSuperview()
                        label.removeFromSuperview()
                        backgroundLabel.removeFromSuperview()
                        btn.isEnabled = true
                      
                    }
                }else if (UIDevice.current.modelName == "iPhone8,4" || UIDevice.current.modelName == "iPhone6,1" || UIDevice.current.modelName == "iPhone6,2" || UIDevice.current.modelName == "iPhone5,3" || UIDevice.current.modelName == "iPhone5,4" || UIDevice.current.modelName == "iPhone5,1" || UIDevice.current.modelName == "iPhone5,2"  ){
                    /*
                     iPhone SE
                     iPhone 5
                     iPhone 5s
                     iPhone 5c
                     */
                   
                    label.font = UIFont(name: "HelveticaNeue-Light", size: 18)
                    imageView.frame = CGRect(x: 240, y: 180, width: 64, height: 64)
                    let oldCenter = imageView.center
                    let newCenter = CGPoint(x: oldCenter.x - 220, y: oldCenter.y)
                    UIView.animate(withDuration: 1.4, delay: 1, options: [.repeat, .curveEaseOut], animations: {
                        imageView.center = newCenter
                    }) { (success: Bool) in
                        imageView.removeFromSuperview()
                        label.removeFromSuperview()
                        backgroundLabel.removeFromSuperview()
                        btn.isEnabled = true
                    }
                    
                }
            }
    }
    
    @objc func captureButtonPressed(sender: UIButton){
        sender.isHidden  = true
        sender.isEnabled = false
    }

    func runTextRecognition(with bill: UIImage){
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        var tax = false;
        var seenTotal = false;
        var seenSubTotal = false;
        let vision = Vision.vision()
        let textRecognizer = vision.onDeviceTextRecognizer()
        let visionImage = VisionImage(image: bill)
        textRecognizer.process(visionImage) { result, error in
            guard error == nil, let result = result else {
                // ...
                return
            }
            let commaSet: Set<Character> = [","]
            let dollarSignSet: Set<Character> = ["$"]
            let charset: Set<Character> = ["."]
            let euroSet: Set<Character> = ["£"]
            let commaAndDollar : Set<Character> = [",", "$"]
            let dollarAndDecimal: Set<Character> = ["$", "."]
            let commaAndEuro: Set<Character> = [",", "£"]
            let euroAndDecimal: Set<Character> = ["£", "."]
            let commaEuroDecimal: Set<Character> = ["," , "£", "."]
            let commaDollarDecimal: Set<Character> = [",", "$", "."]
            var pricesArr = [Double]()
            
            var beforeDecimal  = ""
            for block in result.blocks{
                for line in block.lines{
                    for element in line.elements {
                        print(element.text)
                        if(beforeDecimal != ""){
                            if let int = element.text.toInt(){
                                beforeDecimal.append(element.text)
                                if let double = beforeDecimal.toDouble(){
                                    pricesArr.append(double)
                                }
                            }
                            beforeDecimal = ""
                        }
                        if(element.text.lowercased() == "subtotal"){
                            seenSubTotal = true
                        }
                        if(element.text.lowercased() == "total"){
                            seenTotal = true
                        }
                        
                        if(element.text.lowercased() == "tax" || element.text.lowercased() == "tax:" || element.text.lowercased() == "taxes" || (seenSubTotal == true && seenTotal == true) ){
                            tax = true;
                        }
                        if(element.text.last == "."){
                            beforeDecimal = element.text
                            
                        }
                        
                        let isSubset = charset.isStrictSubset(of: element.text)
                        let isSubsetofDollarSign = dollarSignSet.isStrictSubset(of: element.text)
                        let isSubsetofCommaSet = commaSet.isStrictSubset(of: element.text)
                        let isSubsetofEuroSet = euroSet.isStrictSubset(of: element.text)
                        let strictSubset1 = commaDollarDecimal.isStrictSubset(of: element.text)
                        let strictSubset2 = commaEuroDecimal.isStrictSubset(of: element.text)
                        let isStrictSubsetofCommaAndDollar = commaAndDollar.isStrictSubset(of: element.text)
                        let isStrictSubsetofDollarAndDecimal = dollarAndDecimal.isStrictSubset(of: element.text)
                        let isStrictSubsetofCommaAndEuro = commaAndEuro.isStrictSubset(of: element.text)
                        let isStrictSubsetofEuroAndDecimal = euroAndDecimal.isStrictSubset(of: element.text)
                        
                        if let val = element.text.double {
                            /*
                             Example:
                             14.5
                             */
                            if isSubset == true && element.text.last != "."{
                                pricesArr.append(element.text.toDouble()!)
                            }
                            
                        }
                            /*
                             Example:
                             $14,58.91
                             */
                        else if strictSubset1 == true {
                            var test = element.text.replacingOccurrences(of: "$", with: "", options: NSString.CompareOptions.literal, range:nil)
                            test = test.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }else if strictSubset2 == true {
                            /*
                             Example: €14,998.51
                             */
                            var test = element.text.replacingOccurrences(of: "£", with: "", options: NSString.CompareOptions.literal, range:nil)
                            test = test.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }
                        else if isStrictSubsetofCommaAndDollar == true {
                            
                            var test = element.text.replacingOccurrences(of: "$", with: "", options: NSString.CompareOptions.literal, range:nil)
                            test = test.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        } else if isStrictSubsetofDollarAndDecimal == true {
                            
                            var test = element.text.replacingOccurrences(of: "$", with: "", options: NSString.CompareOptions.literal, range:nil)
                            
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }
                        else if isStrictSubsetofCommaAndEuro == true {
                            
                            var test = element.text.replacingOccurrences(of: "£", with: "", options: NSString.CompareOptions.literal, range:nil)
                            test = test.replacingOccurrences(of: ",", with: ".", options: NSString.CompareOptions.literal, range:nil)
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }
                        else if isStrictSubsetofEuroAndDecimal == true {
                            var test = element.text.replacingOccurrences(of: "£", with: "", options: NSString.CompareOptions.literal, range:nil)
                            
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }
                            
                        else if isSubsetofDollarSign == true{
                            
                            var test = element.text.replacingOccurrences(of: "$", with: "", options: NSString.CompareOptions.literal, range:nil)
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }else if isSubsetofCommaSet == true && element.text.last != "," {
                            
                            var test = element.text.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }else if isSubsetofEuroSet == true {
                            var test = element.text.replacingOccurrences(of: "£", with: "", options: NSString.CompareOptions.literal, range:nil)
                            if let val = test.double {
                                pricesArr.append(test.toDouble()!)
                            }
                        }
                    }
                }
            }
            
            // Total Amount is the highest value
            if(pricesArr.count != 0){
                pricesArr.sort(by: >)
                totalAmount = pricesArr[0]
            }
            
            if(pricesArr.count > 1){
                if(tax == false){
                    subtotalAmount = pricesArr[0]
                }else {
                    var i = 1
                    while(i < pricesArr.count && pricesArr[i] == pricesArr[0] ){
                        i += 1
                    }
                    if(i < pricesArr.count){
                        subtotalAmount = pricesArr[i]
                    }else{
                    subtotalAmount = pricesArr[1]
                    }
                }
                
            } else if (pricesArr.count == 1) {
                subtotalAmount = totalAmount
            }
            
            fivePercent = 0.0
            tenPercent  =  (subtotalAmount! * 0.10)
            fifteenPercent =  (subtotalAmount! * 0.15)
            twentyPercent =  (subtotalAmount! * 0.20)
            twentyFivePercent  =  (subtotalAmount! * 0.25)
            thirtyPercent  =  (subtotalAmount! * 0.30)
            fivePercentTotal =  (totalAmount! * 0.05)
            tenPercentTotal  =  (totalAmount! * 0.10)
            fifteenPercentTotal =  (totalAmount! * 0.15)
            twentyPercentTotal =  (totalAmount! * 0.20)
            twentyFivePercentTotal  = (totalAmount! * 0.25)
            thirtyPercentTotal  =  (totalAmount! * 0.30)
        }
    }
}


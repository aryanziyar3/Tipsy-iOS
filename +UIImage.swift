//
//  +UIImage.swift
//  Tab Calculator
//
//  Created by Aryan on 7/12/19.
//  Copyright © 2019 Aryan. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    func fixOrientation() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let normalizedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return normalizedImage;
    }
}


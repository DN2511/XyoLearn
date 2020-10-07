//
//  ImageSizeExtension.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 21/9/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//

import Foundation
import UIKit
import ImageIO

extension UIImageView {
    
    func gifSize(){
        
        
        let imageView = UIImageView()
        imageView.frame.origin = CGPoint(x: 8, y: frame.height + frame.origin.y + 8)
        imageView.frame.size = CGSize(width: frame.width - 16 , height: frame.height - 16)
        imageView.image = image
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        addSubview(imageView)
        
    }
}

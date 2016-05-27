//
//  ViewController.swift
//  RMFunctionalSwift
//
//  Created by R_flava_Man on 16/5/25.
//  Copyright © 2016年 R_style_Man. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //battle ship
        let isInRange = shift(circle(5), offset: Position(x: 5, y: 5))(Position(x: 0, y: 0))
        print(isInRange)
        
        //core image
        let url = NSURL(string: "http://www.objc.io/images/covers/16.jpg")
        let image = CIImage(contentsOfURL: url!)!
        
        let blurRadius = 5.0
        let overlayColor = UIColor.redColor().colorWithAlphaComponent(0.2)
        let blurredImage = blur(blurRadius)(image)
        let overlaidImage = colorOverlay(overlayColor)(blurredImage)
        
        let imageView = UIImageView(image: UIImage(CIImage: overlaidImage))
        imageView.frame = self.view.bounds
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


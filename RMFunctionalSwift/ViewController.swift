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
//        let url = NSURL(string: "http://www.objc.io/images/covers/16.jpg")
//        let image = CIImage(contentsOfURL: url!)!
//        
//        let blurRadius = 5.0
//        let overlayColor = UIColor.redColor().colorWithAlphaComponent(0.2)
//        let blurredImage = blur(blurRadius)(image)
//        let overlaidImage = colorOverlay(overlayColor)(blurredImage)
//        
//        let imageView = UIImageView(image: UIImage(CIImage: overlaidImage))
//        imageView.frame = self.view.bounds
//        imageView.contentMode = UIViewContentMode.ScaleAspectFit
//        
//        self.view.addSubview(imageView)
        
        /**
         实际运用 Map、Filter & Reduce
         */
        let paris = City(name: "Paris", population: 2241)
        let madrid = City(name: "Madrid", population: 3165)
        let amsterdam = City(name: "Amsterdam", population: 827)
        let berlin = City(name: "Berlin", population: 3562)
        
        let cities = [paris, madrid, amsterdam, berlin]
        
        let cityString = cities.filter{$0.population > 1000}.map{$0.cityByScalingPopulation()}.reduce("City: Population"){result, c in return result + "\n" + "\(c.name):\(c.population)"}
        print(cityString)
        
        /**
         可选值
         */
        let cityArray = ["Paris": 2241, "Madrid": 3165, "Amsterdam": 827, "Berlin":3562]
        if let madridPopulation = cityArray["Madrid"] {
            print("The population of Madrid is \(madridPopulation * 1000)")
        } else {
            print("Unknown city:Madrid")
        }
        
        // if let 可选绑定机制
        let order = Order(orderNumber: 1234567, person: nil)
        if let myState = order.person?.address?.state {
            print("This order will be shipped to \(myState)")
        } else {
            print("Unkoown person, address, or state")
        }
        
        //switch 可选匹配
        let madridPopulation :Int? = cityArray["Madridx"]
        switch madridPopulation {
        case 0?:
            print("Nobody in Madrid")
        case(1..<1000)?:
            print("Less than a millon in Madrid")
        case .Some(let x):
            print("\(x) people in Madrid")
        case .None:
            print("We don't know about Madrid")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


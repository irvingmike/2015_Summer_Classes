//
//  Shape.swift
//  ShapesOnAPhone2
//
//  Created by Eric Knapp on 11/8/14.
//  Copyright (c) 2014 Eric Knapp. All rights reserved.
//

import UIKit

public class Shape {

    var originPoint: CGPoint
    var color: UIColor = UIColor.blackColor()

    init() {
        originPoint = CGPointZero
        color = randomColor()
    }

    func draw(context context: CGContext) {
        
    }

    func randomizeColor() {
        color = randomColor()
    }

    func randomColor() -> UIColor {
        let redValue = (CGFloat(arc4random_uniform(1001))) / 1000.0
        let greenValue = (CGFloat(arc4random_uniform(1001))) / 1000.0
        let blueValue = (CGFloat(arc4random_uniform(1001))) / 1000.0
        let alphaValue = (CGFloat(arc4random_uniform(510))) / 1000.0 + 0.5

        let newColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)

        return newColor
    }


}
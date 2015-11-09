//
//  Rectangle.swift
//  ShapesOnAPhone2
//
//  Created by Eric Knapp on 11/8/14.
//  Copyright (c) 2014 Eric Knapp. All rights reserved.
//

import UIKit

class Rectangle: Shape {

    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    private var rectangle: CGRect = CGRectZero

    init(origin: CGPoint, width: CGFloat, height: CGFloat) {
        super.init()
        
        originPoint = origin
        self.width = width
        self.height = height

        rectangle = CGRectMake(originPoint.x, originPoint.y, self.width, self.height)

    }

    override func draw(context context: CGContext) {

        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextAddRect(context, rectangle)
        CGContextFillPath(context)

    }

}
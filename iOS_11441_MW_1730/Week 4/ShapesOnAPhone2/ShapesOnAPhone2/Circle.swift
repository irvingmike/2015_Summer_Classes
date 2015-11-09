//
//  Circle.swift
//  ShapesOnAPhone2
//
//  Created by Eric Knapp on 11/8/14.
//  Copyright (c) 2014 Eric Knapp. All rights reserved.
//

import UIKit

class Circle: Shape {

    var radius: CGFloat = 0.0
    var circleRect: CGRect = CGRectZero

    init(center: CGPoint, radius: CGFloat) {
        super.init()
        originPoint = center
        self.radius = radius

        circleRect = CGRectMake(originPoint.x - radius / 2.0, originPoint.y - radius / 2.0, radius * 2.0, radius * 2.0)
    }

    override func draw(context context: CGContext) {

        CGContextSetFillColorWithColor(context, color.CGColor)

        CGContextFillEllipseInRect(context, circleRect)
    }
}
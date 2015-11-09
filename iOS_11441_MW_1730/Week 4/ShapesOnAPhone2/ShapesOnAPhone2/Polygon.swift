//
//  Polygon.swift
//  ShapesOnAPhone2
//
//  Created by Eric Knapp on 11/9/14.
//  Copyright (c) 2014 Eric Knapp. All rights reserved.
//

import UIKit

class Polygon: Shape {

    var points: [CGPoint]

    override init() {
        points = []
    }

    init(newPoints: [CGPoint]) {
        points = newPoints
    }

    func addPoint(point: CGPoint) {
        points.append(point)
    }
    
    override func draw(context context: CGContext) {

        CGContextSetFillColorWithColor(context, color.CGColor)

        if points.count < 3 {
            return
        }

        CGContextBeginPath(context)

        CGContextMoveToPoint(context, points[0].x, points[0].y)

        for index in 1 ..< points.count {
            CGContextAddLineToPoint(context, points[index].x, points[index].y)
        }

        let lastPoint = points.last!
        CGContextAddLineToPoint(context, lastPoint.x, lastPoint.y)


        CGContextFillPath(context)
        
    }

}

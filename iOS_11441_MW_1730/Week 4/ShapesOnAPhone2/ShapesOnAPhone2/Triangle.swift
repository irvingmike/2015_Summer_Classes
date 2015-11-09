//
//  Triangle.swift
//  ShapesOnAPhone2
//
//  Created by Eric Knapp on 11/8/14.
//  Copyright (c) 2014 Eric Knapp. All rights reserved.
//

import UIKit

class Triangle : Polygon {

    init(point1: CGPoint, point2: CGPoint, point3: CGPoint) {
        super.init()

        points.append(point1)
        points.append(point2)
        points.append(point3)
    }
}

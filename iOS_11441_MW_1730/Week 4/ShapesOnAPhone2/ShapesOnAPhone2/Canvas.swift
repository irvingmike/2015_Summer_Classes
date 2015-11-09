//
//  Canvas.swift
//  ShapesOnAPhone2
//
//  Created by Eric Knapp on 11/8/14.
//  Copyright (c) 2014 Eric Knapp. All rights reserved.
//

import UIKit

public class Canvas: UIView {

    var shapes: [Shape] = []

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.borderWidth = 2.0
        layer.borderColor = UIColor.blackColor().CGColor
        backgroundColor = UIColor.whiteColor()

        let singleTapOneFingerRecognizer = UITapGestureRecognizer(target: self, action: "singleTapOneFingerDetected:")
        singleTapOneFingerRecognizer.numberOfTouchesRequired = 1
        singleTapOneFingerRecognizer.numberOfTapsRequired = 1
        self.addGestureRecognizer(singleTapOneFingerRecognizer)

    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func addShape(shape: Shape) {
        shapes.append(shape)
    }


    override public func drawRect(rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()

        for shape in shapes {
            shape.randomizeColor()
            shape.draw(context: context)
        }

    }

    func singleTapOneFingerDetected(sender: UITapGestureRecognizer) {
        let location = sender.locationInView(self)
        print(NSStringFromCGPoint(location))

        setNeedsDisplay()
    }

}

//
//  ViewController.swift
//  ShapesOnAPhone2
//
//  Created by Eric Knapp on 11/8/14.
//  Copyright (c) 2014 Eric Knapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00)

        let width = view.frame.size.width
        let height = view.frame.size.height

        let rect = CGRectMake(10.0, 30.0, width - 20.0, height - 40)

        let canvas = Canvas(frame: rect)
        view.addSubview(canvas)

        let rect1 = Rectangle(origin: CGPointMake(20.0, 50.0), width: 100, height: 300)
        canvas.addShape(rect1)

        let rect2 = Rectangle(origin: CGPointMake(200.0, 150.0), width: 75, height: 200)
        canvas.addShape(rect2)

        let square1 = Square(origin: CGPointMake(25, 400), size: 100)
        canvas.addShape(square1)

        let triangle1 = Triangle(point1: CGPointMake(150.0, 400.0), point2: CGPointMake(40.0, 200.0), point3: CGPointMake(200.0, 200.0))
        canvas.addShape(triangle1)

        let triangle2 = Triangle(point1: CGPointMake(20.0, 550.0), point2: CGPointMake(50.0, 500.0), point3: CGPointMake(230.0, 600.0))
        canvas.addShape(triangle2)

        let triangle3 = Triangle(point1: CGPointMake(250.0, 600.0), point2: CGPointMake(300.0, 500.0), point3: CGPointMake(300.0, 600.0))
        canvas.addShape(triangle3)

        let circle1 = Circle(center: CGPointMake(240.0, 400.0), radius: 50.0)
        canvas.addShape(circle1)

        let circle2 = Circle(center: CGPointMake(200.0, 60.0), radius: 100.0)
        canvas.addShape(circle2)

        let poly1 = Polygon(newPoints: [
                CGPointMake(116, 366),
                CGPointMake(215, 378),
                CGPointMake(221.5, 506),
                CGPointMake(168, 448),
                CGPointMake(102, 529.5),
                CGPointMake(67.5, 414)
            ])
        canvas.addShape(poly1)

        let poly2 = Polygon(newPoints: [
                CGPointMake(175, 509),
                CGPointMake(134.5, 608.5),
                CGPointMake(228, 564),
                CGPointMake(256.5, 504.5)
            ])
        canvas.addShape(poly2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func randomColor() -> UIColor {
        let redValue = (CGFloat(arc4random()) % 100.0) / 100.0
        let greenValue = (CGFloat(arc4random()) % 100.0) / 100.0
        let blueValue = (CGFloat(arc4random()) % 100.0) / 100.0
        let alphaValue = CGFloat(1.0)

        let newColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)

        return newColor
    }

}


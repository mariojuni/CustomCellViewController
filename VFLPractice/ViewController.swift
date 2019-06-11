//
//  ViewController.swift
//  VFLPractice
//
//  Created by Mario Juni on 03/06/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     ///   myView.concaveEnds(depth: 10.0)
        
     
 
       // myView.concave(cornerRadius: 10.0, corners: [.bottomLeft,.bottomRight])
    }
    
    override func viewDidLayoutSubviews() {
        myView.concaveCornerUpper(depth: 10.0)
        myView2.concaveCornerLower(depth: 10.0)
    }
}
extension UIView {

    func concaveCornerLower(depth: CGFloat){
        let path = UIBezierPath()
        //path.move(to: self.bounds.origin)
        path.move(to: CGPoint.init(x: self.bounds.minX , y: self.bounds.minY + depth))
        path.addArc(withCenter: CGPoint.init(x: self.bounds.minX, y: self.bounds.minY), radius: depth, startAngle: CGFloat.pi/2, endAngle: 0, clockwise: false)
        path.addLine(to: CGPoint.init(x: self.bounds.maxX, y: self.bounds.minY))
        path.addArc(withCenter: CGPoint.init(x: self.bounds.maxX, y: self.bounds.minY), radius: depth, startAngle: CGFloat.pi, endAngle: CGFloat.pi/2, clockwise: false)
        path.addLine(to: CGPoint.init(x: self.bounds.maxX, y: self.bounds.maxY))
        //path.addArc(withCenter: CGPoint.init(x: self.bounds.maxX, y: self.bounds.maxY), radius: depth, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: false)
        path.addLine(to: CGPoint.init(x: self.bounds.minX , y: self.bounds.maxY))
        //path.addArc(withCenter: CGPoint.init(x: self.bounds.minX, y: self.bounds.maxY), radius: depth, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: false)
       
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.layer.cornerRadius = depth
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner] /// lower Right , lower left
        self.layer.masksToBounds = false
 
    }
    
    func concaveCornerUpper(depth: CGFloat){
        let path = UIBezierPath()
        
        
        ///path.move(to: self.bounds.origin)
        path.move(to: CGPoint.init(x: self.bounds.minX , y: self.bounds.minY ))
        /// path.addArc(withCenter: CGPoint.init(x: self.bounds.minX, y: self.bounds.minY), radius: depth, startAngle: CGFloat.pi/2, endAngle: 0, clockwise: false)
        path.addLine(to: CGPoint.init(x: self.bounds.maxX, y: self.bounds.minY))
        ///path.addArc(withCenter: CGPoint.init(x: self.bounds.maxX, y: self.bounds.minY), radius: depth, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: false)
        path.addLine(to: CGPoint.init(x: self.bounds.maxX, y: self.bounds.maxY))
        path.addArc(withCenter: CGPoint.init(x: self.bounds.maxX, y: self.bounds.maxY), radius: depth, startAngle: CGFloat.pi/2 * 3, endAngle: CGFloat.pi, clockwise: false)
        path.addLine(to: CGPoint.init(x: self.bounds.minX + depth, y: self.bounds.maxY))
        path.addArc(withCenter: CGPoint.init(x: self.bounds.minX, y: self.bounds.maxY), radius: depth, startAngle: 0, endAngle: CGFloat.pi/2 * 3, clockwise: false)
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.layer.cornerRadius = depth
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner] /// Top Right , Top left
        self.layer.masksToBounds = false
    }
    
    
    func concave(cornerRadius: CGFloat, corners: UIRectCorner)  {
        
        let path = UIBezierPath()
        
        let topLeft = CGPoint(x: self.bounds.minX, y: self.bounds.minY)
        if corners == UIRectCorner.topLeft {
            path.move(to: CGPoint(x: topLeft.x, y: topLeft.y + cornerRadius))
            path.addArc(withCenter: topLeft, radius: cornerRadius, startAngle: CGFloat.pi/2, endAngle: 0, clockwise: false)
        }
        else {
            path.move(to: topLeft)
        }
        
        let topRight = CGPoint(x: self.bounds.maxX, y: self.bounds.minY)
        if corners == UIRectCorner.topRight {
            path.addLine(to: CGPoint(x: topRight.x - cornerRadius, y: topRight.y))
            path.addArc(withCenter: topRight, radius: cornerRadius, startAngle: CGFloat.pi, endAngle: CGFloat.pi/2, clockwise: false)
        }
        else {
            path.addLine(to: topRight)
        }
   
        let bottomRight = CGPoint(x: self.bounds.maxX, y: self.bounds.maxY)
        if corners == UIRectCorner.bottomRight {
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - cornerRadius))
            path.addArc(withCenter: bottomRight, radius: cornerRadius, startAngle: CGFloat.pi/2 * 3, endAngle: CGFloat.pi, clockwise: false)
        }
        else {
            path.addLine(to: bottomRight)
        }
        
        let bottomLeft = CGPoint(x: self.bounds.minX, y: self.bounds.maxY)
        if corners == UIRectCorner.bottomRight {
            path.addLine(to: CGPoint(x: bottomLeft.x + cornerRadius, y: bottomLeft.y ))
            path.addArc(withCenter: bottomLeft, radius: cornerRadius, startAngle: 0, endAngle: CGFloat.pi/2 * 3, clockwise: false)
        }
        else {
            path.addLine(to: bottomLeft)
        }
        path.close()
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.layer.masksToBounds = false
    }
}

// http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
extension UIColor {
    public convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension CGColor {
    public class func colorWithHex(hex: Int) -> CGColor {
        return UIColor(hex: hex).cgColor
    }
}

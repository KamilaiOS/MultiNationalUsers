//
//  Gradient+Ext.swift
//  AKMixStuffs
//
//  Created by Akib Quraishi on 17/01/2018.
//  Copyright © 2018 uk.co.AkibiOS. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        //gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.1)
        //gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradientLayer.startPoint = GradientPoint.topLeftBottomRight.getDirection().startPoint
        gradientLayer.endPoint = GradientPoint.topLeftBottomRight.getDirection().endPoint
        
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func getGradientCALayer(colorOne: UIColor, colorTwo: UIColor, frame:CGRect) -> CALayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = GradientPoint.topLeftBottomRight.getDirection().startPoint
      gradientLayer.endPoint = GradientPoint.topLeftBottomRight.getDirection().endPoint
        
        return gradientLayer
    }
    
    
    fileprivate enum GradientPoint {
        case leftRight
        case rightLeft
        case topBottom
        case bottomTop
        case topLeftBottomRight
        case bottomRightTopLeft
        case topRightBottomLeft
        case bottomLeftTopRight
        
        func getDirection() -> (startPoint:CGPoint,endPoint:CGPoint) {
            switch self {
            case .leftRight:
                return (startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
            case .rightLeft:
                return (startPoint: CGPoint(x: 1, y: 0.5), endPoint: CGPoint(x: 0, y: 0.5))
            case .topBottom:
                return (startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            case .bottomTop:
                return (startPoint: CGPoint(x: 0.5, y: 1), endPoint: CGPoint(x: 0.5, y: 0))
            case .topLeftBottomRight:
                return (startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
            case .bottomRightTopLeft:
                return (startPoint: CGPoint(x: 1, y: 1), endPoint: CGPoint(x: 0, y: 0))
            case .topRightBottomLeft:
                return (startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 1))
            case .bottomLeftTopRight:
                return (startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
            }
        }
    }
    
}


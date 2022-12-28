//
//  SwipeDirection.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import Foundation
import CoreGraphics

enum SwipeDirection {
    case left
    case right
    case up
    case down
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight

    static var allDirections: [SwipeDirection] {
        return [.left, .right, .up, .down, .topLeft, .topRight, .bottomLeft, .bottomRight]
    }

    var horizontalPosition: HorizontalPosition {
        switch self {
        case .left:
            return .left
        case .right:
            return .right
        case .up:
            return .middle
        case .down:
            return .middle
        case .topLeft:
            return .left
        case .topRight:
            return .right
        case .bottomLeft:
            return .left
        case .bottomRight:
            return .right
        }
    }

    var verticalPosition: VerticalPosition {
        switch self {
        case .left:
            return .middle
        case .right:
            return .middle
        case .up:
            return .top
        case .down:
            return .bottom
        case .topLeft:
            return .top
        case .topRight:
            return .top
        case .bottomLeft:
            return .bottom
        case .bottomRight:
            return .bottom
        }
    }

    var point: CGPoint {
        return CGPoint(x: horizontalPosition.rawValue, y: verticalPosition.rawValue)
    }

    enum HorizontalPosition: CGFloat {
        case left = -1
        case middle = 0
        case right = 1
    }

    enum VerticalPosition: CGFloat {
        case top = -1
        case middle = 0
        case bottom = 1
    }

    static var boundsRect: CGRect {
        let w = HorizontalPosition.right.rawValue - HorizontalPosition.left.rawValue
        let h = VerticalPosition.bottom.rawValue - VerticalPosition.top.rawValue
        return CGRect(x: HorizontalPosition.left.rawValue, y: VerticalPosition.top.rawValue, width: w, height: h)
    }

}

extension CGPoint {

    func distanceTo(_ point: CGPoint) -> CGFloat {
        return sqrt(pow(point.x - self.x, 2) + pow(point.y - self.y, 2))
    }

    func normalizedDistanceForSize(_ size: CGSize) -> CGPoint {
        // multiplies by 2 because coordinate system is (-1,1)
        let x = 2 * (self.x / size.width)
        let y = 2 * (self.y / size.height)
        return CGPoint(x: x, y: y)
    }

    func scalarProjectionPointWith(_ point: CGPoint) -> CGPoint {
        let r = scalarProjectionWith(point) / point.modulo
        return CGPoint(x: point.x * r, y: point.y * r)
    }

    func scalarProjectionWith(_ point: CGPoint) -> CGFloat {
        return dotProductWith(point) / point.modulo
    }

    func dotProductWith(_ point: CGPoint) -> CGFloat {
        return (self.x * point.x) + (self.y * point.y)
    }

    var modulo: CGFloat {
        return sqrt(self.x*self.x + self.y*self.y)
    }

    static func intersectionBetweenLines(_ line1: CGLine, line2: CGLine) -> CGPoint? {
        let (p1,p2) = line1
        let (p3,p4) = line2

        var d = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y)
        var ua = (p4.x - p3.x) * (p1.y - p4.y) - (p4.y - p3.y) * (p1.x - p3.x)
        var ub = (p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)
        if (d < 0) {
            ua = -ua; ub = -ub; d = -d
        }

        if d != 0 {
            return CGPoint(x: p1.x + ua / d * (p2.x - p1.x), y: p1.y + ua / d * (p2.y - p1.y))
        }
        return nil
    }

    func screenPointForSize(_ screenSize: CGSize) -> CGPoint {
        let x = 0.5 * (1 + self.x) * screenSize.width
        let y = 0.5 * (1 + self.y) * screenSize.height
        return CGPoint(x: x, y: y)
    }

}

typealias CGLine = (start: CGPoint, end: CGPoint)

extension CGRect {

    var topLine: CGLine {
        return (SwipeDirection.topLeft.point, SwipeDirection.topRight.point)
    }
    var leftLine: CGLine {
        return (SwipeDirection.topLeft.point, SwipeDirection.bottomLeft.point)
    }
    var bottomLine: CGLine {
        return (SwipeDirection.bottomLeft.point, SwipeDirection.bottomRight.point)
    }
    var rightLine: CGLine {
        return (SwipeDirection.topRight.point, SwipeDirection.bottomRight.point)
    }

    var perimeterLines: [CGLine] {
        return [topLine, leftLine, bottomLine, rightLine]
    }

}


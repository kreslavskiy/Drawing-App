//
//  Shapes.swift
//  Lab_OOP_5
//
//  Created by Михаил Креславский on 21.10.2022.
//

import Foundation
import SwiftUI
import Combine

class ObservableArray<T>: ObservableObject {
    @Published var array:[T] = []
    
    init(array: [T]) {
        self.array = array
    }
}

class Shape: ObservableObject, Identifiable {
  var lineWidth: CGFloat = 5
  var color: Color
  var points: [CGPoint]
  var width: CGFloat
  var height: CGFloat
  let id = UUID()
  
  init(points: [CGPoint], width: CGFloat, height: CGFloat, color: Color = .blue) {
    self.points = points
    self.height = height
    self.width = width
    self.color = color
  }
    
  func show(figure: Shape, context: GraphicsContext) {}
}

class CurvedLine: Shape {
  init(points: [CGPoint]) {
    super.init(points: points, width: 0, height: 0)
  }
    
  override func show(figure: Shape, context: GraphicsContext) {
    var path = Path()
    path.addLines(figure.points)
    context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
  }
}

class StraightLine: Shape {
  init(points: [CGPoint]) {
    super.init(points: points, width: 0, height: 0)
  }
    
  override func show(figure: Shape, context: GraphicsContext) {
    var path = Path()
    path.addLines(figure.points)
    context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
  }
}

class Point: Shape {
  init(points: [CGPoint]) {
    super.init(points: points,  width: 5, height: 5, color: .black)
  }
    
  override func show(figure: Shape, context: GraphicsContext) {
    var path = Path()
    path.addEllipse(in: CGRect(origin: figure.points[0], size: CGSize(width: 3, height: 3)))
    context.fill(path, with: .color(.black))
    context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
  }
}

class Ellipse: Shape {
  init(points: [CGPoint], width: CGFloat, height: CGFloat) {
    super.init(points: points, width: width, height: height)
  }
  
  override func show(figure: Shape, context: GraphicsContext) {
    var path = Path()
    path.addEllipse(in: CGRect(origin: figure.points[0], size: CGSize(width: figure.width, height: figure.height)))
    context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
  }
}

class Rectangle: Shape {
  var backgroundColor: Color = .clear
  
  init(points: [CGPoint], width: CGFloat, height: CGFloat) {
    super.init(points: points, width: width, height: height)
  }
  
  override func show(figure: Shape, context: GraphicsContext) {
    var path = Path()
    
    let centreX = figure.points[0].x - figure.width / 2
    let centreY = figure.points[0].y - figure.height / 2
    let centeredWidth = figure.width * 1.5
    let centeredHeight = figure.height * 1.5
    
    path.addRect(CGRect(origin: CGPoint(x: centreX, y: centreY), size: CGSize(width: centeredWidth, height: centeredHeight)))
    context.fill(path, with: .color(self.backgroundColor))
    context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
  }
}

class LineOO: Shape {
  let circleSize: CGFloat = 30

  init(points: [CGPoint]) {
    super.init(points: points, width: 0, height: 0)
  }
    
  override func show(figure: Shape, context: GraphicsContext) {
    var path = Path()
    
    let firstPoint = figure.points[0]
    let firstCircleX = firstPoint.x - circleSize / 2
    let firstCircleY = firstPoint.y - circleSize / 2
    
    var secondPoint = firstPoint
    if figure.points.count != 1 { secondPoint = figure.points[1] }
    let secondCircleX = secondPoint.x - circleSize / 2
    let secondCircleY = secondPoint.y - circleSize / 2
    
    path.addLines(figure.points)
    path.addEllipse(in: CGRect(origin: CGPoint(x: firstCircleX, y: firstCircleY), size: CGSize(width: circleSize, height: circleSize)))
    path.addEllipse(in: CGRect(origin: CGPoint(x: secondCircleX, y: secondCircleY), size: CGSize(width: circleSize, height: circleSize)))
    context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
    context.fill(path, with: .color(figure.color))
  }
}

class Cube: Shape {
  init(points: [CGPoint], width: CGFloat, height: CGFloat) {
    super.init(points: points, width: width, height: height)
  }
  
  override func show(figure: Shape, context: GraphicsContext) {
    var path = Path()
    
    let firstFrontPoint = points[0]
    let firstFrontX = firstFrontPoint.x
    let firstFrontY = firstFrontPoint.y

    let secondFrontPoint = CGPoint(x: firstFrontX + figure.width, y: firstFrontY + figure.width)
    let secondFrontX = secondFrontPoint.x
    let secondFrontY = secondFrontPoint.y
    
    let firstBackPoint = CGPoint(x: firstFrontX + figure.width / 2, y: firstFrontY - figure.width / 2)
    let firstBackX = firstBackPoint.x
    let firstBackY = firstBackPoint.y
    
    let secondBackPoint = CGPoint(x: secondFrontX + figure.width / 2, y: secondFrontY - figure.width / 2)
    
    path.addRect(CGRect(origin: firstFrontPoint, size: CGSize(width: figure.width, height: figure.width)))
    path.addRect(CGRect(origin: firstBackPoint, size: CGSize(width: figure.width, height: figure.width)))
    
    path.addLines([firstFrontPoint, firstBackPoint])
    path.addLines([CGPoint(x: firstFrontX, y: firstFrontY + figure.width), CGPoint(x: firstBackX, y: firstBackY + figure.width)])
    path.addLines([secondFrontPoint, secondBackPoint])
    path.addLines([CGPoint(x: firstFrontX + figure.width, y: firstFrontY), CGPoint(x: firstBackX + figure.width, y: firstBackY)])
    
    context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
  }
}

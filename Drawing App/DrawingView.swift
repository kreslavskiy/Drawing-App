//
//  ContentView.swift
//  Lab_OOP_5
//
//  Created by Михаил Креславский on 21.10.2022.
//

import SwiftUI
import Foundation

struct DrawingView: View {
  @ObservedObject var figures: ObservableArray<Shape> = ObservableArray(array: [])
  @State private var label = "Оберіть форму"
  @State private var flag = ""
  
  @State private var showingAlert: [Bool] = [ false, false, false, false, false, false, false ]
  @State private var colors: [Color] = [ .gray, .gray, .gray, .gray, .gray, .gray, .gray ]
  @State private var moveToTable: Bool = false
  
  var body: some View {
    VStack {
      
      Text(label).foregroundColor(.blue).font(Font.headline.weight(.semibold))
      
      HStack {
        
        Button (action: {}) {
          Image(systemName: "dot.square").font(.system(size: 30))
            .onTapGesture {
              label = "Крапка"
              flag = "point"
              print(label)
              colors = [.blue, .gray, .gray, .gray, .gray, .gray, .gray]
            }
            .onLongPressGesture(minimumDuration: 0.5) {
              self.showingAlert[0] = true
            }
        }.alert("Крапка", isPresented: $showingAlert[0]) {
          Button("OK", role: .cancel) {
            self.showingAlert[0] = false
          }
        }.foregroundColor(colors[0])
        
        Button (action: {}) {
          Image(systemName: "scribble").font(.system(size: 30))
            .onTapGesture {
              label = "Крива лінія"
              flag = "line"
              print(label)
              colors = [.gray, .blue, .gray, .gray, .gray, .gray, .gray]
            }
            .onLongPressGesture(minimumDuration: 0.5) {
              self.showingAlert[1] = true
            }
        }.alert("Крива лінія", isPresented: $showingAlert[1]) {
          Button("OK", role: .cancel) {
            self.showingAlert[1] = false
          }
        }.foregroundColor(colors[1])
        
        Button (action: {}) {
          Image(systemName: "line.diagonal").font(.system(size: 30))
            .onTapGesture {
              label = "Пряма лінія"
              flag = "straight line"
              print(label)
              colors = [.gray, .gray, .blue, .gray, .gray, .gray, .gray]
            }
            .onLongPressGesture(minimumDuration: 0.5) {
              self.showingAlert[2] = true
            }
        }.alert("Пряма лінія", isPresented: $showingAlert[2]) {
          Button("OK", role: .cancel) {
            self.showingAlert[2] = false
          }
        }.foregroundColor(colors[2])
        
        Button (action: {}) {
          Image(systemName: "oval").font(.system(size: 30))
            .onTapGesture {
              label = "Еліпс"
              flag = "ellipse"
              print(label)
              colors = [.gray, .gray, .gray, .blue, .gray, .gray, .gray]
            }
            .onLongPressGesture(minimumDuration: 0.5) {
              self.showingAlert[3] = true
            }
        }.alert("Еліпс", isPresented: $showingAlert[3]) {
          Button("OK", role: .cancel) {
            self.showingAlert[3] = false
          }
        }.foregroundColor(colors[3])
        
        Button (action: {}) {
          Image(systemName: "rectangle").font(.system(size: 30))
            .onTapGesture {
              label = "Прямокутник"
              flag = "rectangle"
              print(label)
              colors = [.gray, .gray, .gray, .gray, .blue, .gray, .gray]
            }
            .onLongPressGesture(minimumDuration: 0.5) {
              self.showingAlert[4] = true
            }
        }.alert("Прямокутник", isPresented: $showingAlert[4]) {
          Button("OK", role: .cancel) {
            self.showingAlert[4] = false
          }
        }.foregroundColor(colors[4])
        
        Button (action: {}) {
          Image(systemName: "link").font(.system(size: 30))
            .onTapGesture {
              label = "Гантеля"
              flag = "lineOO"
              print(label)
              colors = [.gray, .gray, .gray, .gray, .gray, .blue, .gray]
            }
            .onLongPressGesture(minimumDuration: 0.5) {
              self.showingAlert[5] = true
            }
        }.alert("Лінія з кружечками на кінцях", isPresented: $showingAlert[5]) {
          Button("OK", role: .cancel) {
            self.showingAlert[5] = false
          }
        }.foregroundColor(colors[5])
        
        Button (action: {}) {
          Image(systemName: "cube").font(.system(size: 30))
            .onTapGesture {
              label = "Куб"
              flag = "cube"
              print(label)
              colors = [.gray, .gray, .gray, .gray, .gray, .gray, .blue]
            }
            .onLongPressGesture(minimumDuration: 0.5) {
              self.showingAlert[6] = true
            }
        }.alert("Каркас кубу", isPresented: $showingAlert[6]) {
          Button("OK", role: .cancel) {
            self.showingAlert[6] = false
          }
        }.foregroundColor(colors[6])
        
        Menu {
          Button("Крапка") {
            label = "Крапка"
            flag = "point"
            print(label)
            colors = [.blue, .gray, .gray, .gray, .gray, .gray, .gray]
            }
          Button("Крива лінія") {
            label = "Крива лінія"
            flag = "line"
            print(label)
            colors = [.gray, .blue, .gray, .gray, .gray, .gray, .gray]
          }
          Button("Пряма лінія") {
            label = "Пряма лінія"
            flag = "straight line"
            print(label)
            colors = [.gray, .gray, .blue, .gray, .gray, .gray, .gray]
          }
          Button("Еліпс") {
            label = "Еліпс"
            flag = "ellipse"
            print(label)
            colors = [.gray, .gray, .gray, .blue, .gray, .gray, .gray]
          }
          Button("Прямокутник") {
            label = "Прямокутник"
            flag = "rectangle"
            print(label)
            colors = [.gray, .gray, .gray, .gray, .blue, .gray, .gray]
          }
          Button("Гантеля") {
            label = "Гантеля"
            flag = "lineOO"
            print(label)
            colors = [.gray, .gray, .gray, .gray, .gray, .blue, .gray]
          }
          Button("Куб") {
            label = "Куб"
            flag = "cube"
            print(label)
            colors = [.gray, .gray, .gray, .gray, .gray, .gray, .blue]
          }
        } label: {
          Image(systemName: "ellipsis").font(.system(size: 30))
        }.foregroundColor(.gray)

      }
    }
    .padding()
    .frame(minHeight: 40)
    
    Divider()
    
    Canvas { context, size in
      for figure in figures.array {
        figure.show(figure: figure, context: context)
      }
    }
    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
      if flag == "line" {
        
        let newPoint = value.location
        if value.translation.width + value.translation.height == 0 {
          figures.array.append(contentsOf: [CurvedLine(points: [newPoint])])
        } else {
          let index = figures.array.count - 1
          figures.objectWillChange.send()
          figures.array[index].points.append(newPoint)
        }
        
      } else if flag == "lineOO" {
        
        let lastPoint = value.location
        if value.translation.width + value.translation.height == 0 {
          let firstPoint = value.location
          figures.array.append(LineOO(points: [firstPoint]))
        } else {
          let index = figures.array.count - 1
          if figures.array[index].points.count == 2 {
            figures.objectWillChange.send()
            figures.array[index].points[1] = lastPoint
          } else {
            figures.array[index].points.append(lastPoint)
          }
        }
        
      } else if flag == "straight line" {
        
        let lastPoint = value.location
        if value.translation.width + value.translation.height == 0 {
          let firstPoint = value.location
          figures.array.append(StraightLine(points: [firstPoint]))
        } else {
          let index = figures.array.count - 1
          if figures.array[index].points.count == 2 {
            figures.objectWillChange.send()
            figures.array[index].points[1] = lastPoint
          } else {
            figures.array[index].points.append(lastPoint)
          }
        }
        
      } else if flag == "ellipse" {
        
        if value.translation.width + value.translation.height == 0  {
          let firstPoint = value.startLocation
          figures.array.append(Ellipse(points: [firstPoint], width: 0, height: 0))
        } else {
          let index = figures.array.count - 1
          figures.objectWillChange.send()
          figures.array[index].width = value.translation.width
          figures.array[index].height = value.translation.height
        }
        
      } else if flag == "rectangle" {
        
        if value.translation.width + value.translation.height == 0 {
          let firstPoint = value.startLocation
          figures.array.append(Rectangle(points: [firstPoint], width: 0, height: 0))
        } else {
          let index = figures.array.count - 1
          figures.objectWillChange.send()
          figures.array[index].width = value.translation.width
          figures.array[index].height = value.translation.height
        }
        
      } else if flag == "cube" {
        
        if value.translation.width + value.translation.height == 0 {
          let firstPoint = value.startLocation
          figures.array.append(Cube(points: [firstPoint], width: 0, height: 0))
        } else {
          let index = figures.array.count - 1
          figures.objectWillChange.send()
          figures.array[index].width = value.translation.width
          figures.array[index].height = value.translation.height
        }
        
      }
      })
      .onEnded({ value in
        if flag == "point" {
          let firstPoint = CGPoint(x: value.translation.width + value.startLocation.x, y: value.translation.height + value.startLocation.y)
          figures.array.append(Point(points: [firstPoint]))
        }
        
        if figures.array.count != 0 {
          let index = figures.array.count - 1
          figures.objectWillChange.send()
          figures.array[index].color = .black
          
          if figures.array[index] is Rectangle {
            (figures.array[index] as! Rectangle).backgroundColor = .white
          }
        }
      }))
    
    Divider()
    
    HStack {
      Button("Очистити", action: {
        label = "Оберіть форму"
        flag = ""
        figures.array = []
        colors = [.gray, .gray, .gray, .gray, .gray, .gray, .gray]
      }).foregroundColor(.red)
      
      Spacer()
      
      Button(action: {
        moveToTable = true
      }){
        Image(systemName: "tablecells.badge.ellipsis").font(.system(size: 30))
      }.fullScreenCover(isPresented: self.$moveToTable) {
        TableView(figures: figures)
      }
      
    }
    .padding()
  }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}


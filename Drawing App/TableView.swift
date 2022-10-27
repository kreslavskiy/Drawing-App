//
//  TableView.swift
//  Lab_OOP_5
//
//  Created by Михаил Креславский on 21.10.2022.
//

import SwiftUI

struct TableView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject var figures: ObservableArray<Shape>
  
  var body: some View {
    HStack {
      Text("Таблиця")
        .foregroundColor(.blue)
        .font(.system(size: 30, weight: .semibold))
      
      Spacer()
      
      Button (action: {
        dismiss()
      }) {
        Text("Готово").foregroundColor(.red).font(Font.headline.weight(.medium))
      }
    }.padding()
    
    if self.figures.array.isEmpty {
      VStack {
        Spacer()
        Text("Фігур немає")
        Spacer()
      }
    } else {
      List {
        ForEach(self.figures.array, id: \.id) { shape in
          if shape is Point {
            VStack (alignment: .leading) {
              Text("Крапка").font(Font.headline.weight(.semibold))
              Text("(\(String(format: "%.1f", shape.points[0].x)), \(String(format: "%.1f", shape.points[0].y)))")
            }
          } else if shape is CurvedLine {
            VStack (alignment: .leading) {
              Text("Крива лінія").font(Font.headline.weight(.semibold))
              Text("(\(String(format: "%.1f", shape.points[0].x)), \(String(format: "%.1f", shape.points[0].y))) → (\(String(format: "%.1f", shape.points[shape.points.count - 1].x)), \(String(format: "%.1f", shape.points[shape.points.count - 1].y)))")
            }
          } else if shape is StraightLine {
            VStack (alignment: .leading) {
                Text("Пряма лінія").font(Font.headline.weight(.semibold))
                Text("(\(String(format: "%.1f", shape.points[0].x)), \(String(format: "%.1f", shape.points[0].y))) → (\(String(format: "%.1f", shape.points[shape.points.count - 1].x)), \(String(format: "%.1f", shape.points[shape.points.count - 1].y)))")
            }
          } else if shape is Ellipse {
            VStack(alignment: .leading) {
              Text("Еліпс").font(Font.headline.weight(.semibold))
              Text("(\(String(format: "%.1f", shape.points[0].x)), \(String(format: "%.1f", shape.points[0].y))) → (\(String(format: "%.1f", shape.points[0].x + shape.width)), \(String(format: "%.1f", shape.points[0].y + shape.height)))")
            }
          } else if shape is Rectangle {
            VStack(alignment: .leading) {
              Text("Прямокутник").font(Font.headline.weight(.semibold))
              Text("(\(String(format: "%.1f", shape.points[0].x)), \(String(format: "%.1f", shape.points[0].y))) → (\(String(format: "%.1f", shape.points[0].x + shape.width)), \(String(format: "%.1f", shape.points[0].y + shape.height)))")
            }
          } else if shape is LineOO {
            VStack (alignment: .leading) {
                Text("Гантеля").font(Font.headline.weight(.semibold))
                Text("(\(String(format: "%.1f", shape.points[0].x)), \(String(format: "%.1f", shape.points[0].y))) → (\(String(format: "%.1f", shape.points[shape.points.count - 1].x)), \(String(format: "%.1f", shape.points[shape.points.count - 1].y)))")
            }
          } else if shape is Cube {
            VStack (alignment: .leading) {
              Text("Куб").font(Font.headline.weight(.semibold))
              Text("(\(String(format: "%.1f", shape.points[0].x)), \(String(format: "%.1f", shape.points[0].y))) → (\(String(format: "%.1f", shape.points[0].x + shape.width * 1,5)), \(String(format: "%.1f", shape.points[0].y + shape.width / 2)))")
            }
          }
        }
        .onDelete(perform: delete)
      }
      .background(Color.blue)
      .padding()
    }
  }
  
  func delete(at offsets: IndexSet) {
    self.figures.array.remove(atOffsets: offsets)
  }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
      TableView(figures: ObservableArray(array: []))
    }
}

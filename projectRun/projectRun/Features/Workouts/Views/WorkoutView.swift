//
//  WorkoutsView.swift
//  projectRun
//
//  Created by Misael Cuevas Vásquez on 5/11/21.
//

import SwiftUI

// MARK: - WorkoutView
struct WorkoutView: View {
  @State private var showingSheet = false

  var body: some View {
    NavigationView {
      VStack {
        IntervalItemView()
      }
      .navigationBarTitle(Text("Workout"))
      .toolbar {
        ToolbarItem {
          Button {
            showingSheet.toggle()
          } label: {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
      .sheet(isPresented: $showingSheet) {
        AddIntervalView()
      }
    }
  }
}

struct WorkoutsView_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutView()
  }
}

// MARK: - AddIntervalView
struct AddIntervalView: View {
  @Environment(\.dismiss) var dismiss

  @State private var distance: String = ""
  @State private var measure: Int = 0
  @State private var quantity: Int = 0
  @State private var rest: Int = 0
  @State private var pace: Int = 0

  var body: some View {
    ZStack(alignment: .topTrailing) {
      VStack {
        Spacer()
        Form {
          Section(header: Text("Basic info")) {
            HStack {
              TextField("Distance", text: $distance)
                .keyboardType(UIKit.UIKeyboardType.decimalPad)
              Spacer()
              Picker("Measure", selection: $measure) {
                Text("m").tag(0)
                Text("Km").tag(1)
              }
              .pickerStyle(MenuPickerStyle())
            }

            Stepper(value: $rest, in: 1...99) {
              Text("Rest: \(self.rest)s")
            }

            HStack{
              Text("Pace")
              Spacer()
              Picker("Pace", selection: $pace) {
                Text("21K").tag(0)
                Text("10K").tag(1)
                Text("5K").tag(2)
                Text("Comfort").tag(3)
                Text("Celebration").tag(4)
              }
              .pickerStyle(MenuPickerStyle())
            }
          }

          Button {
            dismiss()
          } label: {
            HStack {
              Spacer()
              Text("Add Interval")
              Spacer()
            }
          }
        }
        Spacer()
      }
      .edgesIgnoringSafeArea(.all)

      Button(action: { dismiss() }) {
        Image(systemName: "xmark.circle.fill")
          .foregroundColor(Color.blue)
          .font(.title)
      }.padding(20)
    }
  }
}

// MARK: - IntervalItemView
struct IntervalItemView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Title")
        .font(.system(size: 26, weight: .bold, design: .default))
        .foregroundColor(.white)
        .padding([.leading, .trailing])

      Text("Type")
        .font(.system(size: 16, weight: .bold, design: .default))
        .foregroundColor(.gray)
        .padding([.leading, .trailing])
    }
    .frame(width: 175, height: 175, alignment: .leading)
    .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
    .roundCorners(radius: 20)
    .padding(.all, 10)
  }
}

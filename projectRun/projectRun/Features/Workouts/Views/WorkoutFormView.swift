//
//  SeriesFormView.swift
//  projectRun
//
//  Created by Misael Cuevas Vásquez on 7/11/21.
//

import Combine
import SwiftUI

struct WorkoutFormView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var viewModel: WorkoutListViewModel

  @State private var workoutName: String = ""
  @State private var distance: String = ""
  @State private var measure: DistanceMeasure = .m
  @State private var quantity: Int = 0
  @State private var rest: Int = 0
  @State private var pace: Pace = .twentyone

  @State private var series: [Serie] = []

  var disableForm: Bool {
    workoutName.isEmpty || series.isEmpty
  }

  var disableSeries: Bool {
    distance.isEmpty || rest == 0
  }

  var body: some View {
    VStack {
      Spacer()
      Form {
        Section(header: Text("Workout name")) {
          TextField("Workout name", text: $workoutName)
        }

        Section(header: Text("Series info")) {
          HStack {
            TextField("Distance", text: $distance)
              .keyboardType(UIKit.UIKeyboardType.numberPad)
              .onReceive(Just(distance)) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                  self.distance = filtered
                }
              }
            Spacer()
            Picker("Measure", selection: $measure) {
              ForEach(DistanceMeasure.allCases, id: \.self) { value in
                Text(value.localizedName)
                  .tag(value)
              }
            }
            .pickerStyle(MenuPickerStyle())
          }

          Stepper(value: $rest, in: 0...99, step: 5) {
            Text("Rest: \(self.rest)s")
          }

          HStack{
            Text("Pace")
            Spacer()
            Picker("Pace", selection: $pace) {
              ForEach(Pace.allCases, id: \.self) { value in
                Text(value.localizedName)
                  .tag(value)
              }
            }
            .pickerStyle(MenuPickerStyle())
          }
        }

        Button {
          let serie = Serie(title: "",
                            time: 0,
                            distance: Double(distance) ?? 0,
                            measure: measure,
                            rest: rest,
                            pace: pace)
          series.append(serie)
        } label: {
          HStack {
            Spacer()
            Text("Add Series")
            Spacer()
          }
        }
        .disabled(disableSeries)

        if (series.count > 0) {
          Section(header: Text("Series added")) {
            ForEach(series) { serie in
              Text("\(serie.distance, specifier: "%.2f")\(serie.measure.rawValue) resting \(serie.rest)s at \(serie.pace.rawValue) of pace")
                .font(.body)
                .foregroundColor(.primary)
            }
            .onDelete(perform: delete)
          }
        }
      }
      Spacer()
    }
    .navigationTitle("Add Workout")
    .toolbar {
      ToolbarItem {
        Button {
          let workout = Workout(name: workoutName, series: series)
          viewModel.add(workout)
          presentationMode.wrappedValue.dismiss()
        } label: {
          Label("Add Item", systemImage: "checkmark")
        }
        .disabled(disableForm)
      }
    }
    .ignoresSafeArea(.all)
  }

  func delete(at offsets: IndexSet) {
    series.remove(atOffsets: offsets)
  }
}

struct SeriesFormView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      WorkoutFormView(viewModel: WorkoutListViewModel())
    }
  }
}

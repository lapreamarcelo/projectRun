//
//  WorkoutCardView.swift
//  projectRun
//
//  Created by Misael Cuevas Vásquez on 7/11/21.
//

import SwiftUI

struct WorkoutCardView: View {
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
    .frame(width: 150, height: 150, alignment: .leading)
    .background(Color.green)
//    .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
    .roundCorners(radius: 20)
    .padding(.all, 10)
  }
}

struct WorkoutCardView_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutCardView()
  }
}

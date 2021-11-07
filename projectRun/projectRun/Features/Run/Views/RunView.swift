//
//  RunView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import SwiftUI

struct RunView: View {
  let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
  @State var number: Int = 1

  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        StatsSummaryView()
          .padding()
          .roundCorners(radius: 20)
        Spacer()
        Image("figure-run-\(number)")
          .resizable()
          .scaledToFit()
          .frame(width: 350, height: 350, alignment: .center)
          .onReceive(timer) { _ in
            print(number)
            if number >= 3 {
              number = 0
            }
            number += 1
          }
        Spacer()
      }
      .padding(15)
      .navigationTitle("Hi, Petizo")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {

          } label: {
            Image(systemName: "person.circle")
              .font(.title)
          }
        }
      }
    }
  }
}

struct RunView_Previews: PreviewProvider {
  static var previews: some View {
    RunView()
  }
}

//
//  RunView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 6/11/21.
//

import SwiftUI

struct RunView: View {
  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        StatsSummaryView()
          .padding()
          .roundCorners(radius: 20)

//        Image(systemName: "figure.walk")
//          .font(.system(size: 150))
        TimelineView(.animation(minimumInterval: 0.05)){ _ in
          Canvas { context, size in
            var image = Image("figure-run-1")
            image.scaledToFit()
            context.draw(image, at: CGPoint(x: 0, y: 0))
          }
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

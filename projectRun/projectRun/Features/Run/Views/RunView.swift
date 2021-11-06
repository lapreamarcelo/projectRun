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
      Text("Run info goes here")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {

            } label: {
              Image(systemName: "person.circle")
                .font(.title)
            }
          }
        }
        .navigationTitle("Hi, Petizo")
    }
  }
}

struct RunView_Previews: PreviewProvider {
  static var previews: some View {
    RunView()
  }
}

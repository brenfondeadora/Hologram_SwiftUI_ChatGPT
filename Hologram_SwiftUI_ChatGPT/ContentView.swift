//
//  ContentView.swift
//  Hologram_SwiftUI_ChatGPT
//
//  Created by Brenda Saavedra  on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HologramPatternView()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

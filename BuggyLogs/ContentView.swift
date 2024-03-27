//
//  ContentView.swift
//  BuggyLogs
//
//  Created by Alfie on 27/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var installationFinished = false
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue.opacity(0.1))
                LogView(installationFinished: $installationFinished)
                    .padding()
            }
            .frame(width: 350, height: 450
            )
            .padding()
            Button("Go") {
                DispatchQueue.global().async {
                    for x in 0...50 {
                        Logger.log("Log number \(x)")
                        usleep(UInt32(Int.random(in: 2000...5000)))
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  BoringTime.swift
//  boringNotch
//
//  Created by Bismarck Animas Roque on 25/12/24.
//

import SwiftUI

struct BoringTime: View {
    @State private var currentTime: String = ""
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(currentTime)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .onAppear {
                updateCurrentTime() // Initialize time on appear
            }
            .onReceive(timer) { _ in
                updateCurrentTime() // Update time every second
            }
    }
    
    private func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        currentTime = formatter.string(from: Date())
    }
}

#Preview {
    BoringTime().frame(width: 200, height: 200)
}

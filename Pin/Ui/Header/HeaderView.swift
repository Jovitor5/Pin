//
//  HeaderView.swift
//  Pin
//
//  Created by João Vitor Moreira on 09.07.24.
//

import SwiftUI

struct HeaderView: View {

    @State private var now = Date()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private var dateString: String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "pt_BR")
        f.dateFormat = "EEE, d MMM"
        return f.string(from: now).capitalized
    }

    private var timeString: String {
        let f = DateFormatter()
        f.dateFormat = "HH:mm:ss"
        return f.string(from: now)
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            // ── Logo ─────────────────────────────────────────────────
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 85, height: 85)

                Image("pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.15), radius: 6, y: 3)
            }

            Spacer()

            // ── Data e hora ──────────────────────────────────────────
            VStack(alignment: .trailing, spacing: 3) {
                Text(timeString)
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)

                Text(dateString)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Color.white.opacity(0.70))
            }
            .onReceive(timer) { _ in now = Date() }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.18, green: 0.72, blue: 0.42),
                    Color(red: 0.08, green: 0.48, blue: 0.26)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(
            Rectangle()
                .fill(Color.white.opacity(0.08))
                .frame(height: 1),
            alignment: .bottom
        )
    }
}

#Preview {
    HeaderView()
}

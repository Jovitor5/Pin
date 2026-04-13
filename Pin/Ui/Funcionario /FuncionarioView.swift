//
//  FuncionarioView.swift
//  Pin
//
//  Created by João Vitor Moreira on 09.07.24.
//

import SwiftUI

import SwiftUI

struct FuncionarioView: View {

    @State var user: Usuario?

    var body: some View {
        HStack(spacing: 16) {

            // ── Avatar ───────────────────────────────────────────────
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.15))
                    .frame(width: 58, height: 58)

                Image("foto")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .strokeBorder(Color.white.opacity(0.35), lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.18), radius: 6, y: 3)
            }

            // ── Info ─────────────────────────────────────────────────
            VStack(alignment: .leading, spacing: 4) {
                Text(user?.name ?? "Funcionário")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(1)

                HStack(spacing: 6) {
                    Image(systemName: "bicycle")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.white.opacity(0.65))

                    Text("Tour: \(user?.senha ?? "—")")
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white.opacity(0.75))
                }
            }

            Spacer()

            // ── Badge online ─────────────────────────────────────────
            HStack(spacing: 5) {
                Circle()
                    .fill(Color(red: 0.60, green: 1.0, blue: 0.60))
                    .frame(width: 7, height: 7)
                    .shadow(color: Color.green.opacity(0.8), radius: 4)

                Text("Ativo")
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.white.opacity(0.80))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.white.opacity(0.12))
            .clipShape(Capsule())
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
        .onAppear {
            user = Manager.loadUsuario()
        }
    }
}

#Preview {
    FuncionarioView()
}

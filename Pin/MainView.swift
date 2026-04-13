//
//  MainView.swift
//  Pin
//
//  Created by João Vitor Moreira on 18.07.24.
//

import SwiftUI

struct MainView: View {
    
    @State private var appeared = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // ── Background ──────────────────────────────────────────
                Color(red: 0.96, green: 0.98, blue: 0.96)
                    .ignoresSafeArea()
                
                // Decorative orbs
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.22), .clear],
                            center: .center, startRadius: 0, endRadius: 260
                        )
                    )
                    .frame(width: 400, height: 400)
                    .offset(x: 140, y: -240)
                    .blur(radius: 18)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 0.10, green: 0.55, blue: 0.30).opacity(0.15), .clear],
                            center: .center, startRadius: 0, endRadius: 200
                        )
                    )
                    .frame(width: 300, height: 300)
                    .offset(x: -120, y: 420)
                    .blur(radius: 20)
                
                // ── Content ─────────────────────────────────────────────
                VStack(spacing: 0) {
                    
                    // Header + Funcionario
                    VStack(spacing: 0) {
                        HeaderView()
                        FuncionarioView()
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : -10)
                    .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.05), value: appeared)
                    
                    Spacer().frame(height: 32)
                    
                    // ── Seção de ações ───────────────────────────────────
                    VStack(alignment: .leading, spacing: 12) {
                        Text("O que deseja fazer?")
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.75))
                            .padding(.horizontal, 24)
                            .opacity(appeared ? 1 : 0)
                            .animation(.easeIn.delay(0.15), value: appeared)
                        
                        // Card 1 — Adicionar pedido
                        NavCard(
                            icon: "plus.circle.fill",
                            title: "Adicionar um pedido",
                            subtitle: "Registre um novo problema",
                            delay: 0.20
                        ) {
                            AddProblemasView()
                        }
                        .opacity(appeared ? 1 : 0)
                        .offset(y: appeared ? 0 : 16)
                        .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.20), value: appeared)
                        
                        // Card 2 — Visualizar pedidos
                        NavCard(
                            icon: "list.bullet.clipboard.fill",
                            title: "Visualizar pedidos feitos",
                            subtitle: "Acompanhe os pedidos realizados",
                            delay: 0.28
                        ) {
                            PedidosFeitosView()
                        }
                        .opacity(appeared ? 1 : 0)
                        .offset(y: appeared ? 0 : 16)
                        .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.28), value: appeared)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear { appeared = true }
    }
}

// MARK: - Nav Card

struct NavCard<Destination: View>: View {
    let icon: String
    let title: String
    let subtitle: String
    let delay: Double
    @ViewBuilder let destination: () -> Destination
    
    @State private var isPressed = false
    
    var body: some View {
        NavigationLink(destination: { destination() }) {
            HStack(spacing: 16) {
                
                // Ícone
                ZStack {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.18, green: 0.72, blue: 0.42),
                                    Color(red: 0.08, green: 0.52, blue: 0.28)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                        .shadow(color: Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.40), radius: 8, y: 4)
                    
                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                // Textos
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.08, green: 0.26, blue: 0.14))
                    
                    Text(subtitle)
                        .font(.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(Color(red: 0.08, green: 0.26, blue: 0.14).opacity(0.50))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.50))
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .strokeBorder(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.12), lineWidth: 1)
                    )
                    .shadow(
                        color: Color(red: 0.10, green: 0.45, blue: 0.25).opacity(0.10),
                        radius: 10, x: 0, y: 4
                    )
            )
            .padding(.horizontal, 20)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MainView()
}

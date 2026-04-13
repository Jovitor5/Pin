//
//  LoadPage.swift
//  Pin
//
//  Created by João Vitor Moreira on 23.07.24.
//

import SwiftUI

struct PedidosFeitosView: View {
    
    @State var pedidos: [Pedido] = []
    @State private var appeared = false
    
    var body: some View {
        ZStack {
            // ── Background ──────────────────────────────────────────
            Color(red: 0.96, green: 0.98, blue: 0.96)
                .ignoresSafeArea()
            
            // Decorative orbs
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.25), .clear],
                        center: .center, startRadius: 0, endRadius: 260
                    )
                )
                .frame(width: 420, height: 420)
                .offset(x: 140, y: -260)
                .blur(radius: 16)
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(red: 0.10, green: 0.55, blue: 0.30).opacity(0.18), .clear],
                        center: .center, startRadius: 0, endRadius: 200
                    )
                )
                .frame(width: 320, height: 320)
                .offset(x: -130, y: 380)
                .blur(radius: 20)
            
            VStack(spacing: 0) {
                
                // ── Header ───────────────────────────────────────────
                HStack(spacing: 14) {
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
                            .frame(width: 46, height: 46)
                            .shadow(color: Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.45), radius: 10, y: 5)
                        
                        Image(systemName: "bag.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Meus Pedidos")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(Color(red: 0.10, green: 0.28, blue: 0.16))
                        
                        Text("\(pedidos.count) pedido\(pedidos.count == 1 ? "" : "s") realizados")
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.80))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                .padding(.bottom, 16)
                .opacity(appeared ? 1 : 0)
                .offset(y: appeared ? 0 : -12)
                .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.05), value: appeared)
                
                // ── List ─────────────────────────────────────────────
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        
                        ForEach(pedidos) { pedido in
                            CardPedidosView(pedido: pedido) {
                                if let index = pedidos.firstIndex(where: { $0.id == pedido.id }) {
                                    pedidos.remove(at: index)
                                    Manager.savePedido(pedidos: pedidos)
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                                            .strokeBorder(
                                                Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.12),
                                                lineWidth: 1
                                            )
                                    )
                                    .shadow(
                                        color: Color(red: 0.10, green: 0.45, blue: 0.25).opacity(0.10),
                                        radius: 12, x: 0, y: 5
                                    )
                            )
                            .padding(.horizontal, 20)
                        }
                        
                        if pedidos.isEmpty {
                            EmptyPedidosView()
                                .padding(.top, 60)
                        }
                    }
                }
            }
        }
        .onAppear {
            pedidos = Manager.loadPedidos()
            appeared = true
        }
    }
}

// MARK: - Empty State

struct EmptyPedidosView: View {
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.10))
                    .frame(width: 90, height: 90)
                
                Image(systemName: "bag")
                    .font(.system(size: 36, weight: .light))
                    .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.55))
            }
            
            Text("Nenhum pedido ainda")
                .font(.system(size: 17, weight: .semibold, design: .rounded))
                .foregroundColor(Color(red: 0.10, green: 0.28, blue: 0.16))
            
            Text("Seus pedidos aparecerão aqui\nassim que forem realizados.")
                .font(.system(size: 14, design: .rounded))
                .foregroundColor(Color(red: 0.10, green: 0.28, blue: 0.16).opacity(0.45))
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PedidosFeitosView()
}

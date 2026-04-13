//
//  ViewDePedidos.swift
//  Pin
//
//  Created by João Vitor Moreira on 23.07.24.
//

import SwiftUI

struct CardPedidosView: View {
    
    let pedido: Pedido
    
    var onDelete: () -> Void
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            // ── Header do card (sempre visível) ──────────────────────
            HStack(spacing: 14) {
                
                // Ícone
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
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
                        .frame(width: 44, height: 44)
                        .shadow(color: Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.40), radius: 8, y: 4)
                    
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                // Textos
                VStack(alignment: .leading, spacing: 3) {
                    Text("Problemas da bike")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.08, green: 0.26, blue: 0.14))
                    
                    Text(pedido.id.uuidString.prefix(8).uppercased())
                        .font(.system(size: 11, weight: .medium, design: .monospaced))
                        .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.65))
                }
                
                Spacer()
                
                // Botão expandir + badge
                HStack(spacing: 8) {
                    
                    Text("\(pedido.problemas.count)")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.12))
                        .clipShape(Capsule())
                    
                    Image(systemName: "chevron.down")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42))
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.spring(response: 0.35, dampingFraction: 0.75), value: isExpanded)
                }
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 16)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring(response: 0.45, dampingFraction: 0.75)) {
                    isExpanded.toggle()
                }
            }
            
            // ── Itens expandidos ─────────────────────────────────────
            if isExpanded {
                VStack(spacing: 0) {
                    
                    Rectangle()
                        .fill(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.10))
                        .frame(height: 1)
                        .padding(.horizontal, 18)
                    
                    VStack(spacing: 10) {
                        
                        ForEach(Array(pedido.problemas.enumerated()), id: \.offset) { index, problema in
                            
                            HStack(spacing: 12) {
                                
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.12))
                                        .frame(width: 28, height: 28)
                                    
                                    Text("\(index + 1)")
                                        .font(.system(size: 12, weight: .bold, design: .rounded))
                                        .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42))
                                }
                                
                                Text(problema.title)
                                    .font(.system(size: 14, weight: .medium, design: .rounded))
                                    .foregroundColor(Color(red: 0.08, green: 0.26, blue: 0.14))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 11)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(Color(red: 0.96, green: 0.99, blue: 0.97))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .strokeBorder(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.10), lineWidth: 1)
                                    )
                            )
                        }
                        
                        Button(action: {
                            onDelete()
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Text("Feito")
                                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 13)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.18, green: 0.72, blue: 0.42),
                                        Color(red: 0.08, green: 0.52, blue: 0.28)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .shadow(color: Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.40), radius: 8, y: 4)
                        }
                        .padding(.top, 4)
                    }
                    .padding(.horizontal, 18)
                    .padding(.vertical, 14)
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .strokeBorder(
                            Color(red: 0.18, green: 0.72, blue: 0.42).opacity(isExpanded ? 0.30 : 0.12),
                            lineWidth: 1.2
                        )
                )
                .shadow(
                    color: Color(red: 0.10, green: 0.45, blue: 0.25).opacity(isExpanded ? 0.15 : 0.09),
                    radius: isExpanded ? 16 : 10, x: 0, y: 5
                )
        )
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isExpanded)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 14) {
            CardPedidosView(pedido: Pedido(problemas: []), onDelete: {})
        }
        .padding(20)
    }
    .background(Color(red: 0.96, green: 0.98, blue: 0.96))
}


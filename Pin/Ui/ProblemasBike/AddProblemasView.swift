//
//  ProblemasView.swift
//  Pin
//
//  Created by João Vitor Moreira on 03.07.24.
//
import SwiftUI

struct AddProblemasView: View {
    
    @State var problemasDaMinhaBicicleta: [Problema] = []
    @State private var appeared = false
    
    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.98, blue: 0.96)
                .ignoresSafeArea()
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.20), .clear],
                        center: .center, startRadius: 0, endRadius: 240
                    )
                )
                .frame(width: 380, height: 380)
                .offset(x: 130, y: -230)
                .blur(radius: 18)
            
            VStack(spacing: 0) {
                
                VStack(spacing: 6) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.12))
                            .frame(width: 72, height: 72)
                        
                        Image(systemName: "bicycle")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.18, green: 0.72, blue: 0.42),
                                        Color(red: 0.08, green: 0.52, blue: 0.28)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    
                    Text("Novo Pedido")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.08, green: 0.26, blue: 0.14))
                    
                    Text("Adicione os problemas da bicicleta")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.70))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 24)
                .opacity(appeared ? 1 : 0)
                .offset(y: appeared ? 0 : -10)
                .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.05), value: appeared)
                
                NavigationLink {
                    ProblemasLista(problemasDaMinhaBicicleta: $problemasDaMinhaBicicleta)
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                        Text("Adicionar novo problema")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 13, weight: .semibold))
                            .opacity(0.50)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 16)
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
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.40), radius: 10, y: 5)
                }
                .padding(.horizontal, 20)
                .opacity(appeared ? 1 : 0)
                .offset(y: appeared ? 0 : 16)
                .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.13), value: appeared)
                
                Spacer().frame(height: 24)
                
                if problemasDaMinhaBicicleta.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "tray")
                            .font(.system(size: 30, weight: .light))
                            .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.40))
                        Text("Nenhum problema adicionado")
                            .font(.system(size: 14, design: .rounded))
                            .foregroundColor(Color(red: 0.08, green: 0.26, blue: 0.14).opacity(0.40))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeIn.delay(0.20), value: appeared)
                    
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 10) {
                            ForEach(Array(problemasDaMinhaBicicleta.enumerated()), id: \.element.id) { index, problema in
                                HStack(spacing: 12) {
                                    ZStack {
                                        Circle()
                                            .fill(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.12))
                                            .frame(width: 30, height: 30)
                                        Text("\(index + 1)")
                                            .font(.system(size: 13, weight: .bold, design: .rounded))
                                            .foregroundColor(Color(red: 0.18, green: 0.72, blue: 0.42))
                                    }
                                    
                                    Text(problema.title)
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundColor(Color(red: 0.08, green: 0.26, blue: 0.14))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Button {
                                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                                            if let i = problemasDaMinhaBicicleta.firstIndex(where: { $0.id == problema.id }) {
                                                problemasDaMinhaBicicleta.remove(at: i)
                                            }
                                        }
                                    } label: {
                                        Image(systemName: "trash")
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(Color.red.opacity(0.55))
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 13)
                                .background(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .fill(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                                .strokeBorder(Color(red: 0.18, green: 0.72, blue: 0.42).opacity(0.12), lineWidth: 1)
                                        )
                                        .shadow(color: Color(red: 0.10, green: 0.45, blue: 0.25).opacity(0.09), radius: 8, y: 3)
                                )
                                .transition(.opacity.combined(with: .move(edge: .top)))
                                .opacity(appeared ? 1 : 0)
                                .offset(y: appeared ? 0 : 12)
                                .animation(.spring(response: 0.45, dampingFraction: 0.8).delay(0.18 + Double(index) * 0.06), value: appeared)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                    }
                }
                
                Spacer()
                
                ButtonView(problemasDaMinhaBicicleta: $problemasDaMinhaBicicleta)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 24)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 16)
                    .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.28), value: appeared)
            }
        }
        .navigationTitle("Adicionar Pedido")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            appeared = true
        }
    }
}

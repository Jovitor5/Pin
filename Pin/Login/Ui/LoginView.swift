//
//  Cadastro .swift
//  Pin
//
//  Created by João Vitor Moreira on 16.07.24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
 
    @ObservedObject var viewModel = LoginViewModel()
    @FocusState private var focusedField: Field?
    @State private var appeared = false
 
    enum Field { case email, senha }
 
    var body: some View {
        NavigationView {
            ZStack {
                // ── Background ──────────────────────────────────────────
                Color(red: 0.06, green: 0.06, blue: 0.08)
                    .ignoresSafeArea()
 
                // Decorative blurred orbs
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 0.42, green: 0.20, blue: 1.0).opacity(0.55), .clear],
                            center: .center, startRadius: 0, endRadius: 280
                        )
                    )
                    .frame(width: 480, height: 480)
                    .offset(x: -120, y: -300)
                    .blur(radius: 12)
 
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 0.10, green: 0.60, blue: 1.0).opacity(0.40), .clear],
                            center: .center, startRadius: 0, endRadius: 220
                        )
                    )
                    .frame(width: 360, height: 360)
                    .offset(x: 150, y: 380)
                    .blur(radius: 16)
 
                // ── Content ─────────────────────────────────────────────
                VStack(spacing: 0) {
 
                    Spacer()
 
                    // Logo / Brand
                    VStack(spacing: 10) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(red: 0.50, green: 0.25, blue: 1.0),
                                            Color(red: 0.15, green: 0.55, blue: 1.0)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 64, height: 64)
                                .shadow(color: Color(red: 0.42, green: 0.20, blue: 1.0).opacity(0.6), radius: 18, y: 8)
 
                            Image(systemName: "sparkles")
                                .font(.system(size: 28, weight: .semibold))
                                .foregroundColor(.white)
                        }
 
                        Text("Bem-vindo")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
 
                        Text("Entre na sua conta para continuar")
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white.opacity(0.45))
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.05), value: appeared)
 
                    Spacer().frame(height: 48)
 
                    // ── Fields ───────────────────────────────────────────
                    VStack(spacing: 14) {
                        StyledField(
                            icon: "envelope",
                            placeholder: "E-mail",
                            text: $viewModel.email,
                            keyboardType: .emailAddress,
                            isSecure: false,
                            focused: focusedField == .email
                        )
                        .focused($focusedField, equals: .email)
                        .textInputAutocapitalization(.never)
 
                        StyledField(
                            icon: "lock",
                            placeholder: "Senha",
                            text: $viewModel.senha,
                            keyboardType: .default,
                            isSecure: true,
                            focused: focusedField == .senha
                        )
                        .focused($focusedField, equals: .senha)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.15), value: appeared)
 
                    // ── Error ────────────────────────────────────────────
                    if !viewModel.errorMensager.isEmpty {
                        HStack(spacing: 6) {
                            Image(systemName: "exclamationmark.circle.fill")
                            Text(viewModel.errorMensager)
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                        }
                        .foregroundColor(Color(red: 1.0, green: 0.38, blue: 0.38))
                        .padding(.top, 8)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .animation(.easeInOut, value: viewModel.errorMensager)
                    }
 
                    Spacer().frame(height: 28)
 
                    // ── Primary Button ───────────────────────────────────
                    Button(action: {viewModel.LoginfireBase()}) {
                        ZStack {
                            if viewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Entrar")
                                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.50, green: 0.25, blue: 1.0),
                                    Color(red: 0.20, green: 0.55, blue: 1.0)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(red: 0.42, green: 0.20, blue: 1.0).opacity(0.5), radius: 14, y: 6)
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.22), value: appeared)
 
                    Spacer().frame(height: 20)
 
                    // ── Register ─────────────────────────────────────────
                    NavigationLink {
                        CadastroView()
                    } label: {
                        HStack(spacing: 4) {
                            Text("Não tem conta?")
                                .foregroundColor(Color.white.opacity(0.45))
                            Text("Registre-se")
                                .foregroundColor(Color(red: 0.60, green: 0.45, blue: 1.0))
                                .fontWeight(.semibold)
                        }
                        .font(.system(size: 14, design: .rounded))
                    }
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeIn.delay(0.28), value: appeared)
 
                    Spacer().frame(height: 36)
 
                    // ── Divider ──────────────────────────────────────────
                    HStack {
                        Rectangle()
                            .fill(Color.white.opacity(0.12))
                            .frame(height: 1)
                        Text("ou continue com")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(Color.white.opacity(0.30))
                            .fixedSize()
                        Rectangle()
                            .fill(Color.white.opacity(0.12))
                            .frame(height: 1)
                    }
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeIn.delay(0.32), value: appeared)
 
                    Spacer().frame(height: 20)
 
                    // ── Social Buttons ───────────────────────────────────
                    HStack(spacing: 12) {
                        SocialButton(icon: "apple.logo",  label: "Apple")    { }
                        SocialButton(icon: "g.circle",    label: "Google")   { }
                        SocialButton(icon: "f.circle",    label: "Facebook") { }
                        SocialButton(icon: "person.fill", label: "Fake")     { }
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 12)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.36), value: appeared)
 
                    Spacer()
                }
                .padding(.horizontal, 28)
            }
        }
        .navigationViewStyle(.stack)
        .onAppear { appeared = true }
    }
}
 
// MARK: - Styled Text Field
 
struct StyledField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    var focused: Bool = false
 
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(focused
                    ? Color(red: 0.60, green: 0.45, blue: 1.0)
                    : Color.white.opacity(0.35))
                .frame(width: 20)
                .animation(.easeInOut(duration: 0.2), value: focused)
 
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                        .keyboardType(keyboardType)
                }
            }
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .foregroundColor(.white)
            .tint(Color(red: 0.60, green: 0.45, blue: 1.0))
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white.opacity(focused ? 0.09 : 0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .strokeBorder(
                            focused
                                ? Color(red: 0.60, green: 0.45, blue: 1.0).opacity(0.70)
                                : Color.white.opacity(0.10),
                            lineWidth: 1.2
                        )
                )
        )
        .animation(.easeInOut(duration: 0.2), value: focused)
    }
}
 
// MARK: - Social Button
 
struct SocialButton: View {
    let icon: String
    let label: String
    let action: () -> Void
 
    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .medium))
                Text(label)
                    .font(.system(size: 10, weight: .medium, design: .rounded))
            }
            .foregroundColor(Color.white.opacity(0.70))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.white.opacity(0.06))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .strokeBorder(Color.white.opacity(0.10), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}
 
#Preview {
    LoginView()
}

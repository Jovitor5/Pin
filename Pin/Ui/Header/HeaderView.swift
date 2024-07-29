//
//  HeaderView.swift
//  Pin
//
//  Created by João Vitor Moreira on 09.07.24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack (alignment: .center) {
            Image("pin")
                .resizable()
                .frame(width: 100, height: 100)


            Spacer()
            
            Text("horario e data")
                .foregroundStyle(.black)
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.black),
                alignment: .bottom
        )
        
    }
}

#Preview {
    HeaderView()
}

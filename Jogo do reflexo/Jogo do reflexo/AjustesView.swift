//
//  AjustesView.swift
//  Jogo do reflexo
//
//  Created by Turma01-24 on 10/10/24.
//
import SwiftUI

struct AjustesView: View {
    @State private var nomes: [String] = []
    @State private var novoNome: String = ""
    @State private var quantidadeRodadas: Int = 0

    var body: some View {
        ZStack {
            Color(red: 0.41, green: 0.83, blue: 0.57)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Image("Rectangle 3")
                        .resizable()
                        .frame(width: 300, height: 100)
                        .background(Color(red: 0.22, green: 0.63, blue: 0.41))
                        .cornerRadius(40)
                    
                    Text("Posicione seus dedos nos botões... ")
                        .font(Font.custom("Irish Grover", size: 25))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 100, alignment: .top)
                        .padding(.top, 20)
                }
                
                TextField("Digite um nome...", text: $novoNome)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .frame(width: 250)
                    .padding(.horizontal, 20)

                ForEach(nomes.indices, id: \.self) { index in
                    Text("\(index + 1). \(nomes[index])")
                        .font(Font.custom("Irish Grover", size: 25))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .top)
                }

                Button(action: {
                    if !novoNome.isEmpty {
                        nomes.append(novoNome)
                        novoNome = ""
                    }
                    print("Botão pressionado! Nome adicionado: \(novoNome)")
                }) {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 29.10156, height: 29.10156)
                    }
                    .padding(10)
                    .frame(width: 64, height: 64, alignment: .center)
                    .background(Color(red: 0.22, green: 0.63, blue: 0.41))
                    .cornerRadius(30)
                    .padding(.top, 20)
                }

                HStack {
                    Text("Quantidade de rodadas: \(quantidadeRodadas)") // Display the count
                        .font(Font.custom("Irish Grover", size: 24))
                        .foregroundColor(.white)

                    VStack {
                        Button(action: {
                            quantidadeRodadas += 1
                        }) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        }

                        Button(action: {
                            if quantidadeRodadas > 0 {
                                quantidadeRodadas -= 1
                            }
                        }) {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
                .padding(.top, 10)

                Spacer()
            }
            .padding(.top, 100)
        }
        .frame(width: 440, height: 956)
    }
}

#Preview {
    AjustesView()
}


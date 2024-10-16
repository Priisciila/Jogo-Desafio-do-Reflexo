//
//  ContentView.swift
//  Jogo do reflexo
//
//  Created by Turma01-24 on 10/10/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject var  viewModel = WebSocketViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color(.AZUL)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    
                    Spacer()
                        .frame(height: 100)

                    Text("Desafio do Reflexo")
                        .font(Font.custom("Irish Grover Regular", size: 30))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 104, alignment: .center)

                    NavigationLink(
                        destination: AjustesView().navigationBarBackButtonHidden(true)
                    ) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 257, height: 63)
                                .background(Color(red: 0.22, green: 0.63, blue: 0.41))
                                .cornerRadius(50)

                            
                            HStack {
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)

                                Spacer()
                                    .frame(width: 30)

                                
                                Text("Jogar")
                                    .font(Font.custom("Irish Grover Regular", size: 32))
                                    .foregroundColor(.white)
                                    .frame(height: 37, alignment: .top)
                                    .padding(.top, 4)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    NavigationLink(destination: pontuacao_geral()){
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 257, height: 63)
                                .background(Color(red: 0.93, green: 0.79, blue: 0.29))
                                .cornerRadius(50)

                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)

                                Spacer()
                                    .frame(width: 20)

                                Text("Pontuação")
                                    .font(Font.custom("Irish Grover Regular", size: 32))
                                    .foregroundColor(.black)
                                    .frame(height: 37, alignment: .top)
                                    .padding(.top, 4)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.top, 20)
                    }

                    Button(action: {
                        print("Botão em branco clicado!")
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 257, height: 63)
                                .background(.white)
                                .cornerRadius(50)

                            HStack {
                                Image(systemName: "gear")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.green)

                                Spacer()
                                    .frame(width: 20)

                                Text("Configurações")
                                    .font(Font.custom("Irish Grover Regular", size: 26))
                                    .foregroundColor(.green)
                                    .frame(height: 37, alignment: .top)
                                    .padding(.top, 4)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
        }
    }
}


#Preview {
    ContentView()
}

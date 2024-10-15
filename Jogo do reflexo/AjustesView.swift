import SwiftUI

struct AjustesView: View {
    @StateObject private var viewModel = WebSocketViewModel()

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
                    
                    Text("Selecione a quantidade de jogadores e rodadas ")
                        .font(Font.custom("Irish Grover", size: 25))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 100, alignment: .top)
                        .padding(.top, 20)
                }
                
                TextField("Digite um nome...", text: $viewModel.playerName)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .frame(width: 250)
                    .padding(.horizontal, 20)
                    .disabled(viewModel.isConfirmed)

                ForEach(viewModel.players, id: \.self) { player in
                    Text("\(player.name)")
                        .font(Font.custom("Irish Grover", size: 25))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .top)
                }

                Button(action: {
                    viewModel.confirmPlayer()
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
                .disabled(viewModel.isConfirmed || viewModel.playerName.isEmpty)
                .padding()

                HStack {
                    Text("Quantidade de rodadas: \(viewModel.quantidadeRodadas)") // Display the count
                        .font(Font.custom("Irish Grover", size: 24))
                        .foregroundColor(.white)

                    VStack {
                        Button(action: {
                            viewModel.quantidadeRodadas += 1
                        }) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        }

                        Button(action: {
                            if viewModel.quantidadeRodadas > 1 {
                                viewModel.quantidadeRodadas -= 1
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
                
                Text("Preparados?")
                    .font(Font.custom("Irish Grover", size: 35)) // Font size 35
                    .foregroundColor(.white) // Text color white
                    .multilineTextAlignment(.center) // Text aligned to center
                    .padding(.bottom, 20)

                NavigationLink(destination: EsperaView()) {
                    HStack {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 30, height: 30) // Tamanho da imagem
                            .foregroundColor(.white)

                        Spacer()
                            .frame(width: 30) // Espaçamento entre imagem e texto

                        Text("Confirmar")
                            .font(Font.custom("Irish Grover", size: 25)) // Fonte personalizada
                            .foregroundColor(.white)
                    }
                    .frame(width: 257, height: 63)
                    .background(Color(red: 0.22, green: 0.63, blue: 0.41)) // #38A169
                    .cornerRadius(50)
                }
                .padding(.bottom, 100)

                Spacer()
            }
            .padding(.top, 200)
        }
        .frame(width: 440, height: 956)
        .onAppear() {
            viewModel.connectWebSocket()
        }
        .onDisappear() {
            viewModel.disconnectWebSocket()
        }
    }
}

#Preview {
    AjustesView()
}

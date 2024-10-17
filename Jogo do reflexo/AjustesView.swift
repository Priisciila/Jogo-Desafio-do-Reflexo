import SwiftUI

struct AjustesView: View {
    @StateObject private var viewModel = WebSocketViewModel()
    @StateObject private var ViewModell = Viewmodel()
    
    @State private var showButton = true

    var body: some View {
        ZStack {
            Color(.AZUL)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Image("Rectangle 3")
                        .resizable()
                        .frame(width: 300, height: 100)
                        .background(Color(red: 0.22, green: 0.63, blue: 0.41))
                        .cornerRadius(40)
                    
                    Text("Adicione seu nome e comece a jogar")
                        .font(Font.custom("Irish Grover Regular", size: 25))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 100, alignment: .top)
                        .padding(.top, 20)
                }
                
                if(showButton) {
                    TextField("Digite seu nome...", text: $viewModel.playerName)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .frame(width: 250)
                        .padding(.horizontal, 20)
                        .disabled(viewModel.isConfirmed)
                }

                ForEach(viewModel.players, id: \.self) { player in
                    Text("\(player.name)")
                        .font(Font.custom("Irish Grover", size: 25))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 42, maxHeight: 42, alignment: .top)
                }
                
                if(showButton) {
                    Button(action: {
                        if(!viewModel.playerName.isEmpty){
                            Global.nome = viewModel.playerName
                        }
                        viewModel.confirmPlayer()
                        Global.rodada_selec = viewModel.quantidadeRodadas
                        Global.rodada = 1
                        showButton = false
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
                    
                }

                HStack {
                    Text("Quantidade de rodadas: \(viewModel.quantidadeRodadas)")
                        .font(Font.custom("Irish Grover", size: 24))
                        .foregroundColor(.white)

                    VStack {
                        Button(action: {
                            if !viewModel.isConfirmed && viewModel.players.isEmpty {
                                viewModel.quantidadeRodadas += 1
                            }
                        }) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        }
                        .disabled(!viewModel.players.isEmpty) // Desabilita se houver jogadores

                        Button(action: {
                            if viewModel.quantidadeRodadas > 1 && !viewModel.isConfirmed && viewModel.players.isEmpty { // Verifica se não há jogadores
                                viewModel.quantidadeRodadas -= 1
                            }
                        }) {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        }
                        .disabled(!viewModel.players.isEmpty) // Desabilita se houver jogadores
                    }
                }
                .padding(.top, 10)
                
                Text("Preparados?")
                    .font(Font.custom("Irish Grover", size: 35)) // Font size 35
                    .foregroundColor(.white) // Text color white
                    .multilineTextAlignment(.center) // Text aligned to center
                    .padding(.bottom, 20)
                
                // NavigationLink que depende de viewModel.goToGameScreen
                NavigationLink(
                    destination: EsperaView().navigationBarBackButtonHidden(true),
                    isActive: $viewModel.goToGameScreen
                ) {
                    EmptyView()
                }

                Spacer()
            }
            .padding(.top, 200)
        }
        .frame(width: 440, height: 956)
        .onAppear() {
            viewModel.connectWebSocket()
            ViewModell.fetchDados()
        }
        .onDisappear() {
            viewModel.disconnectWebSocket()
        }
    }
}

#Preview {
    AjustesView()
}

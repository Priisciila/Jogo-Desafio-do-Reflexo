import SwiftUI

struct EsperaView: View {
    @StateObject private var viewModel = WebSocketViewModel()

    // Variáveis para armazenar o tempo de início e o tempo de resposta
    @State private var startTime: Date?
    @State private var responseTime: TimeInterval = 0.0
    @State private var isClicked = false;

    var body: some View {
        ZStack {
            // Cor de fundo dependendo do valor de value
            Color(viewModel.value ? Color.green : Color(red: 0.93, green: 0.79, blue: 0.29))
                .edgesIgnoringSafeArea(.all)
                .onChange(of: viewModel.value) { newValue in
                    if newValue {
                        // Se value se tornou true, iniciar a contagem de tempo
                        startTime = Date()
                    }
                }

            VStack {
                Text("Posicione seus dedos nos botões...")
                    .font(Font.custom("Irish Grover", size: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)

                // Exibir o tempo de resposta quando disponível
                if responseTime > 0 {
                    Text(String(format: "Seu tempo de reação: %.3f segundos", responseTime))
                        .font(.headline)
                        .padding()
                }

                Spacer()

                RoundedRectangle(cornerRadius: 70)
                    .fill(Color.white)
                    .frame(width: 440, height: 290)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
        .onTapGesture {
            if viewModel.value, let start = startTime {
                // Calcular o tempo de reação quando o usuário clicar e a cor estiver verde
                if(isClicked) {
                    
                }
                responseTime = Date().timeIntervalSince(start)
            }
        }
        .onAppear() {
            viewModel.connectWebSocket()
        }
        .onDisappear() {
            viewModel.disconnectWebSocket()
        }
    }
}

#Preview {
    EsperaView()
}

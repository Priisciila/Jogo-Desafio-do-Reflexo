import SwiftUI

struct pontuacao_geral: View {
    @StateObject var viewModelll = ViewModel()
    
    var body: some View {
        ZStack {
            Color.verdeClaro
                .ignoresSafeArea()
            VStack {
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.amarelo)
                            .frame(width: 250, height: 60)
                            .cornerRadius(30.0)
                            .overlay(Text("Pontuação")
                                .font(Font.custom("IrishGrover-Regular", size: 30))
                                .padding(.leading, 45))
                    }
                }
                .padding(.trailing, 200)
                .padding(.bottom, 45)
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.verdeEscuro)
                        .frame(width: 300, height: 300)
                        .cornerRadius(30.0)
                        .overlay(
                            VStack(spacing: 8) {
                                ForEach(viewModelll.jogo, id: \.self) { i in
                                    HStack {
                                        Text(i.nome!)
                                            .font(Font.custom("IrishGrover-Regular", size: 28))
                                            .foregroundStyle(.white)
                                            .padding(.horizontal, 1)

                                        Spacer()

                                        Text("\(i.pts!) pts")
                                            .font(Font.custom("IrishGrover-Regular", size: 28))
                                            .foregroundStyle(.white)
                                            .padding(.horizontal)
                                    }
                                    .padding(.vertical, 2)
                                }
                                Spacer()
                            }
                            .padding()
                        )
                }
            }
            .padding(.bottom, 170)
        }
        .onAppear {
            viewModelll.fetch()
        }
    }
}

#Preview {
    pontuacao_geral()
}

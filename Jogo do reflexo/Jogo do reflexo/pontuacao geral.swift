import SwiftUI

struct pontuacao_geral: View {
    @StateObject var viewModelll = Viewmodel()
    
    @State var ranking : [SaveData] = []
    
    var body: some View {
        ZStack {
            Color.AZUL
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
                                ForEach(ranking.sorted{$0.tempo < $1.tempo}, id: \.self) { i in
                                    HStack {
                                        Text(i.nome)
                                            .font(Font.custom("IrishGrover-Regular", size: 28))
                                            .foregroundStyle(.white)
                                            .padding(.horizontal, 1)

                                        Spacer()

                                        Text("\(i.tempo, specifier: "%.3f") pts")
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
            viewModelll.fetchDados()
        }.onChange(of: viewModelll.dadosList){
            var arrayAux: [SaveData] = []
            
            for r in viewModelll.dadosList {
                print(r.tempo)
                if(arrayAux.filter{$0.nome == r.nome}.count == 0){
                    arrayAux.append(r)
                    
                }
            }
            
            
            for (index, r) in arrayAux.enumerated() {
            //for r in arrayAux {
               // print(r)
                for a in viewModelll.dadosList.filter({ $0.nome == r.nome}){
                   // print(a)
                    arrayAux[index].tempo += a.tempo
                }
            }
            
            print(viewModelll.dadosList.count)
            self.ranking = arrayAux
        }
    }
}

#Preview {
    pontuacao_geral()
}

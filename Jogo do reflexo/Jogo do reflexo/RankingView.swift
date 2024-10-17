//
//  ContentView.swift
//  projetofinal
//
//  Created by Turma01-26 on 10/10/24.
//

import SwiftUI

struct RankingView: View {
    @State private var color: Color = .white
    @StateObject var viewModelll = Viewmodel()
    var body: some View {
        VStack{
            VStack{
                VStack{
                    Text("Ranking da partida")
                        .foregroundColor(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 32, relativeTo: .title))
                }
            }
            
            
            
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                VStack{
                    VStack{
                       
                        ForEach(viewModelll.ranking.sorted{$0.tempo < $1.tempo}, id: \.self){ a in
                            HStack{
                                Text(a.nome)
                                    .foregroundStyle(.black)
                                    .font(Font.custom("IrishGrover-Regular", size: 28))
                                    .padding(.horizontal)
                                
                                Text("\(a.tempo, specifier: "%.3f") pts")
                                    .font(Font.custom("IrishGrover-Regular", size: 28))
                                    .padding(.horizontal)
                                    .foregroundStyle(.black)
                            }
                        }
                    } .foregroundColor(.white)
                        .frame(width: 320, height: 280)
                        .background(.white)
                        .cornerRadius(50)
                 
                    HStack {
                        Text("Voltar")
                            .font(Font.custom("Irish Grover", size: 29))
                            .foregroundColor(.white)
                            .frame(height: 37, alignment: .top)
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity)
                }
                   
                
            }
        }
                        
        .frame(width: 440, height: 956)
        .background(Color(.AZUL))
        .onAppear(){
            viewModelll.contaRanking()
            viewModelll.fetchDados()
        }
    }

}
        
                                
#Preview {
    RankingView()
}

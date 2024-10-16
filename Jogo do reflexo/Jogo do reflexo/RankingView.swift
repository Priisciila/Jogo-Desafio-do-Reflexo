//
//  ContentView.swift
//  projetofinal
//
//  Created by Turma01-26 on 10/10/24.
//

import SwiftUI

struct RankingView: View {
    @State private var color: Color = .white
    @StateObject var viewModelll = ViewModel()
    var body: some View {
        
        
        VStack{
            VStack{
                VStack{
                    Text("XXXXXXXXX")
                        .foregroundColor(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 32, relativeTo: .title))
                }
            }
            
            VStack{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 320, height: 280)
                    .background(.blue)
                    .cornerRadius(50)
            }
            
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 257, height: 63)
                        .background(Color(red: 0.22, green: 0.63, blue: 0.41))
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
        .background(Color(red: 0.34, green: 0.36, blue: 0.2))
        .onAppear(){
            viewModelll.fetch()
        }
    }
}
        
                                
#Preview {
    RankingView()
}

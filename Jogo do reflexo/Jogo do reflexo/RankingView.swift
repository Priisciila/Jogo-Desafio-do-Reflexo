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
        
        
        ZStack{
            VStack{
                VStack{
                    Text("Priscila teve o")
                        .foregroundColor(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 32, relativeTo: .title))
                        .offset(x:0,y:150)
                    Text("melhor tempo de ")
                        .foregroundColor(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 32, relativeTo: .title))
                        .offset(x:0,y:150)
                    
                    Text("reação")
                        .foregroundColor(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 32, relativeTo: .title))
                        .offset(x:0,y:150)
                    
                    Text("Apenas 10 milissegundos de diferença 😲")
                        .foregroundColor(.white)
                        .font(Font.custom("IrishGrover-Regular", size: 15, relativeTo: .title))
                        .offset(x:0,y:160)
                    
                }
                Spacer()
            }
            
            VStack{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 320, height: 280)
                    .background(.blue)
                    .cornerRadius(50)
                    .offset(x:0,y:100)
                    

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

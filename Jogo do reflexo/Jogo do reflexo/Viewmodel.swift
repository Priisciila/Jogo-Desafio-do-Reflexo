//
//  Viewmodel.swift
//  Jogo do reflexo
//
//  Created by Turma01-Backup on 10/10/24.
//

import Foundation

import Foundation

class Viewmodel: ObservableObject {
    @Published var dadosList: [SaveData] = []
    @Published var maiorPartidas: Int = 0

    @Published var ranking: [SaveData] = []
    
    func contaRanking(){
        var arrayAux: [SaveData] = []
        
        for r in self.dadosList {
            print(r)
            if(arrayAux.filter{$0.nome == r.nome}.count > 0){
                arrayAux.append(r)
            }
        }
        
        for (index, r) in arrayAux.enumerated() {
        //for r in arrayAux {
            print(r)
            for a in self.dadosList.filter({ $0.nome == r.nome}){
                print(a)
                arrayAux[index].tempo += a.tempo
            }
        }
        
        ranking = arrayAux
    }
    
    func fetchDados() {
        guard let url = URL(string: "http://127.0.0.1:1880/rankingGET") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }

            do {
                let dados = try JSONDecoder().decode([SaveData].self, from: data)
                DispatchQueue.main.async {
                    self.dadosList = dados
                    
                    var arrayAux: [SaveData] = []
                    
                    
                    for r in self.dadosList {
                        print(r.tempo)
                        if(arrayAux.filter{$0.nome == r.nome}.count == 0){
                            arrayAux.append(r)
                            
                        }
                    }
                    
                    
                    for (index, r) in arrayAux.enumerated() {
                    //for r in arrayAux {
                       // print(r)
                        for a in self.dadosList.filter({ $0.nome == r.nome}){
                           // print(a)
                            arrayAux[index].tempo += a.tempo
                        }
                    }
                    
                    print(self.dadosList.count)
                    self.ranking = arrayAux
                    //self.maiorPartidas = dados.compactMap { $0.partidas }.max() ?? 0
                }
            } catch {
                print("Erro ao decodificar: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
}


//
//  Viewmodel.swift
//  Jogo do reflexo
//
//  Created by Turma01-Backup on 10/10/24.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var jogo: [dados] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/pontuacaoGET") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let parsed = try JSONDecoder().decode([dados].self, from: data)
                
                DispatchQueue.main.async{
                    self?.jogo = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

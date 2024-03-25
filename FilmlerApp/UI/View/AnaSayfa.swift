//
//  AnaSayfa.swift
//  FilmlerApp
//
//  Created by asdirector on 2.03.2024.
//

import SwiftUI

struct AnaSayfa: View {
    @ObservedObject var viewModel = AnaSayfaVM()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kategorilerListesi){ kategori in
                    NavigationLink(destination: FilmSayfa(kategori: kategori)){
                        KategoriItem(kategori: kategori)
                    }
                
                }
                
            }.navigationTitle("Kategoriler")
                .onAppear{
                    veritabaniKopyala()
                    viewModel.kategoriYukle()
                              
          }

        }
    }
    
    func veritabaniKopyala(){
        let bundle = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path){
            print("Veritabanı Daha önce Kopyalandı!")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
}

#Preview {
    AnaSayfa()
}

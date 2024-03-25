//
//  AnaSayfaVM.swift
//  FilmlerApp
//
//  Created by asdirector on 4.03.2024.
//

import Foundation
class AnaSayfaVM: ObservableObject {
    
    @Published var kategorilerListesi = [Kategoriler]()
    
    let db:FMDatabase?
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func kategoriYukle () {
        
        db?.open()
        
        var liste = [Kategoriler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            
            while result.next(){
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                
                let kategori = Kategoriler(kategori_id: kategori_id, kategori_ad: kategori_ad)
                liste.append(kategori)
            }
            kategorilerListesi = liste
            
        }catch{
            print(error.localizedDescription)
        }

        
        db?.close()
    }


}

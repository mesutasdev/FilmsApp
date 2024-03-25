//
//  FilmSayfaVM.swift
//  FilmlerApp
//
//  Created by asdirector on 4.03.2024.
//

import Foundation
class FilmSayfaVM: ObservableObject {
    @Published var filmlerListesi = [Filmler]()
    
    let db:FMDatabase?
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    
    func filmleriYukle(kategoeri_id:Int){
        
        db?.open()
        
        var liste = [Filmler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kategoriler, yonetmenler, filmler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = ? ", values: [kategoeri_id])
            
            while result.next(){
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                
                let kategori = Kategoriler(kategori_id: kategori_id, kategori_ad: kategori_ad)
                
                let yonetmen_id = Int(result.string(forColumn: "yonetmen_id"))!
                let yonetmen_ad = result.string(forColumn: "yonetmen_ad")!
                
                let yonetmen = Yonetmenler(yonetmen_id: yonetmen_id, yonetmen_ad: yonetmen_ad)
                
                let film_id = Int(result.string(forColumn: "film_id"))!
                let film_ad = result.string(forColumn: "film_ad")!
                let film_yil = Int(result.string(forColumn: "film_yil"))!
                let film_resim = result.string(forColumn: "film_resim")!
                
                let film = Filmler(film_id: film_id, film_ad: film_ad, film_yil: film_yil, film_resim: film_resim, kategori: kategori, yonetmen: yonetmen)
                
                liste.append(film)
            }
           filmlerListesi = liste
            
        }catch{
            print(error.localizedDescription)
        }

        
        db?.close()
    }
}

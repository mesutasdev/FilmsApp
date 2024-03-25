//
//  Yonetmenler.swift
//  FilmlerApp
//
//  Created by asdirector on 2.03.2024.
//

import Foundation

class Yonetmenler : Identifiable{
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init(){
        
    }
    
    init(yonetmen_id: Int?, yonetmen_ad: String?) {
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

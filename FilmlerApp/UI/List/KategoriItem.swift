//
//  KategoriItem.swift
//  FilmlerApp
//
//  Created by asdirector on 2.03.2024.
//

import SwiftUI

struct KategoriItem: View {
    var kategori = Kategoriler()
    var body: some View {
        Text(kategori.kategori_ad!)
    }
}

//#Preview {
//    KategoriItem()
//}

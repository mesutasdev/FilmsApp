//
//  FilmItem.swift
//  FilmlerApp
//
//  Created by asdirector on 2.03.2024.
//

import SwiftUI

struct FilmItem: View {
    var film = Filmler()
    var genislik = 0.0
    var body: some View {
        VStack(spacing:5){
            Image(film.film_resim!).resizable().frame(width: genislik)
            Text(film.film_ad!).foregroundColor(.white)
            Text("Sepete Ekle")
                .padding(5)
                .foregroundColor(.white)
                .background(.indigo)
                .cornerRadius(8)
                .padding(.bottom, 5)
                .onTapGesture {
                    print("\(film.film_ad!) Sepete Eklendi.")
                }

        }.background(Rectangle().fill().shadow(radius: 3))
    }
}

//#Preview {
//    FilmItem()
//}

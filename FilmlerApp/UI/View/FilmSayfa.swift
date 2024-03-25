//
//  ContentView.swift
//  FilmlerApp
//
//  Created by asdirector on 2.03.2024.
//

import SwiftUI

struct FilmSayfa: View {
  
    @ObservedObject var viewModel = FilmSayfaVM()
    
    var kategori = Kategoriler()
    
    var body: some View {
      
            GeometryReader { geometry in
                let ekranGenislik = geometry.size.width
                let itemGenislik = (ekranGenislik - 40)/2
                
                ScrollView{
                    LazyVGrid (columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 20){
                        ForEach(viewModel.filmlerListesi){ film in
                            NavigationLink(destination: DetaySayfa(film: film)){
                                FilmItem(film: film, genislik: itemGenislik )
                            }
                          
                        }
                        
                    }
                    
                    
                    
                }.padding(10)
                    .navigationTitle(kategori.kategori_ad!)
                    .onAppear{
                        
                        viewModel.filmleriYukle(kategoeri_id: kategori.kategori_id!)
                                    
                  }
//
                
            }
     
    }
}
//
//#Preview {
//    FilmSayfa()
//}

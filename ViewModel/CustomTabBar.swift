//
//  CustomTabBar.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import SwiftUI

struct CustomTabBar: View {
    @ObservedObject var viewModel: MoviesViewModel

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(viewModel: MoviesViewModel()) 
    }
}

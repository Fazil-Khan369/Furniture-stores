//
//  HomePage.swift
//  Furniture-Shop
//
//  Created by Fazil P on 15/08/2023.
//

import SwiftUI

struct HomePage: View {
    
    private let categories = ["All", "Chair", "Sofa","Lamp", "Kitchen", "Table"]
    
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        TopView()
                        
                        TitleLineView()
                            .padding()
                        
                        SearchView()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    NavigationLink(destination: DetailsView()) {
                                        ProductCardView(image: Image("chair_\(index + 1)"), size: 200)
                                    }
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        
                    }
                }
                
                //            Custom tabview
                
                HStack {
                    
                    TabView(image: Image("Home")) {}
                    TabView(image: Image("Home")) {}
                    TabView(image: Image("Home")) {}
                    TabView(image: Image("Home")) {}
                    
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.20), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


struct TopView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10.0)
                
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct TitleLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            
            if (isActive) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
            
        }
    }
}



struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
                 image
                .resizable()
                .frame(width: size, height: 200 * (size/200))
                .cornerRadius(20)
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct TabView: View {
    
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action ) {
            
            image
                .frame(maxWidth: .infinity)
        }
    }
}

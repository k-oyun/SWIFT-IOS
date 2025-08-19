//
//  ContentView.swift
//  5ForEach&List&Vstack
//
//  Created by Admin on 8/19/25.
//

import SwiftUI


struct Fruit: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}


// ForEach 사용
struct ContentView: View {
//    let fruits = ["사과", "바나나", "오렌지"]
    let fruits = [
        Fruit(name:"사과", imageName: "applelogo"),
        Fruit(name:"바나나", imageName: "leaf"),
        Fruit(name:"오렌지", imageName: "sun.max.fill")
    ]
    var body: some View {
        VStack (alignment: .leading) {
            // 1. 범위 연산자
            // ForEach는 자기 자신이 아이템을 배치하는 능력이 없기 때문에 Vstack등과
            // 같은 컨테이너와 함께 사용해야 한다.
//            ForEach(1...5, id:\.self) { index in
//                    Text("과일 \(index)") // Swift에서 문자열 보간법
//            }
            
            // 2. 문자열 배열로
//            ForEach(fruits, id:\.self) { fruit in
//                    Text(fruit)
//            }
            
            // 3. 모델 데이터 배열로
            // 모델에 id, Identifiable 없으면 에러남
            ForEach(fruits) { fruit in
                HStack {
                    Image(systemName: fruit.imageName)
                    Text(fruit.name)
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

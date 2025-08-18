//
//  ContentView.swift
//  ProfileCard
//
//  Created by Admin on 8/18/25.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        VStack () {
            HStack{
                Image("dongjin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                    
                Spacer()
                
                VStack(alignment: .leading){
                    Text("권오윤")
                        .font(.title)
                    Text("SwiftUI를 공부하는 학생입니다.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(12)
                
                /*pacer()*/
                
                    
            }
            .padding()
            .background(Color.yellow.opacity(0.3))
            .cornerRadius(16)
            Spacer()
            Text("메시지 보내기")
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
      
        Spacer()
        
    }
}
#Preview {
    ProfileCardView()
}

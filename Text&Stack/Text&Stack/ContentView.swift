import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("텍스트1")
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                    .font(.title)
            }
            VStack {
                Text("Placeholder2")
                    .font(.system(size: 24))
            }
            VStack {
                Text("안녕하세요.")
                    .font(.body)
                    .bold()
                    .italic()
                    .foregroundStyle(.red)
            }
            Text("SwiftUI는 \n엄청나게\n쉽습니다.")
                .lineSpacing(10)
                .lineLimit(2)
                .truncationMode(.head)
            Text("안녕하세요 여러분! ㅅㅡ위프트UI를 배워보겠습니다! 안녕하세요 여러분! 스위프트UIfmf qodnjqhrpTtmqslek")
                .lineLimit(1)
                .truncationMode(.tail)
            Text("패딩, 배경, 테두리 ")
                .padding(16 )
                .background(Color.yellow)
                .cornerRadius(20)
//                .border(Color.blue,width: 3)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue,lineWidth:3)
                
                )
            Text("패딩, 배경, 테두리 ")
                .padding(16 )
                .background(Color.yellow)
                .cornerRadius(20)
//                .border(Color.blue,width: 3)
                .clipShape(Circle())
                .overlay(
                    Circle()
                    .stroke(Color.blue,lineWidth:3)
                
                )
            Text("패딩, 배경, 테두리 ")
                .padding(16 )
                .background(Color.yellow)
                .cornerRadius(20)
//                .border(Color.blue,width: 3)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                    .stroke(Color.blue,lineWidth:3)
                
                )
            HStack{
                Text("간단한 텍스트")
                Text("간단한 텍스트")
            }
                
        }
        HStack{ // 가로로 자식 뷰 배치
            
        }
        ZStack{ // 중첩으로 자식 뷰 배치
            
        }
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct ContentView: View {
    @State var inputValue = "2"
    @State var paddingValue = 5
    @State var offsetX = 320.0
    @State var numberOfDigits = 0
    
    
    var body: some View {
        var rectangle = Rectangle()
        var roundedRectangle = RoundedRectangle.self
        var Numbers: [[String]] = [
            ["C", "()", "%", "\u{00f7}"],
            ["7", "8", "9", "x"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "+"],
            ["+/-", "0", ".", "="]
        ]
        
        
        
        

        ZStack(){
            
            GeometryReader {geometry in
                rectangle
                    .fill(Color(red:90/255,green:90/255,blue:90/255))
                    .frame(maxWidth:.infinity)
                    .frame(height:.infinity)
                    .edgesIgnoringSafeArea(.bottom)
                
                roundedRectangle.init(cornerRadius: 20.0)
                    .frame(
                        width: geometry.size.width * 0.89,
                        height: geometry.size.height * 0.8,
                        alignment: .top
                    )
                
                    .position(
                        x:geometry.size.width * 0.25,
                        y:geometry.size.width * 0.89
                    )
                    .padding(.all, 100)
                    .foregroundColor(.gray)
                
                roundedRectangle.init(cornerRadius: 20.0)
                    .frame(
                        width: geometry.size.width * 0.89,
                        height: geometry.size.height * 0.2,
                        alignment: .top
                    )
                
                    .position(
                        x:geometry.size.width * 0.25,
                        y:geometry.size.width * 0.19
                    )
                    .padding(.all, 100.0)
                    .foregroundColor(.black)
                
                
                Grid{
                    ForEach(0..<5,id:\.self) {row in
                        GridRow {
                            ForEach(0..<4, id:\.self) {column in
                                ZStack{
                                    RoundedRectangle.init(cornerRadius: 10.0)
                                        .frame(width: 65,height: 65)
                                        .foregroundColor(.white)
                                        .opacity(0.5)
                                    Button(action: {
                                        var buttonValue = Numbers[row][column]
                                        inputValue = buttonValue
                                        if buttonValue == "C" {
                                            inputValue = ""
                                            offsetX = 320.0
                                            numberOfDigits = 0
                                        
                                        } else {
                                            inputValue = buttonValue
                                           
                                        }
                                        
                                       

                                       
                                    }, label: {
                                        Text(Numbers[row][column])
                                            .foregroundColor(.black)
                                            .font(.system(size:50))
                                    })
                                }
                                
                            }
                        }
                        
                    }
                }
                .position(CGPoint(x: 200, y: 510))

                Text(inputValue)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .position((CGPoint(x:320.0, y:177)))
                    .padding(2)
                
            }
            
        }
    }
}



#Preview {
    ContentView()
}



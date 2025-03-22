//
//  ContentView.swift
//  Wu-Tang
//
//  Created by Gabe Witcher on 3/21/25.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredName = ""
    @State private var staticCoderNameIs = ""
    @State private var wuTangName = ""
    @State private var imageName = "wu-tang"
    @FocusState private var isFocused: Bool
    
    private let firstColumn = ["Algorithmic",
                               "Byte",
                               "Cache",
                               "Debug",
                               "Echo",
                               "Function",
                               "Git",
                               "Hex",
                               "Infinite",
                               "Java",
                               "Kernel",
                               "Logic",
                               "Module",
                               "Node",
                               "Object",
                               "Pixel",
                               "Query",
                               "Runtime",
                               "Script",
                               "Token",
                               "Undefined",
                               "Virtual",
                               "Web",
                               "Xcode",
                               "Yota",
                               "Zero"]
    
    private let secondColumn = ["$tack",
                                "Processor",
                                "Cipher",
                                "Daemon",
                                "EndPoint",
                                "Framework",
                                "Gateway",
                                "Hub",
                                "Interrupt",
                                "Crash",
                                "Loop",
                                "Module",
                                "Nexus",
                                "Optimizer",
                                "Protocol",
                                "Queue",
                                "Router",
                                "Stack",
                                "Thread",
                                "Update",
                                "Variable",
                                "Widget",
                                "Terminal",
                                "Yield",
                                "Zen",
                                "Ace",
                                "Breakpoint",
                                "Root",
                                "Instance",
                                "Access",
                                "Archive",
                                "Control",
                                "Justice"]
    
    var body: some View {
        VStack {
            Text("Wu-Tang\nCoder Name Generator")
        }
        .font(.title)
        .fontWeight(.black)
        .foregroundStyle(.yellow)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .padding()
        .background(.black)
        
        Spacer()
        
        TextField("Enter name here", text: $enteredName)
            .font(.title2)
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            }
            .padding()
            .focused($isFocused)
            .onChange(of: isFocused) {
                if isFocused == true {
                    imageName = ""
                    enteredName = ""
                    staticCoderNameIs = ""
                    wuTangName = ""
                }
            }
            
        
        HStack{
            Button {
                wuTangName = getWuTangName(name: enteredName)
                isFocused = false
                staticCoderNameIs = "Your Wu-Tang Coder Name is:"
                imageName = "wu-tang"
                enteredName = ""
                
            } label: {
                Image("wu-tang-button")
                Text("Get It!")
            }
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.yellow)
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .disabled(enteredName.isEmpty)
        }
        
        VStack{
            Text(staticCoderNameIs)
                .multilineTextAlignment(.leading)
            
            Text(wuTangName)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
        }
        .font(.largeTitle)
        .frame(maxHeight: 130)
        .minimumScaleFactor(0.5)
        
           
        Spacer()
        
        Image(imageName)
            .resizable()
            .scaledToFit()
        
        
        
    }
    
    func getWuTangName(name: String) -> String {
        var localName = name
        let firstLetter = localName.removeFirst()
        print("First letter = \(firstLetter)")
        var firstColumnIndex = 0
        //Loop through first column and compare first letters
        for i in 0..<firstColumn.count {
            if firstColumn[i].first?.uppercased() == firstLetter.uppercased() {
                firstColumnIndex = i == 0 ? 25 : i - 1
            }
        }
        return "\(firstColumn[firstColumnIndex]) \(secondColumn.randomElement()!)"
    }
}

#Preview {
    ContentView()
}

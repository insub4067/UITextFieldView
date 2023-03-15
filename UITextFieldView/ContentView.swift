//
//  ContentView.swift
//  UITextFieldView
//
//  Created by insub on 2023/03/15.
//

import SwiftUI

struct ContentView: View {
    @State var height: CGFloat = .zero
    @State var text = ""
    @State var focused = false
    
    let maxHeight: CGFloat = 80
    
    var body: some View {
        ZStack {
            CommentButton()
            CustomTextField()
        }
    }
    
    @ViewBuilder
    func CommentButton() -> some View {
        VStack {
            Spacer()
            Text("입력하기")
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.gray.opacity(0.3))
                )
                .padding(.horizontal)
                .onTapGesture { focused.toggle() }
        }
    }
    
    @ViewBuilder
    func CustomTextField() -> some View {
        if focused {
            ZStack(alignment: .leading) {
                CommentTextField($height, $text)
                    .frame(height: (height < maxHeight) ? height : maxHeight)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color.gray)
                    )
                    .padding()

                if text.isEmpty {
                    Text("입력하세요.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray.opacity(0.6))
                        .padding(.leading, 6)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

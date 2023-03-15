//
//  CommentText.swift
//  UITextFieldView
//
//  Created by insub on 2023/03/15.
//

import SwiftUI

// MARK: - CommentTextField
struct CommentTextField: UIViewRepresentable {
    
    @Binding var height: CGFloat
    @Binding var text: String
    
    init(_ height: Binding<CGFloat>,
         _ text: Binding<String>)
    {
        self._height = height
        self._text = text
    }
    
    func makeCoordinator() -> CommentTextField.Coordinator {
        return CommentTextField.Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<CommentTextField>) -> UITextView {
        
        let view = UITextView()
        
        view.font = .systemFont(ofSize: 14)
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        view.becomeFirstResponder()
        
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
        
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<CommentTextField>) {
        DispatchQueue.main.async { height = uiView.contentSize.height }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent: CommentTextField
        
        init(_ parent: CommentTextField) { self.parent = parent }
        
        func textViewDidBeginEditing(_ textView: UITextView) { textView.textColor = .black }
        
        func textViewDidChange(_ textView: UITextView) {
            DispatchQueue.main.async { [weak self] in
                self?.parent.height = textView.contentSize.height
                self?.parent.text = textView.text
            }
        }
    }
}


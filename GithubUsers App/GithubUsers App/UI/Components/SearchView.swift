//
//  SearchView.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchedText: String
    
    var body: some View {
        HStack {
            TextField("Enter github username...", text: $searchedText)
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark")
                        .font(.headline)
                        .opacity(searchedText.isEmpty ? 0.0 : 1.0)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            searchedText = ""
                            UIApplication.shared.endEditing()
                        }
                    , alignment: .trailing
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: AppDimens.roundedCorner)
                .fill(Color.searchBox)
                .shadow(
                    color: Color.searchBox.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 0
                )
        )
        .padding()
    }
}

#Preview {
    SearchView(searchedText: .constant(""))
}

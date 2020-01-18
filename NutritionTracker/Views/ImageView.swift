//
//  ImageView.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/16/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import SwiftUI

class RemoteImageURL: ObservableObject {
//    @Published var didChange = PassthroughSubject<Data, Never>()

    @Published var data = Data()

    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}

struct ImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    init(imageURL: String?) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL ?? "")
    }
    var body: some View {
        if !remoteImageURL.data.isEmpty {
            return AnyView(Image(uiImage: (remoteImageURL.data.isEmpty) ? UIImage(imageLiteralResourceName: "Swift") : UIImage(data: remoteImageURL.data)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageURL: "https://miro.medium.com/max/1406/1*XnwPgOqFRJbeAbq-1TWTgQ.png")
    }
}

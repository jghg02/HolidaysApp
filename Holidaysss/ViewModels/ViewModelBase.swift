//
//  ViewModelBase.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 22-09-23.
//

import Foundation

enum LoadingState {
    case loading, success, error, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .loading
}

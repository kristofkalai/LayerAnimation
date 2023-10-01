//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import SwiftUI
import LayerAnimation

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            AnimatedLabel()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct AnimatedLabel: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let label = UILabel()
        label.text = "Test label"
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.animate(to: CALayer.LayerAnimatable.backgroundColor(.green), with: 5) {
            print("Finished: \($0)")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            label.layer.animate(to: CALayer.LayerAnimatable.backgroundColor(.blue), with: 5) {
                print("Finished: \($0)")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                label.layer.animate(to: CALayer.LayerAnimatable.backgroundColor(.brown), with: 5) {
                    print("Finished: \($0)")
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            label.layer.animate(to: CALayer.LayerAnimatable.opacity(Float.zero), with: 5) {
                print("Finished: \($0)")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                label.layer.animate(to: CALayer.LayerAnimatable.opacity(Float(floatLiteral: 1)), with: 5) {
                    print("Finished: \($0)")
                }
            }
        }
        return label
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

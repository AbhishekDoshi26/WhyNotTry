import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    
    @State private var selected = "Archery"
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    @State private var key = 0;
    
    var body: some View {
        Text("Why not try…")
            .font(.largeTitle.bold())
        Spacer()
        VStack(content: {
            Circle()
                .fill(
                    colors.randomElement() ?? .blue
                )
                .padding()
                .overlay(
                    Image(
                        systemName: "figure.\(selected.lowercased())"
                    ).font(.system(size: 100)).foregroundColor(.white)
                )
            Text("\(selected)!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }).transition(.slide).id(key)
        
        Spacer()
        Button("Change Action!", action: {
            withAnimation(.easeInOut(duration: 0.5)) {
                selected = activities.randomElement() ?? "Archery"
                key+=1
            }
            
        }).padding().buttonStyle(.bordered)
    }
}

#Preview {
    ContentView()
}

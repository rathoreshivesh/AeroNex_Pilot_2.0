
//import SwiftUI
//
//struct DroneCategory: View {
//    @State private var isAgricultureChecked = false
//    @State private var isPhotographyChecked = false
//    @State private var isInspectionChecked = false
//    @State private var isSurveillanceChecked = false
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Image("droneCategory")
//                .frame(width: 250,height: 250)
//            
//            Text("Drone Category")
//                .font(.largeTitle)
//                .padding(.bottom, 10)
//                .frame(width: 360,alignment: .leading)
//            ZStack{
//                RoundedRectangle(cornerRadius: 10)
//                    .inset(by: 1)
//                    .stroke(.black, lineWidth: 1)
//                    .frame(width: 360,height:60)
//                    .foregroundColor(.clear)
//                VStack(alignment:.leading){
//                    Toggle("Agriculture", isOn: $isAgricultureChecked)
//                        .toggleStyle(CheckboxToggleStyle())
//                        .foregroundStyle(.black)
//                        .frame(width:320,alignment: .leading)
//                }
//            }
//            ZStack{
//                RoundedRectangle(cornerRadius: 10)
//                    .inset(by: 1)
//                    .stroke(.black, lineWidth: 1)
//                    .frame(width: 360,height:60)
//                    .foregroundColor(.clear)
//                VStack(alignment:.leading){
//                    Toggle("Photography", isOn: $isPhotographyChecked)
//                        .toggleStyle(CheckboxToggleStyle())
//                        .foregroundStyle(.black)
//                        .frame(width:320,alignment: .leading)
//                }
//            }
//
//            ZStack{
//                RoundedRectangle(cornerRadius: 10)
//                    .inset(by: 1)
//                    .stroke(.black, lineWidth: 1)
//                    .frame(width: 360,height:60)
//                    .foregroundColor(.clear)
//                VStack(alignment:.leading){
//                    Toggle("Inspection", isOn: $isInspectionChecked)
//                        .toggleStyle(CheckboxToggleStyle())
//                        .foregroundStyle(.black)
//                        .frame(width:320,alignment: .leading)
//                }
//            }
//
//
//            ZStack{
//                RoundedRectangle(cornerRadius: 10)
//                    .inset(by: 1)
//                    .stroke(.black, lineWidth: 1)
//                    .frame(width: 360,height:60)
//                    .foregroundColor(.clear)
//                VStack(alignment:.leading){
//                    Toggle("Surveillance", isOn: $isSurveillanceChecked)
//                        .toggleStyle(CheckboxToggleStyle())
//                        .foregroundStyle(.black)
//                        .frame(width:320,alignment: .leading)
//                }
//            }
//
//
//            Spacer()
//
//            ZStack{
//                Rectangle()
//                
//                    .fill(Color.black)
//                    .frame(width: 360, height: 45)
//                    
//                    .cornerRadius(10)
//                Text("NEXT")
//                    .font(Font.custom("SF Pro", size: 18))
//                    .foregroundStyle(.white)
//            }
//        }
//        .padding()
//    }
//}
//
//struct DroneCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        DroneCategory()
//    }
//}
//
//struct CheckboxToggleStyle: ToggleStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        Button(action: {
//            configuration.isOn.toggle()
//        }) {
//            HStack {
//                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
//                    .resizable()
//                    .frame(width: 20,height: 20)
//                    .foregroundColor(configuration.isOn ? .blue : .secondary)
//                configuration.label
//            }
//        }
//    }
//}


import SwiftUI
import FirebaseFirestore

struct DroneCategory: View {
    @State private var isAgricultureChecked = false
    @State private var isPhotographyChecked = false
    @State private var isInspectionChecked = false
    @State private var isSurveillanceChecked = false

    var body: some View {
                VStack(spacing: 20) {
                    Image("droneCategory")
                        .frame(width: 250,height: 250)
        
                    Text("Drone Category")
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                        .frame(width: 360,alignment: .leading)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 360,height:60)
                            .foregroundColor(.clear)
                        VStack(alignment:.leading){
                            Toggle("Agriculture", isOn: $isAgricultureChecked)
                                .toggleStyle(CheckboxToggleStyle())
                                .foregroundStyle(.black)
                                .frame(width:320,alignment: .leading)
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 360,height:60)
                            .foregroundColor(.clear)
                        VStack(alignment:.leading){
                            Toggle("Photography", isOn: $isPhotographyChecked)
                                .toggleStyle(CheckboxToggleStyle())
                                .foregroundStyle(.black)
                                .frame(width:320,alignment: .leading)
                        }
                    }
        
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 360,height:60)
                            .foregroundColor(.clear)
                        VStack(alignment:.leading){
                            Toggle("Inspection", isOn: $isInspectionChecked)
                                .toggleStyle(CheckboxToggleStyle())
                                .foregroundStyle(.black)
                                .frame(width:320,alignment: .leading)
                        }
                    }
        
        
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 1)
                            .stroke(.black, lineWidth: 1)
                            .frame(width: 360,height:60)
                            .foregroundColor(.clear)
                        VStack(alignment:.leading){
                            Toggle("Surveillance", isOn: $isSurveillanceChecked)
                                .toggleStyle(CheckboxToggleStyle())
                                .foregroundStyle(.black)
                                .frame(width:320,alignment: .leading)
                        }
                    }
        
        
                    Spacer()
        
                    ZStack{
                        Rectangle()
        
                            .fill(Color.black)
                            .frame(width: 360, height: 45)
        
                            .cornerRadius(10)
                        Text("NEXT")
                            .font(Font.custom("SF Pro", size: 18))
                            .foregroundStyle(.white)
                    }
                }
        .padding()
    }

    private func saveDroneCategoriesToFirestore() {
        let db = Firestore.firestore()

        let categories = [
            "Agriculture": isAgricultureChecked,
            "Photography": isPhotographyChecked,
            "Inspection": isInspectionChecked,
            "Surveillance": isSurveillanceChecked
        ]
        
        db.collection("pilots").document("exampleUserID").setData(categories) { error in
            if let error = error {
                print("Error saving categories: \(error.localizedDescription)")
            } else {
                print("Categories saved successfully!")
            }
        }
    }
}

struct DroneCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DroneCategory()
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(configuration.isOn ? .blue : .secondary)
                configuration.label
            }
        }
    }
}


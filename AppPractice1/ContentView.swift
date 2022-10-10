import SwiftUI
import CoreData
import CoreML

struct ContentView: View {
    @State private var m1=0
    @State private var m2=0
    @State private var m3=0
    @State private var m4=0
    @State private var m5=0
    @State private var m6=0
    @State private var m7=0
    @State private var m8=0
    @State private var m9=0
    @State private var m10=0
    @State private var m11=0
    @State private var m12=0
    @State private var m13=0
    @State private var m14=0
    @State private var m15=0
    @State private var prediction=4
    var body: some View {
        VStack{
            Group{
                TextField ("Enter text", value: $m1, formatter: NumberFormatter())
                TextField ("Enter text", value: $m2, formatter: NumberFormatter())
                TextField ("Enter text", value: $m3, formatter: NumberFormatter())
                TextField ("Enter text", value: $m4, formatter: NumberFormatter())
                TextField ("Enter text", value: $m5, formatter: NumberFormatter())
            }
            Group{
                TextField ("Enter text", value: $m6, formatter: NumberFormatter())
                TextField ("Enter text", value: $m7, formatter: NumberFormatter())
                TextField ("Enter text", value: $m8, formatter: NumberFormatter())
                TextField ("Enter text", value: $m9, formatter: NumberFormatter())
                TextField ("Enter text", value: $m10, formatter: NumberFormatter())
            }
            Group{
                TextField ("Enter text", value: $m11, formatter: NumberFormatter())
                TextField ("Enter text", value: $m12, formatter: NumberFormatter())
                TextField ("Enter text", value: $m13, formatter: NumberFormatter())
                TextField ("Enter text", value: $m14, formatter: NumberFormatter())
                TextField ("Enter text", value: $m15, formatter: NumberFormatter())
            }
            Text(String(prediction))
            Button("Check"){
                prediction = Int(modelfunction(Double(m1),Double(m2),Double(m3),Double(m4),Double(m5),Double(m6),Double(m7),Double(m8),Double(m9),Double(m10),Double(m11),Double(m12),Double(m13),Double(m14),Double(m15)))
                
            }
        }
        .font(.system(size: 30))
        .multilineTextAlignment(.center)
        
    }
    func modelfunction(_ m1:Double,_ m2:Double,_ m3:Double,_ m4:Double,_ m5:Double,_ m6:Double,_ m7:Double,_ m8:Double,_ m9:Double,_ m10:Double,_ m11:Double,_ m12:Double,_ m13:Double,_ m14:Double,_ m15:Double) -> Int64 {
        let model = Model1()
        do{
            let predict = try model.prediction(sex:m1, age:m2, education:m3, currentsmoker:m4, cigsperday:m5, bpmeds:m6, prevstroke:m7, prevhyper:m8, diabetes:m9, chol:m10, sys:m11, dia:m12, bmi:m13, heartrate:m14, glucose:m15)
            return predict.result
        } catch{
            fatalError("Could Not Make Prediction")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

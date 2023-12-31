
import SwiftUI

struct AverageMatchTimesView : View {
    var aid: TimeInterval?
    var withoutAid: TimeInterval?
    var title: LocalizedStringKey = "AVG_MATCH_TIMES"
    
    func timeToString(_ inter : TimeInterval?) -> String {
        if let inter = inter {
            return "\(String(format: "%.2f", inter)) s"
        }
        
        return "---"
    }
    
    var grade: String {
        if let aid = aid, let withoutAid = withoutAid {
            var avg = (aid + withoutAid) / 2
            
            let list = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"]
            var selected = 0
            while avg > 10 {
                selected += 1
                avg -= 5
            }
            
            return list[selected]
        } else {
            return "--"
        }
    }
    
    var gradeColor : Color {
        if let aid = aid, let withoutAid = withoutAid {
            let avg = (aid + withoutAid) / 2
            
            if avg < 15 {
                return .green
            } else if avg < 30 {
                return .yellow
            } else if avg < 45 {
                return .orange
            }
            
            return .red
        }
        
        return .blue
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom)
            
            HStack {
                Spacer()
                
                // Grade
                ZStack {
                    Circle()
                        .foregroundColor(gradeColor)
                    
                    Text(grade)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(width: 50, height: 50)
                
                Spacer()
                
                VStack {
                    Text("\(timeToString(aid))")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                    
                    Text("WITH_AID_LABEL")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            
                VStack {
                    Text("\(timeToString(withoutAid))")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                    
                    Text("WITHOUT_AID_LABEL")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
        }
    }
}

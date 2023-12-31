
import SwiftUI

struct FinishedQuizView: View {
    var model: QuizTakingViewModel
    var daddyModel: QuizTabViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                Text("FINISHED_QUIZ_TITLE")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Image("\(model.learningImageName)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding()
                
                Text("RESULTS_LABEL")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                
                QuizResultsListView(entry: model.entry)
                
                Button(action: {
                    daddyModel.logResult(model.entry)
                    daddyModel.takingQuiz.toggle()
                }) {
                    Text("CLOSE_BTN")
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous)))
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                .navigationTitle("QUIZ_LABEL")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

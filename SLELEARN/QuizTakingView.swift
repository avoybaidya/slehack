
import SwiftUI

struct QuizTakingView: View {
    @ObservedObject var model : QuizTakingViewModel
    @ObservedObject var daddyModel: QuizTabViewModel
    
    var body: some View {
        ZStack {
            if (model.state == .start) {
                NewQuizView(model: model)
            } else if (model.state == .taking) {
                AlphabetEntryQuizView(model: model)
            } else if (model.state == .finished) {
                FinishedQuizView(model: model, daddyModel: daddyModel)
            }
        }
    }
}

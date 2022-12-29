import SwiftUI

public struct FeedbackCuvo: View {

    public init() {
    }
    
    @State private var rating = 4;
    @State private var feedbackString = "";
    @State private var email = "";
    @State private var isExpanded = false;
    @State private var chosenCategory = "";
    var categories: [String] = ["Display", "Performance", "Other"]
    public var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Choose rating")){
                    HStack(alignment: .center){
                        RatingView(rating: $rating, label: "Feedback")
                    }
                }
                Section(header: Text("Feedback")) {
                    TextField("Your Email Address", text: $email)
                    DisclosureGroup(chosenCategory != "" ? chosenCategory : "Choose Category", isExpanded: $isExpanded) {
                        ForEach(categories, id: \.self) {category in
                            Text("\(category)")
                                .onTapGesture {
                                    self.chosenCategory = category;
                                    withAnimation{
                                        self.isExpanded.toggle();
                                    }
                                }
                            }
                    }
                    
                }
                Section(header: Text("Write your feedback here")) {
                    TextEditor(text: $feedbackString).lineLimit(3)
                        .frame(maxHeight: 200)
                }
            }
            .navigationTitle("CuVo - Customer Voice")
        }
    }
}

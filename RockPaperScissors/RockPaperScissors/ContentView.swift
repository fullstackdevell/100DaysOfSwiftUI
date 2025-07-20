import SwiftUI

struct ContentView: View {

    @State private var possibleMoves = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var goalTitle = ""
    @State private var userScore = 0
    @State private var scoreTitle = ""
    @State private var questionsCounter = 0
    @State private var showingGameOver = false
    @State private var showingScore = false

    @State private var shouldWin = Bool.random()

    let moveEmojis = ["🪨", "📄", "✂️"]
    let totalQuestions = 10
    let movesDictionary = [
                    "Rock": "Scissors", // key represents a move that beats the value move
                    "Scissors": "Paper",
                    "Paper": "Rock",
                ]


    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                
                Spacer()

                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack {
                    VStack {
                        Text("App's move is: \(possibleMoves[correctAnswer])")
                            .foregroundStyle(.white)
                            .font(.title2.bold())
                        Text("Your goal is: \(goalTitle)")
                            .foregroundStyle(.white)
                            .font(.title2.bold())
                    }

                    ForEach(0..<3) { number in
                        Button {
                            moveTapped(number)
                        } label: {
                            MoveImage(moveName: possibleMoves[number], moveEmojis: moveEmojis)
                        }
                    }
                    
                    Spacer()
                    Spacer()


                    Text("Question \(questionsCounter + 1) of \(totalQuestions)")
                        .foregroundStyle(.white)
                        .font(.headline)

                    Text("Score: \(userScore)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    
                    Spacer()
                }
                .padding()
                .onAppear() {
                    askQuestion()
                }
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Your score is \(userScore)")
                }
                .alert("Game Over!", isPresented: $showingGameOver) {
                            Button("Restart Game", action: resetGame)
                        } message: {
                            Text("You answered \(userScore) out of \(totalQuestions) correctly.")
                        }
            }
        }
    }


    func moveTapped(_ number: Int) {
        let playerMove = possibleMoves[number]
        let appMove = possibleMoves[correctAnswer]
        var playerWins = false
        var isTie = false
        
        if playerMove == appMove {
            isTie = true
            playerWins = false
        } else {
            if movesDictionary[playerMove] == appMove {
                playerWins = true
            } else {
                playerWins = false
            }
        }
        
        
//        if playerMove == appMove {
//            isTie = true
//            playerWins = false
//        } else if playerMove == "Rock" {
//            if appMove == "Scissors" {
//                playerWins = true
//            } else {
//                playerWins = false
//            }
//        } else if playerMove == "Paper" {
//            if appMove == "Rock" {
//                playerWins = true
//            } else {
//                playerWins = false
//            }
//        } else if playerMove == "Scissors" {
//            if appMove == "Paper" {
//                playerWins = true
//            } else {
//                playerWins = false
//            }
//        }
        
        if shouldWin {
            if playerWins {
                scoreTitle = "Correct! You won!"
                userScore += 1
            } else if isTie {
                scoreTitle = "Wrong! It was a tie, you needed to win"
                userScore -= 1
            } else {
                scoreTitle = "Wrong! You lost, but the goal was to win"
                userScore -= 1
            }
        } else {
            if playerWins {
                scoreTitle = "Wrong! Your goal was to lose"
                userScore -= 1
            } else if isTie {
                scoreTitle = "Wrong! It was a tie, you needed to lose"
                userScore -= 1
            } else {
                scoreTitle = "Correct! Your goal was to lose"
                userScore += 1
            }
        }
        
        questionsCounter += 1
        showingScore = true
    }

    func askQuestion() {
        if questionsCounter == totalQuestions {
            showingGameOver = true
        } else {
            possibleMoves.shuffle()
            correctAnswer = Int.random(in: 0...2)
            shouldWin.toggle()
            goalTitle = shouldWin ? "to win" : "to lose"
        }
    }

    func resetGame() {
        questionsCounter = 0
        userScore = 0
        askQuestion()
        showingGameOver = false
    }
}

struct MoveImage: View {
    let moveName: String
    let moveEmojis: [String]
    
    var body: some View {
        
        let emojiMap: [String: String] = ["Rock": "🪨", "Paper": "📄", "Scissors": "✂️"]
        Text(emojiMap[moveName] ?? "❓")
            .font(.system(size: 80))
            .padding()
            .background(.regularMaterial)
            .clipShape(.buttonBorder)
    }
}

#Preview {
    ContentView()
}

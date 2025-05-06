import Foundation

struct Quiz : Codable, Hashable {
    let quizName: String
    let questions: [Question]
}

let quizes: [Quiz] = [
    Quiz(
            quizName: "Niagara Falls: Natural Wonders",
            questions: [
                Question(
                    question: "How many waterfalls make up Niagara Falls?",
                    answers: ["One", "Two", "Three", "Four"],
                    correctAnswer: "Three"
                ),
                Question(
                    question: "Which of the following is NOT one of the three waterfalls?",
                    answers: ["Horseshoe Falls", "Bridal Veil Falls", "American Falls", "Victoria Falls"],
                    correctAnswer: "Victoria Falls"
                ),
                Question(
                    question: "On which river is Niagara Falls located?",
                    answers: ["Mississippi River", "Niagara River", "Hudson River", "St. Lawrence River"],
                    correctAnswer: "Niagara River"
                ),
                Question(
                    question: "Which two Great Lakes are connected by the Niagara River?",
                    answers: ["Lake Superior and Lake Michigan", "Lake Erie and Lake Ontario", "Lake Huron and Lake Erie", "Lake Michigan and Lake Ontario"],
                    correctAnswer: "Lake Erie and Lake Ontario"
                ),
                Question(
                    question: "Approximately how old is Niagara Falls?",
                    answers: ["1,000 years", "12,000 years", "100,000 years", "1 million years"],
                    correctAnswer: "12,000 years"
                ),
                Question(
                    question: "What is the approximate height of Horseshoe Falls?",
                    answers: ["50 feet", "100 feet", "180 feet", "300 feet"],
                    correctAnswer: "180 feet"
                ),
                Question(
                    question: "Which side of Niagara Falls is known for the Horseshoe Falls?",
                    answers: ["Canadian side", "American side", "Both sides", "Neither side"],
                    correctAnswer: "Canadian side"
                ),
                Question(
                    question: "What is the name of the island that separates the American Falls and Bridal Veil Falls?",
                    answers: ["Goat Island", "Luna Island", "Grand Island", "Niagara Island"],
                    correctAnswer: "Luna Island"
                ),
                Question(
                    question: "Which of the following is a popular boat tour that takes visitors close to the falls?",
                    answers: ["Maid of the Mist", "Niagara Cruiser", "Falls Explorer", "Waterfall Wanderer"],
                    correctAnswer: "Maid of the Mist"
                ),
                Question(
                    question: "What natural phenomenon often appears over Niagara Falls on sunny days?",
                    answers: ["Aurora Borealis", "Rainbow", "Solar Eclipse", "Fogbow"],
                    correctAnswer: "Rainbow"
                ),
                Question(
                    question: "What is the name of the observation tower that offers panoramic views of Niagara Falls?",
                    answers: ["CN Tower", "Skylon Tower", "Space Needle", "Eiffel Tower"],
                    correctAnswer: "Skylon Tower"
                ),
                Question(
                    question: "Which U.S. state is home to the American side of Niagara Falls?",
                    answers: ["New York", "Michigan", "Ohio", "Pennsylvania"],
                    correctAnswer: "New York"
                ),
                Question(
                    question: "What is the name of the park on the U.S. side that offers views of the falls?",
                    answers: ["Niagara Falls State Park", "American Falls Park", "Fallsview Park", "Rainbow Park"],
                    correctAnswer: "Niagara Falls State Park"
                ),
                Question(
                    question: "Which famous inventor helped develop hydroelectric power at Niagara Falls?",
                    answers: ["Thomas Edison", "Nikola Tesla", "Alexander Graham Bell", "Benjamin Franklin"],
                    correctAnswer: "Nikola Tesla"
                ),
                Question(
                    question: "What is the primary source of water for Niagara Falls?",
                    answers: ["Rainfall", "Lake Michigan", "Lake Erie", "Lake Superior"],
                    correctAnswer: "Lake Erie"
                )
            ]
        ),
        Quiz(
            quizName: "Niagara Falls: History and Daredevils",
            questions: [
                Question(
                    question: "Who was the first person to go over Niagara Falls in a barrel and survive?",
                    answers: ["Annie Edson Taylor", "Charles Blondin", "Nik Wallenda", "Sam Patch"],
                    correctAnswer: "Annie Edson Taylor"
                ),
                Question(
                    question: "In what year did Annie Edson Taylor go over the falls?",
                    answers: ["1901", "1920", "1895", "1910"],
                    correctAnswer: "1901"
                ),
                Question(
                    question: "Which daredevil famously crossed Niagara Falls on a tightrope in 1859?",
                    answers: ["Nik Wallenda", "Charles Blondin", "Jean Lussier", "Bobby Leach"],
                    correctAnswer: "Charles Blondin"
                ),
                Question(
                    question: "What unique feat did Charles Blondin perform while crossing the falls?",
                    answers: ["Rode a bicycle", "Cooked an omelet", "Juggled flaming torches", "Sang opera"],
                    correctAnswer: "Cooked an omelet"
                ),
                Question(
                    question: "Who was the first person to cross Niagara Falls on a tightrope in the 21st century?",
                    answers: ["Jay Cochrane", "Nik Wallenda", "Philippe Petit", "Dean Potter"],
                    correctAnswer: "Nik Wallenda"
                ),
                Question(
                    question: "In what year did Nik Wallenda cross Niagara Falls on a tightrope?",
                    answers: ["2010", "2012", "2015", "2018"],
                    correctAnswer: "2012"
                ),
                Question(
                    question: "What is the name of the boy who survived going over Horseshoe Falls in 1960?",
                    answers: ["Roger Woodward", "Timothy Henry", "Michael Jones", "David Smith"],
                    correctAnswer: "Roger Woodward"
                ),
                Question(
                    question: "Which daredevil went over the falls in a rubber ball in 1928?",
                    answers: ["Bobby Leach", "Jean Lussier", "Steve Trotter", "Peter DeBernardi"],
                    correctAnswer: "Jean Lussier"
                ),
                Question(
                    question: "What was the profession of Annie Edson Taylor before her stunt?",
                    answers: ["Schoolteacher", "Nurse", "Engineer", "Artist"],
                    correctAnswer: "Schoolteacher"
                ),
                Question(
                    question: "Which daredevil died attempting to go over the falls in a barrel in 1920?",
                    answers: ["Charles Stephens", "Bobby Leach", "Steve Trotter", "Jean Lussier"],
                    correctAnswer: "Charles Stephens"
                ),
                Question(
                    question: "What is the name of the law that prohibits stunts at Niagara Falls?",
                    answers: ["Niagara Falls Protection Act", "Stunt Prohibition Act", "Niagara Parks Act", "Falls Safety Act"],
                    correctAnswer: "Niagara Parks Act"
                ),
                Question(
                    question: "Which tightrope walker carried his manager on his back during a crossing?",
                    answers: ["Nik Wallenda", "Charles Blondin", "Jay Cochrane", "Philippe Petit"],
                    correctAnswer: "Charles Blondin"
                ),
                Question(
                    question: "What did daredevil Bobby Leach use to go over the falls?",
                    answers: ["Steel barrel", "Wooden barrel", "Rubber ball", "Inflatable raft"],
                    correctAnswer: "Steel barrel"
                ),
                Question(
                    question: "Which stunt performer survived going over the falls twice?",
                    answers: ["Steve Trotter", "Peter DeBernardi", "Jean Lussier", "Charles Blondin"],
                    correctAnswer: "Steve Trotter"
                ),
                Question(
                    question: "What is the fine for attempting a stunt at Niagara Falls without permission?",
                    answers: ["$10,000", "$25,000", "$50,000", "$100,000"],
                    correctAnswer: "$10,000"
                )
            ]
        ),
    Quiz(
        quizName: "Niagara Falls: Geography and Attractions",
        questions: [
            Question(
                question: "Which city is located on the Canadian side of Niagara Falls?",
                answers: ["Toronto", "Niagara Falls, Ontario", "Ottawa", "Hamilton"],
                correctAnswer: "Niagara Falls, Ontario"
            ),
            Question(
                question: "Which city is located on the U.S. side of Niagara Falls?",
                answers: ["Buffalo", "Niagara Falls, New York", "Rochester", "Albany"],
                correctAnswer: "Niagara Falls, New York"
            ),
            Question(
                question: "What is the name of the bridge that connects the U.S. and Canadian sides near the falls?",
                answers: ["Rainbow Bridge", "Peace Bridge", "Whirlpool Bridge", "Clifton Bridge"],
                correctAnswer: "Rainbow Bridge"
            ),
            Question(
                question: "Which tower offers a revolving dining room with views of the falls?",
                answers: ["CN Tower", "Skylon Tower", "Space Needle", "Minolta Tower"],
                correctAnswer: "Skylon Tower"
            ),
            Question(
                question: "What is the name of the park on the Canadian side that offers views of the falls?",
                answers: ["Queen Victoria Park", "Niagara Falls State Park", "Fallsview Park", "Maple Leaf Park"],
                correctAnswer: "Queen Victoria Park"
            ),
            Question(
                question: "Which attraction allows visitors to walk behind the falls?",
                answers: ["Journey Behind the Falls", "Cave of the Winds", "Maid of the Mist", "Niagara Tunnel Tour"],
                correctAnswer: "Journey Behind the Falls"
            ),
            Question(
                question: "What is the name of the whirlpool located downstream from the falls?",
                answers: ["Niagara Whirlpool", "Devil's Hole", "Whirlpool Rapids", "Gorge Vortex"],
                correctAnswer: "Niagara Whirlpool"
            ),
            Question(
                question: "Which attraction offers an aerial cable car ride over the Niagara Whirlpool?",
                answers: ["Whirlpool Aero Car", "Niagara SkyWheel", "Fallsview Gondola", "Niagara Cable Ride"],
                correctAnswer: "Whirlpool Aero Car"
            ),
            Question(
                question: "What is the name of the large indoor water park near the falls?",
                answers: ["Fallsview Indoor Waterpark", "Niagara Splash Zone", "Great Wolf Lodge", "Hydro Fun Zone"],
                correctAnswer: "Fallsview Indoor Waterpark"
            ),
            Question(
                question: "Which attraction offers panoramic views and is known for its height and yellow elevators?",
                answers: ["Skylon Tower", "CN Tower", "Space Needle", "Tower of Niagara"],
                correctAnswer: "Skylon Tower"
            ),
            Question(
                question: "What is the name of the theater that showcases IMAX films about Niagara Falls history?",
                answers: ["Niagara Adventure Theater", "IMAX Niagara", "Falls History Dome", "Niagara Dome"],
                correctAnswer: "IMAX Niagara"
            ),
            Question(
                question: "Which floral attraction is near Niagara Falls and includes a greenhouse and gardens?",
                answers: ["Niagara Parks Botanical Gardens", "Fallsview Floral Park", "Canadian Garden Conservatory", "Niagara Greenhouse"],
                correctAnswer: "Niagara Parks Botanical Gardens"
            ),
            Question(
                question: "Where can you find more than 2,000 butterflies in a tropical setting near Niagara Falls?",
                answers: ["Butterfly Conservatory", "Flora Dome", "Wings World", "Niagara Insectarium"],
                correctAnswer: "Butterfly Conservatory"
            ),
            Question(
                question: "What entertainment district in Niagara Falls, Ontario is known for arcades and attractions?",
                answers: ["Clifton Hill", "Falls Street", "Casino Row", "Luna Way"],
                correctAnswer: "Clifton Hill"
            ),
            Question(
                question: "What casino offers views of the falls and entertainment in Niagara Falls, Ontario?",
                answers: ["Fallsview Casino", "Casino Niagara", "Skyline Casino", "Rainbow Casino"],
                correctAnswer: "Fallsview Casino"
            )
        ]
    ),
    Quiz(
        quizName: "Niagara Falls: Fun Facts and Culture",
        questions: [
            Question(
                question: "Which famous magician once performed stunts near Niagara Falls?",
                answers: ["David Copperfield", "Criss Angel", "Harry Houdini", "Penn Jillette"],
                correctAnswer: "Harry Houdini"
            ),
            Question(
                question: "Niagara Falls has appeared in which iconic TV show?",
                answers: ["The Office", "Friends", "Breaking Bad", "Game of Thrones"],
                correctAnswer: "The Office"
            ),
            Question(
                question: "Which animal is commonly seen near the falls?",
                answers: ["Black bears", "White-tailed deer", "Seagulls", "Coyotes"],
                correctAnswer: "Seagulls"
            ),
            Question(
                question: "What kind of lighting display is common at night at Niagara Falls?",
                answers: ["LED rainbow lights", "Laser show", "Fireworks", "Both lights and fireworks"],
                correctAnswer: "Both lights and fireworks"
            ),
            Question(
                question: "Niagara Falls is a traditional honeymoon destination. When did this trend begin?",
                answers: ["Late 1700s", "Mid 1800s", "Early 1900s", "1950s"],
                correctAnswer: "Mid 1800s"
            ),
            Question(
                question: "Which popular festival features music, food, and lights at Niagara Falls?",
                answers: ["Winter Festival of Lights", "Falls Summer Fest", "Riverfront Jam", "Light the Gorge"],
                correctAnswer: "Winter Festival of Lights"
            ),
            Question(
                question: "What is a popular sweet treat sold near the falls?",
                answers: ["Maple fudge", "BeaverTails", "Niagara taffy", "Butter tarts"],
                correctAnswer: "Maple fudge"
            ),
            Question(
                question: "Which famous road near the falls features haunted houses and wax museums?",
                answers: ["Clifton Hill", "Lundy's Lane", "Fallsview Avenue", "Rainbow Road"],
                correctAnswer: "Clifton Hill"
            ),
            Question(
                question: "What historic power plant helped electrify nearby cities from Niagara Falls?",
                answers: ["Schoellkopf Power Station", "Tesla Hydroelectric Plant", "Horseshoe Power Plant", "Niagara Energy Station"],
                correctAnswer: "Schoellkopf Power Station"
            ),
            Question(
                question: "Which famous U.S. president visited Niagara Falls in 1841?",
                answers: ["Abraham Lincoln", "Thomas Jefferson", "Theodore Roosevelt", "John Quincy Adams"],
                correctAnswer: "Abraham Lincoln"
            ),
            Question(
                question: "What popular seasonal beverage is made from local Niagara grapes?",
                answers: ["Niagara cider", "Ice wine", "Concord punch", "Frost wine"],
                correctAnswer: "Ice wine"
            ),
            Question(
                question: "Niagara Falls shares its name with what indigenous nation?",
                answers: ["Seneca", "Niagara", "Tuscarora", "Onondaga"],
                correctAnswer: "Niagara"
            ),
            Question(
                question: "What does the word 'Niagara' likely mean?",
                answers: ["Thunder of Waters", "Great River", "Roaring Rapids", "Sacred Falls"],
                correctAnswer: "Thunder of Waters"
            ),
            Question(
                question: "Which form of transportation once brought millions of tourists to the falls in the 19th century?",
                answers: ["Railroad", "Horse-drawn trolley", "Canal boats", "Steamships"],
                correctAnswer: "Railroad"
            ),
            Question(
                question: "Which major holiday season brings millions of visitors to see the illuminated falls?",
                answers: ["Christmas", "Canada Day", "Halloween", "Thanksgiving"],
                correctAnswer: "Christmas"
            )
        ]
    )
]

require 'pry'
# Act I
puts "Act I"

hamlets = [
  "Laurence Olivier, 1948",
  "Grigori Kozintsev, 1964",
  "Tony Richardson, 1969",
  "Franco Zeffirelli, 1990",
  "Kenneth Branagh, 1996",
  "Michael Almereyda, 2000"
]

# Scene I 
puts "Scene I"
hamlets.each { |hamlet| puts "O! The venerable #{hamlet.split(', ')[0]} starred as Hamlet in #{hamlet.split(', ')[1]}" }
puts "\n"

# Scene II
puts "Scene II"
hamlets.map! { |hamlet| [hamlet.split(', ')[0], hamlet.split(', ')[1].to_i] }
# Printing to console to check work
puts "#{hamlets} \n\n"

# Scene III
puts "Scene III"
hamlets.map! { |hamlet| {:name => hamlet[0], :year => hamlet[1]} }
# Printing to console to check work
puts "#{hamlets} \n\n"

# Scene IV
puts "Scene IV"
swingin_hamlets = hamlets.select { |hamlet| hamlet[:year] >= 1960 && hamlet[:year] <= 1970 }
# Printing to console to check work
puts "#{swingin_hamlets} \n\n"  

# Scene V
puts "Scene V"
future_hamlets = hamlets.select { |hamlet| hamlet[:year] >= 2000 }
# Printing to console to check work
puts "#{future_hamlets} \n\n"

# Act II
puts "Act II"

quotes_array = [
  ["To be, or not to be: that is the question", "Hamlet-(Act III,Scene I)."],
  ["A little more than kin, and less than kind", "Hamlet-(Act I,Scene II)."],
  ["And it must follow, as the night the day, thou canst not then be false to any man", "Hamlet-(Act I,Scene III)."],
  ["This is the very ecstasy of love", "Hamlet-(Act II,Scene I)."],
  ["Brevity is the soul of wit", "Hamlet-(Act II,Scene II)."],
  ["Do you think I am easier to be played on than a pipe?", "Hamlet-(Act III,Scene II)."],
  ["Doubt that the sun doth move, doubt truth to be a liar, but never doubt I love", "Hamlet-(Act II,Scene II)."],
  ["I will speak daggers to her, but use none", "Hamlet-(Act III,Scene II)."],
  ["In my mind's eye", "Hamlet-(Act I,Scene II)."],
  ["Neither a borrower nor a lender be; For loan oft loses both itself and friend, and borrowing dulls the edge of husbandry", "Hamlet-(Act I,Scene III)."],
  ["Rich gifts wax poor when givers prove unkind", "Hamlet-(Act III,Scene I)."],
  ["That it should come to this!", "Hamlet-(Act I,Scene II)."],
  ["The lady doth protest too much, methinks", "Hamlet-(Act III,Scene II)."],
  ["The plays the thing wherein I'll catch the conscience of the king", "Hamlet-(Act II,Scene II)."],
  ["There is nothing either good or bad, but thinking makes it so", "Hamlet-(Act II,Scene II)."],
  ["This above all: to thine own self be true", "Hamlet-(Act I,Scene III)."],
  ["Though this be madness, yet there is method int.", "Hamlet-(Act II,Scene II)."],
  ["What a piece of work is man! how noble in reason! how infinite in faculty! in form and moving how express and admirable! in action how like an angel! in apprehension how like a god! the beauty of the world, the paragon of animals! ", "Hamlet-(Act II,Scene II)."],
  ["When sorrows come, they come not single spies, but in battalions", "Hamlet-(Act IV,Scene V)."]
]

# Scene I
puts "Scene I"
quotes_array.map! do |quote| 
  description = quote[1].split(/[-(,).]/)
  {:quote => quote[0], :play => description[0], :act => description[2], :scene => description[3]}
end
# Printing to console to check work 
puts "#{quotes_array}\n\n"

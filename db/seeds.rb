# Création de personnes
puts "Creating people..."
person1 = Person.create!(nom: "Dupont", prenom: "Jean", email: "jean.dupont@example.com")
person2 = Person.create!(nom: "Martin", prenom: "Marie", email: "marie.martin@example.com")
person3 = Person.create!(nom: "Bernard", prenom: "Pierre", email: "pierre.bernard@example.com")

# Création de livres (certains disponibles, d'autres empruntés)
puts "Creating books..."
Book.create!(titre: "Le Petit Prince", auteur: "Antoine de Saint-Exupéry", person: person1)
Book.create!(titre: "1984", auteur: "George Orwell", person: person1)
Book.create!(titre: "L'Étranger", auteur: "Albert Camus", person: person2)
Book.create!(titre: "Les Misérables", auteur: "Victor Hugo", person: nil)
Book.create!(titre: "Germinal", auteur: "Émile Zola", person: nil)
Book.create!(titre: "Le Seigneur des Anneaux", auteur: "J.R.R. Tolkien", person: person3)
Book.create!(titre: "Harry Potter à l'école des sorciers", auteur: "J.K. Rowling", person: nil)
Book.create!(titre: "Voyage au centre de la Terre", auteur: "Jules Verne", person: nil)

puts "Seed data created: #{Person.count} people, #{Book.count} books"

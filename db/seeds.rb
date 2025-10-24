# db/seeds.rb
puts "Cleaning database..."
Review.destroy_all
Order.destroy_all
Book.destroy_all
Customer.destroy_all
Author.destroy_all
Supplier.destroy_all

puts "Creating suppliers..."
suppliers = Supplier.create!([
  { name: "Penguin Random House" },
  { name: "HarperCollins" },
  { name: "Simon & Schuster" },
  { name: "Macmillan" },
  { name: "Hachette Book Group" }
])

puts "Creating authors..."
authors = Author.create!([
  { first_name: "Stephen", last_name: "King", title: "Bestselling Author" },
  { first_name: "J.K.", last_name: "Rowling", title: "Award-winning Author" },
  { first_name: "George", last_name: "Martin", title: "Fantasy Writer" },
  { first_name: "Agatha", last_name: "Christie", title: "Mystery Writer" },
  { first_name: "Isaac", last_name: "Asimov", title: "Science Fiction Author" },
  { first_name: "Toni", last_name: "Morrison", title: "Nobel Laureate" }
])

puts "Creating customers..."
customers = Customer.create!([
  { first_name: "John", last_name: "Doe", title: "Mr", email: "john.doe@example.com", visits: 5, order_count: 3, lock_version: 0 },
  { first_name: "Jane", last_name: "Smith", title: "Ms", email: "jane.smith@example.com", visits: 12, order_count: 8, lock_version: 0 },
  { first_name: "Bob", last_name: "Johnson", title: "Mr", email: "bob.johnson@example.com", visits: 3, order_count: 1, lock_version: 0 },
  { first_name: "Alice", last_name: "Brown", title: "Dr", email: "alice.brown@example.com", visits: 8, order_count: 5, lock_version: 0 },
  { first_name: "Charlie", last_name: "Wilson", title: "Mr", email: "charlie.wilson@example.com", visits: 15, order_count: 12, lock_version: 0 }
])

puts "Creating books..."
books = Book.create!([
  # Stephen King books
  { 
    title: "The Shining", 
    year_published: 1977, 
    isbn: "9780385121675", 
    price: 12.99, 
    out_of_print: false, 
    views: 1500,
    supplier: suppliers[0],
    author: authors[0]
  },
  { 
    title: "It", 
    year_published: 1986, 
    isbn: "9780670813025", 
    price: 15.99, 
    out_of_print: false, 
    views: 2800,
    supplier: suppliers[1],
    author: authors[0]
  },
  { 
    title: "The Stand", 
    year_published: 1978, 
    isbn: "9780385199575", 
    price: 18.99, 
    out_of_print: true, 
    views: 900,
    supplier: suppliers[0],
    author: authors[0]
  },
  
  # J.K. Rowling books
  { 
    title: "Harry Potter and the Philosopher's Stone", 
    year_published: 1997, 
    isbn: "9780747532699", 
    price: 22.99, 
    out_of_print: false, 
    views: 5000,
    supplier: suppliers[2],
    author: authors[1]
  },
  { 
    title: "Harry Potter and the Chamber of Secrets", 
    year_published: 1998, 
    isbn: "9780747538493", 
    price: 23.99, 
    out_of_print: false, 
    views: 4200,
    supplier: suppliers[2],
    author: authors[1]
  },
  
  # George Martin books
  { 
    title: "A Game of Thrones", 
    year_published: 1996, 
    isbn: "9780553103540", 
    price: 25.99, 
    out_of_print: false, 
    views: 3800,
    supplier: suppliers[3],
    author: authors[2]
  },
  { 
    title: "A Clash of Kings", 
    year_published: 1998, 
    isbn: "9780553108033", 
    price: 26.99, 
    out_of_print: false, 
    views: 3200,
    supplier: suppliers[3],
    author: authors[2]
  },
  
  # Agatha Christie books
  { 
    title: "Murder on the Orient Express", 
    year_published: 1934, 
    isbn: "9780062693662", 
    price: 9.99, 
    out_of_print: false, 
    views: 1800,
    supplier: suppliers[4],
    author: authors[3]
  },
  { 
    title: "And Then There Were None", 
    year_published: 1939, 
    isbn: "9780062073488", 
    price: 10.99, 
    out_of_print: true, 
    views: 1200,
    supplier: suppliers[4],
    author: authors[3]
  },
  
  # Isaac Asimov books
  { 
    title: "Foundation", 
    year_published: 1951, 
    isbn: "9780553293357", 
    price: 14.99, 
    out_of_print: false, 
    views: 2200,
    supplier: suppliers[1],
    author: authors[4]
  },
  
  # Toni Morrison books
  { 
    title: "Beloved", 
    year_published: 1987, 
    isbn: "9781400033416", 
    price: 16.99, 
    out_of_print: false, 
    views: 1900,
    supplier: suppliers[0],
    author: authors[5]
  }
])

puts "Creating orders..."
orders = Order.create!([
  { 
    date_submitted: Time.parse("2024-01-15 10:30:00"), 
    status: 2, # complete
    subtotal: 45.97, 
    shipping: 5.99, 
    tax: 4.15, 
    total: 56.11,
    customer: customers[0]
  },
  { 
    date_submitted: Time.parse("2024-01-20 14:45:00"), 
    status: 0, # shipped
    subtotal: 68.97, 
    shipping: 7.99, 
    tax: 6.21, 
    total: 83.17,
    customer: customers[1]
  },
  { 
    date_submitted: Time.parse("2024-02-01 09:15:00"), 
    status: 1, # being_packed
    subtotal: 23.99, 
    shipping: 4.99, 
    tax: 2.16, 
    total: 31.14,
    customer: customers[2]
  },
  { 
    date_submitted: Time.parse("2024-02-10 16:20:00"), 
    status: 3, # cancelled
    subtotal: 52.98, 
    shipping: 6.99, 
    tax: 4.77, 
    total: 64.74,
    customer: customers[3]
  },
  { 
    date_submitted: Time.parse("2024-02-15 11:00:00"), 
    status: 2, # complete
    subtotal: 89.95, 
    shipping: 8.99, 
    tax: 8.10, 
    total: 107.04,
    customer: customers[4]
  },
  { 
    date_submitted: Time.parse("2024-02-20 13:30:00"), 
    status: 0, # shipped
    subtotal: 34.98, 
    shipping: 5.99, 
    tax: 3.15, 
    total: 44.12,
    customer: customers[0]
  }
])

puts "Creating reviews..."
reviews = Review.create!([
  # Reviews for Stephen King books
  { title: "Absolutely Terrifying", body: "This book kept me up all night!", rating: 5, state: 1, customer: customers[0], book: books[0] },
  { title: "Masterpiece of Horror", body: "King at his best. The character development is incredible.", rating: 5, state: 1, customer: customers[1], book: books[0] },
  { title: "Scary clown", body: "Pennywise is the stuff of nightmares.", rating: 4, state: 1, customer: customers[2], book: books[1] },
  { title: "Epic story", body: "The scope of this novel is amazing.", rating: 5, state: 1, customer: customers[3], book: books[2] },
  
  # Reviews for Harry Potter books
  { title: "Magical beginning", body: "The start of an incredible journey.", rating: 5, state: 1, customer: customers[4], book: books[3] },
  { title: "Great for kids", body: "My children love this series.", rating: 4, state: 1, customer: customers[0], book: books[3] },
  { title: "Even better than the first", body: "The plot thickens in this excellent sequel.", rating: 5, state: 1, customer: customers[1], book: books[4] },
  
  # Reviews for Game of Thrones
  { title: "Fantasy at its finest", body: "Complex characters and political intrigue.", rating: 5, state: 1, customer: customers[2], book: books[5] },
  { title: "Couldn't put it down", body: "The world-building is incredible.", rating: 4, state: 1, customer: customers[3], book: books[5] },
  { title: "Expands the world", body: "The story gets even more complex and engaging.", rating: 5, state: 1, customer: customers[4], book: books[6] },
  
  # Reviews for Agatha Christie
  { title: "Classic mystery", body: "Poirot at his best. The solution is brilliant.", rating: 5, state: 1, customer: customers[0], book: books[7] },
  { title: "The original thriller", body: "Still holds up after all these years.", rating: 4, state: 1, customer: customers[1], book: books[8] },
  
  # Reviews for Foundation
  { title: "Sci-fi classic", body: "Asimov's vision is still relevant today.", rating: 5, state: 1, customer: customers[2], book: books[9] },
  
  # Reviews for Beloved
  { title: "Powerful and moving", body: "Morrison's prose is breathtaking.", rating: 5, state: 1, customer: customers[3], book: books[10] },
  { title: "Heavy but important", body: "A difficult but necessary read.", rating: 4, state: 0, customer: customers[4], book: books[10] }, # hidden review
  { title: "Not reviewed yet", body: "Haven't finished reading", rating: 0, state: 2, customer: customers[0], book: books[1] } # not_reviewed
])

puts "Seeding completed successfully!"
puts "Created:"
puts "- #{Author.count} authors"
puts "- #{Supplier.count} suppliers"
puts "- #{Customer.count} customers"
puts "- #{Book.count} books"
puts "- #{Order.count} orders"
puts "- #{Review.count} reviews"
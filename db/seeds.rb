john = CareGiver.create(name: "John Brown", email: "johnbrown@jb.com", password: "password")
mary = CareGiver.create(name: "Mary Brown", email: "marybrown@mb.com", password: "password")


john.daily_activities.create(location: "home", description: "It's a fun day!", books: "Jonah starts school today", medication: "none")
mary.daily_activities.create(location: "supermarket", description: "We bought some food together", books: "none", medication: "none")
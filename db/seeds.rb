sarah_brown = CareGiver.create(name: 'Sarah Brown', email: 'sarahbrown@sb.com', password: 'password')
jerry_brown = CareGiver.create(name: 'Jerry Brown', email: 'jerrybrown@jb.com', password: 'password')


sarah_brown.daily_activities.create(location: "home", description: "It's a fun day!", books: "Jonah starts school today", medication: "none")
jerry_brown.daily_activities.create(location: "supermarket", description: "We bought some food together", books: "none", medication: "none")

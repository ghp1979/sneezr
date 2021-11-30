# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ 
  email: "test@test.com",
  password: "tester",
  zip_code_id: 1
}])

symptoms = SymptomReport.create([{
  sneezing: 0,
  congestion: 1,
  runny_nose: 3,
  itchy_nose: 2,
  user_id: 1,
  created_at: Date.new(2021, 11, 24)
},
{
  sneezing: 0,
  congestion: 0,
  runny_nose: 0,
  itchy_nose: 0,
  user_id: 1,
  created_at: Date.new(2021, 11, 25)
},
{
  sneezing: 0,
  congestion: 1,
  runny_nose: 3,
  itchy_nose: 2,
  user_id: 1,
  created_at: Date.new(2021, 11, 26)
},
{
  sneezing: 3,
  congestion: 3,
  runny_nose: 3,
  itchy_nose: 3,
  user_id: 1,
  created_at: Date.new(2021, 11, 27)
},

])

allergens = AllergenReport.create([{
  tree_value: 0,
  tree_category: "Low",
  grass_value: 0,
  grass_category: "Low",
  ragweed_value: 0,
  ragweed_category: "Low",
  mold_value: 0,
  mold_category: "Low",
  dust_dander_value: 0,
  dust_dander_category: "Low",
  created_at: Date.new(2021, 11, 24),
  zip_code_id: 1
},
  {tree_value: 50,
  tree_category: "Moderate",
  grass_value: 50,
  grass_category: "High",
  ragweed_value: 50,
  ragweed_category: "High",
  mold_value: 5000,
  mold_category: "Low",
  dust_dander_value: 3,
  dust_dander_category: "Moderate",
  created_at: Date.new(2021, 11, 25),
  zip_code_id: 1
},
  {tree_value: 1500,
  tree_category: "Very High",
  grass_value: 250,
  grass_category: "Very High",
  ragweed_value: 700,
  ragweed_category: "Extreme",
  mold_value: 5,
  mold_category: "Low",
  dust_dander_value: 5,
  dust_dander_category: "High",
  created_at: Date.new(2021, 11, 26),
  zip_code_id: 1
},
  {tree_value: 50,
  tree_category: "Moderate",
  grass_value: 0,
  grass_category: "Low",
  ragweed_value: 0,
  ragweed_category: "Low",
  mold_value: 0,
  mold_category: "Low",
  dust_dander_value: 0,
  dust_dander_category: "Low",
  created_at: Date.new(2021, 11, 27),
  zip_code_id: 1
},

codes = ZipCode.create([
  { zip_code: "02108" },
  { zip_code: "02109" },
  { zip_code: "02110" },
  { zip_code: "02113" },
  { zip_code: "02114" },
  { zip_code: "02141" },
  { zip_code: "02142" },
  { zip_code: "02138" },
  { zip_code: "02139" },
  { zip_code: "02140" },
  { zip_code: "02143" },
  { zip_code: "02144" },
  { zip_code: "02145" },
  { zip_code: "02210" },
  { zip_code: "02215" },
])
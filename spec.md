# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [ x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
USER has many has_many gardens

PLANT has_many :gardens

- [x ] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
GARDEN belongs to plant
GARDEN belongs to user

- [x ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    USER has_many plants, through: gardens
    PLANT has many user, through gardens

- [x ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    USER has_many plants, through: gardens
    PLANT has many user, through gardens

- [x ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
GARDEN has an address

- [ X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
PLANT validates name , GARDEN validates address, USER validates name and email

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [ x] Include signup (how e.g. Devise)
- [ x] Include login (how e.g. Devise)
- [x ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ x] Include nested resource show or index (URL e.g. users/2/recipes)
users/id/gardens/show

- [x ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
users/id/gardens/new

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
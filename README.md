## Front-End Developer Challenge


**Directions:** Build a calculator, using HTML, CSS, and JavaScript, that takes dimensional inputs and weight from the user and returns the product that matches our products in the DB. For simplicity sake, use the attached json file to manipulate results from a call to our product's API. The calculator, at minimum, should:

1) Live on a single HTML page with a link to "Launch Calclulator'
2) Clicking "Launch Calculator" should open a modal with the calculator
3) Once the user inputs the dimensions and weight and clicks a "Caculate" button
    - The proper product name is shown in the modal "Use this Double Ski Bag" for instance
    - The modal then closes after 5 seconds
    - The product name is displayed on the original HTML page used to launch the calculator


#### Helpful Hints:

- With shipping packages, you can always go bigger, but you can’t go smaller (i.e. if an item is 5”x5”x5", you will need the 6”x5”x6" package, not the 4”x5”x5” package). This is also the case for weight. In terms of interpreting the data, think of dimensions and weight of a product as MAX dimensions and MAX weight.
- The page should be visually appealing as front-end development is consumer facing
- Please don't use any plugins unless they are a robust utility or framework (you're free to use jQuery, Twitter Bootstrap, etc.)


**Creative Bonus:** Make it responsive and match (or improve) the branding on our current site
**JavaScript RockStar Bonus:** Build a Node.js API for the calculator to consume

---
  
## Ruby/Rails Developer Challenge

**Directions:** Build a minimal API, using Rails and MongoDB, for our products (please see attached). The API should be RESTful, serve JSON as the output, and contain the following CRUD functions:

**CREATE**
1. Creates a product

**READ**
1. Shows ALL products
2. Shows ONE product that best matches a given length/width/height/weight query (For example, if I make an API request for a product with the following dimensions: 48”l X 14”w X 12”h (@ 42lbs) the API should send me back “Golf - Small”.)

**UPDATE**
1. Updates a product

**DESTROY**
1. Deletes a product


**Other Requirements:**
- Use proper HTTP error codes
- Validate data
- Create a script to populate the DB with the products.json file
- Provide Minimal API Documentation (a sample request with its parameters will suffice)


**Helpful Hints:**
-With shipping packages, you can always go bigger, but you can’t go smaller (i.e. if an item is 5”x5”x5", you will need the 6”x5”x6" package, not the 4”x5”x5” package). This is also the case for weight. In terms of interpreting the data, think of dimensions and weight of a product as MAX dimensions and MAX weight.



**Full Stack Bonus (optional):** Build a view that consumes the API with JavaScript, and style it using Twitter Bootstrap

---

# Product API Documentation

#### Screenshots: (can be viewed here: https://www.dropbox.com/sh/awzp6k3weh9mvbt/AADT0U2HsCuWKdRrzAa76RCfa?dl=0) 
1. **Home_page:** On home page show a button “ launch calculater”.
2. **Launch_product_popup:** In this show four fileds to calulate(search) the projects.
3. **Show_peoduct:** After click on calculate show products names.
 
 
# Products API
 
### Page 1:  Create product 
**Path:** http://localhost:3000/api/v1/products
**Method:** Post
**Body:**
{
 "products":
   {
     "name": "Small Package",
     "type": "Golf",
     "length": 48,
     "width": 14,
     "height": 12,
     "weight": 42
   }
}
 
#### Response:
 
{
 "success": true,
 "product": [
   {
     "_id": {
       "$oid": "56a60ebe41c4c423ac8fc209"
     },
     "height": null,
     "length": null,
     "name": null,
     "type": null,
     "weight": null,
     "width": null
   },
   {
     "_id": {
       "$oid": "56a60fd841c4c425f801932c"
     },
     "height": 12,
     "length": 48,
     "name": "Small Package",
     "type": "Golf",
     "weight": 42,
     "width": 14
   }
 ]
}
 
 
 
### Page 2:  Update product
**Path:** http://localhost:3000/api/v1/products
**Method:** Get
**Body:**
{"id": { "56a60ebe41c4c423ac8fc209"},
 "products":
   {
     "name": "Small Package",
     "type": "Golf",
     "length": 48,
     "width": 14,
     "height": 12,
     "weight": 42
   }
}
 
#### Response:
 
{
 "success": true,
 "product": [
   {
     "_id": {
       "$oid": "56a60ebe41c4c423ac8fc209"
     },
     "height": null,
     "length": null,
     "name": null,
     "type": null,
     "weight": null,
     "width": null
   },
   {
     "_id": {
       "$oid": "56a60fd841c4c425f801932c"
     },
     "height": 12,
     "length": 48,
     "name": "Small Package",
     "type": "Golf",
     "weight": 42,
     "width": 14
   }
 ]
}
 
 
 
### Page 3:  Destroy product
**Path:** http://localhost:3000/api/v1/products
**Method:** Get
**Body:**
{"id": { "56a60ebe41c4c423ac8fc209"},
}
 
#### Response:
{
 "success": true,
 "product": [
   {
     "_id": {
       "$oid": "56a60ebe41c4c423ac8fc209"
     },
     "height": null,
     "length": null,
     "name": null,
     "type": null,
     "weight": null,
     "width": null
   },
   {
     "_id": {
       "$oid": "56a60fd841c4c425f801932c"
     },
     "height": 12,
     "length": 48,
     "name": "Small Package",
     "type": "Golf",
     "weight": 42,
     "width": 14
   }
 ]
}
 
 
 
### Page 4:  Shows ALL products
**Path:** http://localhost:3000/api/v1/products
**Method:** Get
**Body:**
 
 
#### Response:
{
 "success": true,
 "product": [
   {
     "_id": {
       "$oid": "56a60ebe41c4c423ac8fc209"
     },
     "height": null,
     "length": null,
     "name": null,
     "type": null,
     "weight": null,
     "width": null
   },
   {
     "_id": {
       "$oid": "56a60fd841c4c425f801932c"
     },
     "height": 12,
     "length": 48,
     "name": "Small Package",
     "type": "Golf",
     "weight": 42,
     "width": 14
   }
 ]
}
 
 
 
 
### Page 5:  Shows ONE product that best matches a given length/width/height/weight
**Path:** http://localhost:3000/api/v1/products/search_product
**Method:** Post
**Body:**
{"products": { "height": "",  "length": "48", "width": "14" }   }
 
#### Response:
{
 "success": true,
 "product": [
   {
     "_id": {
       "$oid": "56a60ebe41c4c423ac8fc209"
     },
     "height": null,
     "length": null,
     "name": null,
     "type": null,
     "weight": null,
     "width": null
   },
   {
     "_id": {
       "$oid": "56a60fd841c4c425f801932c"
     },
     "height": 12,
     "length": 48,
     "name": "Small Package",
     "type": "Golf",
     "weight": 42,
     "width": 14
   }
 ]
}

![SINATRA](http://i.imgur.com/OJhqVOh.gif)

## Part 1

### Mad Lib Sick Note!

- Build a route for a Mad Lib application:
    
- It will be in this format: `http://127.0.0.1:4567/first_name/illness/adjective/random_name/place/last_name`

  - Take the path, break it down, storing the words as variables. 

- Insert the words into the mad lib provided: 

    - `'Dear School Nurse:<br>FIRST_NAME will not be attending class today. He/she has come down with a case of ILLNESS and a/an ADJECTIVE fever. We have made an appointment with Dr. RANDOM_NAME, who studied for many years in PLACE, an expert in ILLNESS. He will send you all the information you need. Thank you!<br>Sincerely,<br> Mrs. LAST_NAME'`

**Example:** 

  - Route: `http://localhost:4567/John/spontaneous%20combustion/ugly/Zoidberg/a%20cave/Bell`

  - Should return: `Dear School Nurse:
John will not be attending class today. He/she has come down with a case of spontaneous combustion and a/an crusty fever. We have made an appointment with Dr. Zoidberg, who studied for many years in a cave, an expert in spontaneous combustion. He will send you all the information you need. Thank you!
Sincerely,
Mrs. Bell`


**Bonus:**

- Determine if the ADJECTIVE starts with a vowel. Replace 'a/an' appropriately. 

- Add an different madlib with the same order of words (first_name, illness, adjective, etc.) and have it randomly show that result or the one provided. 


---  

## Part 2

### Calculator! 

- Build a Sinatra application that performs all the basic calculator operations

**Examples of use:**

- Request: `http://127.0.0.1:4567/add/3/5`
  - Response (displayed): `8`

- Request: `http://127.0.0.1:4567/subtract/10/6`
  - Response (displayed): `4`

- Request: `http://127.0.0.1:4567/multiply/11/6`
  - Response (displayed): `66`

- Request: `http://127.0.0.1:4567/divide/12/6`
  - Response (displayed): `2`






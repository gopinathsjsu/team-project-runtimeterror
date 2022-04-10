# Hotel Management Service

##### Running application on Local

- ./gradlew bootRun
- localhost port 8080

#### Service Endpoints

- Auth
    - Signin [POST] `/api/auth/signin`
      ```
      curl --location --request POST 'http://localhost:8080/api/auth/signin' \
      --header 'Content-Type: application/json' \
      --header 'Cookie: JSESSIONID.fc1636b7=node016j5iccopqd51wkaomyxqsdep0.node0' \
      --data-raw '{"username":"qeqwe",  "password":"lolpassword"}'
      ```
    - Signup [POST] `/api/auth/signup`
      ```
      curl --location --request POST 'http://localhost:8080/api/auth/signup' \
      --header 'Content-Type: application/json' \
      --header 'Cookie: JSESSIONID.fc1636b7=node016j5iccopqd51wkaomyxqsdep0.node0' \
      --data-raw '{
      "username":"qeqwe", 
      "email":"asd@mail.com",
      "password":"lolpassword",
      "role":["user"]
      }'
   

- Search
    - GetHotels [GET] `/api/hotel` [ Returns collection of  hotels]
    - GetRooms  [GET] `/api/hotel/{id}/rooms` [ Returns collection of  rooms for  a certain hotel]

- Booking
    - Book room(s) [POST] `/api/booking`
      ```
      curl --location --request POST 'http://localhost:8080/api/booking/calculate' \
      --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTYxMzE2NSwiZXhwIjoxNjQ5Njk5NTY1fQ.ahGSOOKcZjtojnMm8sDIV5U706WWOwIUINKHgC_xB-s9cQL99zrKvq90RqqEB8MV6GVAirwI7oMXV3aeaN9zPQ' \
      --header 'Content-Type: application/json' \
      --header 'Cookie: JSESSIONID.fc1636b7=node016j5iccopqd51wkaomyxqsdep0.node0' \
      --data-raw '[
      {"userId": 1,
      "hotelId": 231466,
      "roomId": 7,
      "checkInDate": "4-10-2022",
      "checkOutDate": "4-10-2022",
      "roomTypeCode": "QN",
      "guestCount": 6
      }]'  
      ```
    - Calculate price [POST] `/api/booking/calculate`
        ```
      curl --location --request POST 'http://localhost:8080/api/booking/calculate' \
      --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTYxMzE2NSwiZXhwIjoxNjQ5Njk5NTY1fQ.ahGSOOKcZjtojnMm8sDIV5U706WWOwIUINKHgC_xB-s9cQL99zrKvq90RqqEB8MV6GVAirwI7oMXV3aeaN9zPQ' \
      --header 'Content-Type: application/json' \
      --header 'Cookie: JSESSIONID.fc1636b7=node016j5iccopqd51wkaomyxqsdep0.node0' \
      --data-raw '[
      {"userId": 1,
      "hotelId": 231466,
      "roomId": 7,
      "checkInDate": "4-10-2022",
      "checkOutDate": "4-10-2022",
      "roomTypeCode": "QN",
      "guestCount": 6
      }]'  
      ```

#### Technologies

- Spring Boot (JPA, Web)
- Spring Framework
- MySQL
- Gradle

#### References

##### Authentication/ Authorization/ Signup /JWT security

- https://www.bezkoder.com/spring-boot-jwt-authentication/

#### Run




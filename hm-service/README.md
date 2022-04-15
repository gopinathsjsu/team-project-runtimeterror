# Hotel Management Service

##### Running application on Local

- ./gradlew bootRun
- localhost port 8080

#### Service Endpoints

- User
  - Signin [POST] `/api/auth/signin`
    ```shell
    curl --location --request POST 'http://localhost:8080/api/auth/signin' \
    --header 'Content-Type: application/json' \
    --header 'Cookie: JSESSIONID.fc1636b7=node016j5iccopqd51wkaomyxqsdep0.node0' \
    --data-raw '{"username":"qeqwe",  "password":"lolpassword"}'
    ```
    
  - Signup [POST] `/api/auth/signup`
    ```shell
    curl --location --request POST 'http://localhost:8080/api/auth/signup' \
    --header 'Content-Type: application/json' \
    --header 'Cookie: JSESSIONID.fc1636b7=node016j5iccopqd51wkaomyxqsdep0.node0' \
    --data-raw '{
    "username":"qeqwe",
    "email":"asd@mail.com",
    "password":"lolpassword",
    "role":["user"]
    }'
    ```
  - GetUser [GET] `/api/user/{id}`
    ```shell
    curl --location --request GET 'http://localhost:8080/api/user/2' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTkxNzg0NiwiZXhwIjoxNjUwMDA0MjQ2fQ.2iN-zs_HfQ1crFjBYge1L2aMQvLfXk67XE4Z_qMPjD2alEQwn5iNORP2UDaVt4wLLsh8Pm7SW_OrD6LUtAG41g'
    ```
  - Update User [PUT] `api/user/{id}`
    ```shell
    curl --location --request PUT 'http://localhost:8080/api/user/1' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huIiwiaWF0IjoxNjQ5OTcyMzU1LCJleHAiOjE2NTAwNTg3NTV9.qBsvLJueQS6yIBFE3SAYZ8B9qVrQPzEOKuvmVGV0P3ucGcVc-GuzQrzS4YmXp2PRX62IP2PMAJfa2tv2zNeb_w' \
    --header 'Content-Type: application/json' \
    --data-raw '{
    "username": "john",
    "email": "asd21@mail.com",
    "phone": "1234561"
    }'
    ```
  - DeActivate User [DELETE] `api/user/{id}`
    ```shell
    curl --location --request DELETE 'http://localhost:8080/api/user/1' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTkxNzg0NiwiZXhwIjoxNjUwMDA0MjQ2fQ.2iN-zs_HfQ1crFjBYge1L2aMQvLfXk67XE4Z_qMPjD2alEQwn5iNORP2UDaVt4wLLsh8Pm7SW_OrD6LUtAG41g'
    ```
- Search
  - GetHotels [GET] `/api/hotel` [ Returns collection of hotels]
  - GetRooms [GET] `/api/hotel/{id}/rooms` [ Returns collection of rooms for a certain hotel]
  - GetAmenities [GET] `/api/hotel/{id}/amenities`
    ```
    curl --location --request GET 'localhost:8080/api/hotel/231466/amenities'
    ```

  - Booking
      - Book room(s) [POST] `/api/booking`
    
      ```curl --location --request POST     'http://localhost:8080/api/booking/calculate' \
          --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTkxNzg0NiwiZXhwIjoxNjUwMDA0MjQ2fQ.2iN-zs_HfQ1crFjBYge1L2aMQvLfXk67XE4Z_qMPjD2alEQwn5iNORP2UDaVt4wLLsh8Pm7SW_OrD6LUtAG41g' \
          --header 'Content-Type: application/json' \
          --data-raw '{
              "userId": 1,
              "hotelId": 231466,
              "roomId": 7,
              "checkInDate": "4/18/2022",
              "checkOutDate": "4/28/2022",
              "roomTypeCode": "QN",
              "guestCount": 3,
              "roomCount": 2,
              "amenities": [
                  {
                    
                      "amenityCode": "PR",
                      "count": 1
                  },
                  {
                   
                      "amenityCode": "FR",
                      "count": 2
                  }
              ]
          }'
      ```
      - Calculate price [POST] `/api/booking/calculate`

      ```
          curl --location --request POST 'http://localhost:8080/api/booking/calculate' \
          --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTkxNzg0NiwiZXhwIjoxNjUwMDA0MjQ2fQ.2iN-zs_HfQ1crFjBYge1L2aMQvLfXk67XE4Z_qMPjD2alEQwn5iNORP2UDaVt4wLLsh8Pm7SW_OrD6LUtAG41g' \
          --header 'Content-Type: application/json' \
          --data-raw '{
              "userId": 1,
              "hotelId": 231466,
              "roomId": 7,
              "checkInDate": "4/18/2022",
              "checkOutDate": "4/28/2022",
              "roomTypeCode": "QN",
              "guestCount": 3,
              "roomCount": 2,
              "amenities": [
                  {
                      "amenityCode": "PR",
                      "count": 1
                  },
                  {
                      "amenityCode": "FR",
                      "count": 2
                  }
              ]
          }'
      ```
    
      - GetBooking By ID [GET] `/api/booking/{id}`
       ```
              curl --location --request GET 'http://localhost:8080/api/booking/getbookingbyuserid/1' \
              --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTYxMzE2NSwiZXhwIjoxNjQ5Njk5NTY1fQ.ahGSOOKcZjtojnMm8sDIV5U706WWOwIUINKHgC_xB-s9cQL99zrKvq90RqqEB8MV6GVAirwI7oMXV3aeaN9zPQ'
      ```
    
      - GetBooking(s) By UserID [GET] `/api/booking/getbookingbyuserid/{id}`
      ```
      curl --location --request GET 'http://localhost:8080/api/booking/1' \
      --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTYxMzE2NSwiZXhwIjoxNjQ5Njk5NTY1fQ.ahGSOOKcZjtojnMm8sDIV5U706WWOwIUINKHgC_xB-s9cQL99zrKvq90RqqEB8MV6GVAirwI7oMXV3aeaN9zPQ'
      ```
    
     - Update Booking [PUT]
        ```shell
       curl --location --request PUT 'http://localhost:8080/api/booking/50' \
       --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huIiwiaWF0IjoxNjQ5OTc5ODk5LCJleHAiOjE2NTAwNjYyOTl9.-Du8aM4Z_DDCO15w71mROhDovDbCjlqW2R2ectQJPDX_f_kcMImKSB84f76JOd0ITsERQVzgu8MP8lNjDmoIZQ' \
       --header 'Content-Type: application/json' \
       --data-raw '{
       "userId": 1,
       "hotelId": 231466,
       "roomId": 8,
       "checkInDate": "4/18/2022",
       "checkOutDate": "4/28/2022",
       "roomTypeCode": "QN",
       "guestCount": 2,
       "roomCount":5,
       "amenities": [
       {
       "hotelAmenityId": 2,
       "amenityCode": "PR",
       "count": 2
       },
       {
       "hotelAmenityId": 3,
       "amenityCode": "FR",
       "count": 2
       }
       ]
       }'
       ```
     - Delete Booking
     - ```shell
       curl --location --request DELETE 'http://localhost:8080/api/booking/51' \
       --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huIiwiaWF0IjoxNjQ5OTc5ODk5LCJleHAiOjE2NTAwNjYyOTl9.-Du8aM4Z_DDCO15w71mROhDovDbCjlqW2R2ectQJPDX_f_kcMImKSB84f76JOd0ITsERQVzgu8MP8lNjDmoIZQ' \
       --data-raw ''
```
- Admin
  - GET Pricing strategies
    ```
    curl --location --request GET 'http://localhost:8080/api/admin/pricingstrategy' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTkxNzg0NiwiZXhwIjoxNjUwMDA0MjQ2fQ.2iN-zs_HfQ1crFjBYge1L2aMQvLfXk67XE4Z_qMPjD2alEQwn5iNORP2UDaVt4wLLsh8Pm7SW_OrD6LUtAG41g'
    ```
    
  - Update Pricing strategy
    ```
    curl --location --request PUT 'http://localhost:8080/api/admin/pricingstrategy' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJxZXF3ZSIsImlhdCI6MTY0OTkxNzg0NiwiZXhwIjoxNjUwMDA0MjQ2fQ.2iN-zs_HfQ1crFjBYge1L2aMQvLfXk67XE4Z_qMPjD2alEQwn5iNORP2UDaVt4wLLsh8Pm7SW_OrD6LUtAG41g' \
    --header 'Content-Type: application/json' \
    --data-raw '[
      {
      "id": 1,
      "strategyName": "DYNAMIC PRICING",
      "shortCode": "DYN",
      "enabled": false
      },
      {
      "id": 2,
      "strategyName": "HOLIDAY",
      "shortCode": "HOL",
      "enabled": false
      },
      {
      "id": 3,
      "strategyName": "RANDOM",
      "shortCode": "RAN",
      "enabled": false
      }
      ]'
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


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
#### Technologies

- Spring Boot (JPA, Web)
- Spring Framework
- MySQL
- Gradle

#### References

##### Authentication/ Authorization/ Signup /JWT security

- https://www.bezkoder.com/spring-boot-jwt-authentication/

#### Run


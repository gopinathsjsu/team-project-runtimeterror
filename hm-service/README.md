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
   

- Search Domain

    - GetHotels [GET] `/api/hotel` [ Returns collection of  hotels]
    - GetRooms  [GET] `/api/hotel/{id}/rooms` [ Returns collection of  rooms for  a certain hotel]

- Booking
    - [POST] /hotel/booking

#### Technologies

- Spring Boot (JPA, Web)
- Spring Framework
- MySQL
- Gradle

#### References

##### Authentication/ Authorization/ Signup /JWT security

- https://www.bezkoder.com/spring-boot-jwt-authentication/

#### Run




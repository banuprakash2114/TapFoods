<h2>Project Title:TapFoods</h2>

<h2>Project Description</h2>

The TapFoods is a web-based application designed to simplify and enhance the food ordering experience for customers.
This system is developed using Java, JSP, Servlets, and JDBC, and follows the MVC (Model-View-Controller) design pattern to ensure a 
clean separation of concerns, making the application scalable, maintainable, and easy to manage.

<h2>Technology Stack</h2>

<h3>Frontend</h3>

JSP (JavaServer Pages): Used for building dynamic web pages that interact with users, displaying restaurant listings, menus, carts, order history, etc.
CSS & JavaScript: Applied for styling and enhancing the user interface with responsive and interactive elements.

<h3>Backend</h3>

->Java Servlets: Act as controllers in the MVC architecture, handling requests from the client, processing them, and returning the appropriate response.

->JDBC (Java Database Connectivity): Used for interacting with the database to perform CRUD (Create, Read, Update, Delete) operations, such as managing users, restaurants, menu items, and orders.

->DAO Pattern: The Data Access Object (DAO) pattern is implemented to abstract and encapsulate all access to the data source, making the codebase cleaner and easier to manage.

<h3>Database</h3>

MySQL (or any relational database): Stores user data, restaurant information, menus, orders, and other relevant data. 
The database schema is designed to efficiently manage and relate these entities.

<h3>MVC Architecture</h3>

Model: Represents the data and business logic of the application. The Cart, Order, User, and Restaurant classes are examples of models that represent the application's data structure.

View: JSP pages serve as the view components, rendering the data provided by the model in a user-friendly format. These views are responsible for displaying restaurant details, menu items, cart contents, and more.

Controller: Servlets act as controllers, handling incoming requests, interacting with the model to process data, and forwarding the results to the appropriate JSP page. Controllers ensure the separation of concerns by delegating the data handling to the model and presentation to the view.

<h3>Login Page</h3>

The login page is built using JSP for the front-end, where users enter their email and password. Java Servlets handle the backend, validating the credentials against a MySQL database using JDBC. The project follows the MVC design pattern, ensuring a clean separation between the user interface, business logic, and data management.

![Screenshot 2024-09-01 225342](https://github.com/user-attachments/assets/4b31cc8c-f6ce-4429-9e3e-ea5cc88f21ee)

<h3>Register Page</h3>
The register page is created using JSP for the user interface, allowing new users to input their details like name, email, password, and address. Java Servlets process the registration data, storing it securely in a MySQL database using JDBC.
![Screenshot 2024-09-01 231208](https://github.com/user-attachments/assets/2bf28508-4715-484c-be64-6537214cf037)

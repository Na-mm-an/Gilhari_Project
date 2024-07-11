# Gilhari_Project // Sourse Database is MYSQL
Steps to Setup
1. Directory Structure
Ensure your project directory structure is set up as follows:
project-root/
│
├── sourcedb/
│   ├── config/
│   │   ├── gilhari5_source_mysql_local.config   // ORM configuration file
│   │   └── <JDBC driver files>                  // Place JDBC driver files here
│   ├── src/
│      └── com/
│          └── mycompany/
│              └── gilhari5/
│                  └──.java  files            // Java class file example
│   
├── Dockerfile                                   // Docker configuration file
└── README.md                                    // This README file
2. Configuration
Edit gilhari5_source_mysql_local.config and .jdx files in sourcedb/config/ to define ORM specifications.
Ensure JDBC driver for your database is placed in sourcedb/config/.
3.Compilation
Run the compilation script to compile Java files.
4.Dockerization
Create a Dockerfile in your project root directory
5. Testing and API Interaction
Confirm Gilhari is listening at localhost:8082.
Use curl commands (curlPopulate and curlStreamData) in a separate terminal window to interact with Gilhari.
Optionally, use Postman for REST API calls based on the Gilhari API manual provided with the SDK.


# AutomationProject 
# Overview
This project aims to automate the testing of Web Application using the Robot Framework, a keyword-driven test automation framework.
By leveraging the Robot Framework's simplicity and flexibility, we can create robust and maintainable test suites to ensure the quality and reliability of our software.

# Prerequisites
Before running the automated tests, ensure that the following prerequisites are met:

- Python is installed on your system. You can download Python from python.org.
- Install Robot Framework and any required libraries using pip:
- bash
- Copy code
- pip install robotframework
- pip install robotframework-seleniumlibrary  
- pip install robotframework-requests

# Getting Started
To get started with running the automated tests, follow these steps:

Clone this repository to your local machine:
bash
Copy code
git clone https://github.com/Heba13/RobotFramework

Execute the test suite using the robot command:
bash
Copy code
robot  ShopTest/shop.robot  

Monitor the test execution in the console. Upon completion, a detailed test report will be generated in HTML format, located in the results directory.
Folder Structure
RobotFramework/ShopTest/shop.robot:Contains the implementation for variable and Scenarios written in python.
robot ShopTest/resources/pages : Contains pages of web APP


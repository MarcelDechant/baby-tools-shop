# Baby Tools E-commerce Project 🛒

This project demonstrates a fully functional e-commerce application developed with Django to manage and display baby products. Below is a comprehensive guide to setting up, running, and deploying the project using Docker.

[Show Checklist](checklist_update.pdf)

## Table of Contents 

1. [Technologies](#technologies) 
2. [Quickstart](#quickstart)
3. [Hints](#hints)  
4. [Photos](#photos)  
5. [Usage Section](#usage-section)  
   - [Step 1: Clone repository](#step-1-clone-repository)  
   - [Step 2: Navigate into the project directory](#step-2-navigate-into-the-project-directory)  
   - [Step 3: Create a Virtual Environment](#step-3-create-a-virtual-environment)  
   - [Step 4: Install Dependencies](#step-4-install-dependencies)  
   - [Step 5: Set Up Environment Variables](#step-5-set-up-environment-variables)  
   - [Step 6: Apply Database Migrations](#step-6-apply-database-migrations)  
   - [Step 7 (Optional): Create a Superuser](#step-7-optional-create-a-superuser)  
   - [Step 8: Start the Development Server](#step-8-start-the-development-server)  
6. [Deploy with Docker](#deploy-with-docker)  
   - [Step 9: Build the Docker Image](#step-9-build-the-docker-image)  
   - [Step 10: Run the Docker Container](#step-10-run-the-docker-container)  
   - [Step 11: Verify the Deployment](#step-11-verify-the-deployment)  
7. [Project Structure](#project-structure)  
8. [Configuration and Important Rules](#️-configuration-and-important-rules)  
   - [Key Configuration Files](#key-configuration-files)  
   - [Important Points](#important-points)  
9. [License](#license)  

## TECHNOLOGIES

- **Python 3.11**
- **Django 4.0.2**
- **Venv**
- **Git**  
- **Docker** 


## Quickstart 
Follow these steps to quickly set up and run the project:
1. Clone the repository:
First, clone the repository to your local machine:
``` bash
git clone https://github.com/MarcelDechant/baby-tools-shop
cd baby-tools-shop  # Navigate into the project directory
```

2. Create the .env file
Create a .env file based on the .envtemplate and adjust it as needed.


3. Build and start the Docker container
Run the following commands to build and deploy the project inside a Docker container:
``` bash
docker build -t baby-tools-shop .
docker run -d -p 8025:8025 --name baby-tools-container baby-tools-shop
```

4. Access the application:
Open your browser and visit:
Visit `http://<YOUR_IP_ADRESS>:8025` in your browser.

5. Create a Django Admin User (Optional):
``` bash
docker exec -it <CONTAINER_ID> /bin/bash
python manage.py createsuperuser
```


### Hints

- **Settings & Configuration**: Found in `babyshop_app/babyshop/settings.py`.  
- **Routing**: Check `urls.py` files in `babyshop` directorie.

### Photos

##### Home Page with login

<img alt="" src="project_images/capture_20220323080815407.jpg"></img>
##### Home Page with filter
<img alt="" src="project_images/capture_20220323080840305.jpg"></img>
##### Product Detail Page
<img alt="" src="project_images/capture_20220323080934541.jpg"></img>

##### Home Page with no login
<img alt="" src="project_images/capture_20220323080953570.jpg"></img>


##### Register Page

<img alt="" src="project_images/capture_20220323081016022.jpg"></img>


##### Login Page

<img alt="" src="project_images/capture_20220323081044867.jpg"></img>


## Usage Section

### Step 1: Clone repository
Change to the desired directory on the server and clone your Git repository:
```bash
git clone https://github.com/MarcelDechant/baby-tools-shop
```

### Step 2: Navigate into the project directory
```bash
cd baby-tools-shop
```
### Step 3: Create a Virtual Environment
To keep dependencies organized, create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On macOS/Linux
venv\Scripts\activate     # On Windows
```
### Step 4: Install Dependencies
Once the virtual environment is activated, install the required packages:
```bash
pip install -r requirements.txt
```
### Step 5: Set Up Environment Variables
Create a .env file based on the provided .envtemplate and adjust the settings as needed.
```bash
cp .envtemplate .env  # For macOS/Linux
copy .envtemplate .env  # For Windows
```
Then, open the .env file and update any necessary values.

### Step 6: Apply Database Migrations
Django uses migrations to set up the database schema. Run the following commands to apply all migrations:
```bash
python manage.py migrate
```

### Step 7 (Optional): Create a Superuser
If you want to access the Django admin panel, create a superuser:
```bash
python manage.py createsuperuser
```
Follow the prompts to set up a username, email, and password.

### Step 8: Start the Development Server
Now you can run the local development server:
```bash
python manage.py runserver
```
The application will be available at:
```bash
http://127.0.0.1:8025
```
## Deploy with Docker 🐳
The project includes a Dockerfile to containerize the application. Follow these steps to build and run the Docker container.
### Step 9: Build the Docker Image
Make sure you're in the project root directory and run:
```bash
docker build -t baby-tools-shop .
```
This will create a Docker image named baby-tools-shop.

### Step 10: Run the Docker Container
Start the container using:
```bash
docker run -d -p 8025:8025 --name baby-tools-container baby-tools-shop
```
- The -d flag runs the container in the background.
- The -p 8025:8025 maps the container port to the host machine.
- The --name baby-tools-container assigns a name to the running container.

### Step 11: Verify the Deployment
Once the container is running, access the application in your browser:
```bash
http://<YOUR_IP_ADDRESS>:8025
```
To check if the container is running, use:
```bash
docker ps
```
If needed, view the container logs with:
```bash
docker logs baby-tools-container
```

##  Project Structure
``` bash
baby-tools-shop/
├── babyshop_app/
│   ├── babyshop/
│   │   ├── settings.py
│   │   └── urls.py
│   └── manage.py
├── requirements.txt
├── Dockerfile
└── README.md
```

##  Configuration and important rules
#### Key configuration files:

- `babyshop_app/babyshop/settings.py`: Main Django settings
- `requirements`.txt: Python dependencies
- `Dockerfile`: Docker configuration

#### Important Points
- **Containerization**: The Docker image makes the application portable and consistent across all environments.

- **Port Configuration:** The specification `0.0.0.0:8025` and Docker port mapping are crucial for external access.



##  License
This project is licensed under the MIT License - see the [LICENSE](/baby-tools-shop/LICENSE) file for details.

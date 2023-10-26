# DevOps Deployment Automation with Terraform, AWS and Docker - Starter Code

This project contains the starter code for our course: [DevOps Deployment Automation with Terraform, AWS and Docker](https://londonapp.dev/c3).

It contains the code you should have by the end of our [Build a Backend REST API with Python & Django REST Framework - Advanced](https://londonapp.dev/c2) course. We've created this snapshot, in-case we update the aforementioned course in the future.

## Local Development

### Running Project

This project runs using Docker. It should work consistently on Windows, macOS or Linux machines.

Follow the below steps to run a local development environment.

1.  Ensure you have the following installed:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

2.  Clone the project, `cd` to it in Terminal/Command Prompt and run the following:

```sh
docker compose up
```

3.  Browse the project at [http://127.0.0.1:8000/api/health-check/](http://127.0.0.1:8000/api/health-check/)

### Creating Superuser

To create a superuser to access the Django admin follow these steps.

1.  Run the below command and follow the in terminal instructions:

```sh
docker compose run --rm app sh -c "python manage.py createsuperuser"
```

2.  Browse the Django admin at [http://127.0.0.1:8000/admin] and login.

### Clearing Storage

To clear all storage (including the database) and start fresh:

```sh
docker compose down --volumes
docker compose up
```

## Other courses

Check out our courses on [londonappdeveloper.com](https://londonappdeveloper.com).

Or find them below:

- [Python for Absolute Beginners](https://londonapp.dev/c4)
- [Build a Backend REST API with Python & Django REST Framework - Beginner](https://londonapp.dev/c1)
- [Build a Backend REST API with Python & Django REST Framework - Advanced](https://londonapp.dev/c2)
- [Deploy a Serverless Django App on Google App Engine](https://londonapp.dev/c5)

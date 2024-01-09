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

## Course Documentation

This section contains supplementary documentation for the course steps.

### Terraform Commands

Below is a list of how to run the common commands via Docker Compose.

> Note: The below commands should be run from ther `infra/` directory of the project, and after authenticating with `aws-vault`.

To run any Terraform command through Docker, use the syntax below:

```
docker compose run --rm terraform -chdir=TF_DIR COMMAND
```

Where `TF_DIR` is the directory containing the Terraform (`setup` or `deploy`) and `COMMAND` is the Terraform command (e.g. `plan`).

#### Get outputs from the setup Terraform

```
docker compose run --rm terraform -chdir=setup output
```

The output name must be specified if `sensitive = true` in the output definition, like this:

```
docker compose run --rm terraform -chdir=setup output cd_user_access_key_secret
```

### GitHub Actions Variables

This section lists the GitHub Actions variables which need to be configured on the GitHub project.

> Note: This is only applicable if using GitHub Actions, if you're using GitLab, see [GitLab CI/CD Variables](#gitlab-cicd-variables) below.

If using GitHub Actions, variables are set as either **Variables** (clear text and readable) or **Secrets** (values hidden in logs).

Variables:

 * `AWS_ACCESS_KEY_ID`: Access key for the CD AWS IAM user that is created by Terraform and output as `cd_user_access_key_id`.
 * `AWS_ACCOUNT_ID`: AWS Account ID taken from AWS directly.
 * `DOCKERHUB_USER`: Username for [Docker Hub](https://hub.docker.com/) for avoiding Docker Pull rate limit issues.
 * `ECR_REPO_APP`: URL for the Docker repo containing the app image output by Terraform as `ecr_repo_app`.
 * `ECR_REPO_PROXY`: URL for the Docker repo containing the proxy image output by Terraform as `ecr_repo_proxy`.

Secrets:

 * `AWS_SECRET_ACCESS_KEY`: Secret key for `AWS_ACCESS_KEY_ID` set in variables, output by Terraform as `cd_user_access_key_secret`.
 * `DOCKERHUB_TOKEN`: Token created in `DOCKERHUB_USER` in [Docker Hub](https://hub.docker.com/).
 * `TF_VAR_DB_PASSWORD`: Password for the RDS database (make something up).
 * `TF_VAR_DJANGO_SECRET_KEY`: Secret key for the Django app (make something up).

### GitLab CI/CD Variables

## Other courses

Check out our courses on [londonappdeveloper.com](https://londonappdeveloper.com).

Or find them below:

- [Python for Absolute Beginners](https://londonapp.dev/c4)
- [Build a Backend REST API with Python & Django REST Framework - Beginner](https://londonapp.dev/c1)
- [Build a Backend REST API with Python & Django REST Framework - Advanced](https://londonapp.dev/c2)
- [Deploy a Serverless Django App on Google App Engine](https://londonapp.dev/c5)

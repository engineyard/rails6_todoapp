# Rails 6 TodoApp

Simple containerized todo app

### Technologies:
- Rails 6.1.4.1
- Webpacker
- ActionCable with Hotwire

### Deployment to EYK:
1. Clone the repo
2. Setup EYK Cluster and login using [EYK CLI](https://support.cloud.engineyard.com/hc/en-us/articles/360057913834-Download-the-Kontainers-CLI-Tool)
3. cd the the repo, and run `eyk create <app_name>`
4. `eyk push`
5. Add CONFIG_HOST environment variable as "<app_name>.<cluster_name>.<account_name>.ey.io" via the GUI
6. Create Postgres Database & Cache
7. Setup DATABASE_URL, DATABASE_PASSWORD, DATABASE_USERNAME, and REDIS_URL env variables
8. Visit the app url, open the page with 2 browsers and observe the live rendering upon CRUD actions :)
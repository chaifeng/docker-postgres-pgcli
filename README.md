# pgcli inside docker

This docker image is a PostgreSQL client which is provided by pgcli

## Usage

### Just run it

    docker run -it chaifeng/pgcli
    
    docker run -it chaifeng/pgcli --version
    
    docker run -it chaifeng/pgcli -h postgresserver -u user

### Connect to a Postgres server

    docker run -it --name pgcli \
           -e POSTGRES_DATABASE=your-dbname \
           -e POSTGRES_HOST=your-postgres-container \
           -e POSTGRES_USER=your-postgres-username \
           -e POSTGRES_PASSWORD="your-postgres-password" \
           --network your-network \
           chaifeng/pgcli

## Optional Variables

- `POSTGRES_HOST`
  the host/ip of your postgres database
- `POSTGRES_USER`
  the username of your postgres database
- `POSTGRES_PASSWORD`
  the password of your postgres database
- `POSTGRES_DB`
  the database to use

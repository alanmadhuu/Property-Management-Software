# Property Management System (PMS)

This repository contains a legacy Property Management System built using CodeIgniter 2.x and PHP 5.6. The codebase has been fully containerized with Docker to ensure smooth local development and deployment on modern machines (including Apple Silicon Macs).

## Features

- **Dashboard**: High-level overview of properties, active projects, and vacant units.
- **Property & Unit Management**: Add and manage various properties (Apartments, Commercial, Single Family, etc.) and individual units.
- **Lease & Tenant Management**: Handle rental applications, track active leases, move-in/move-out dates, and rent amounts.
- **Work Orders**: Create and track work orders and maintenance logs for specific properties.
- **Accounting**: Track ledgers and payments.
- **Reporting**: Generate graphical and cash flow reports.

*(Note: This application was built by repurposing a Hospital Management System template. All legacy hospital code and database tables have been stripped out to provide a clean PMS experience).*

## Prerequisites

To run this application locally, you only need to have Docker installed:
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes Docker Compose)

## Running the Application Locally

The entire application environment (PHP 5.6, Apache, MySQL 5.7) is containerized and pre-configured.

1. **Start the environment**:
   Open your terminal, navigate to the root directory of this project, and run:
   ```bash
   docker compose up -d --build
   ```

2. **Access the application**:
   Once the containers are running, the application will be available at:
   [http://localhost:8080](http://localhost:8080)

3. **Log in**:
   The database schema is automatically initialized and seeded with a default administrator account. You can log in using:
   - **Account Type**: Admin
   - **Email**: `admin@admin.com`
   - **Password**: `admin`

## Database & Fake Data

The repository includes a `pms_schema.sql` file which contains the full database structure for the Property Management System. 

During the initial `docker compose up`, this schema is automatically injected into the MySQL container. The database has also been populated with hundreds of rows of fake data (landlords, properties, tenants, work orders, etc.) for demonstration and testing purposes.

## Stopping the Application

To stop the Docker containers when you are finished, run:
```bash
docker compose down
```

## Known Issues
- **Missing Module**: The "Accounts Module -> Cash Book" link in the sidebar was tied to an external module (`accounting/scb_mod/`) that was not included in the original source code. This navigation link has been temporarily disabled.
- **Legacy Framework**: The application runs on CodeIgniter 2.x and PHP 5.6, meaning it relies on older, deprecated PHP methods (like `mysql_*` functions). The Docker environment isolates this, but caution is advised if deploying to a production server without migrating to `mysqli` or `PDO` first.
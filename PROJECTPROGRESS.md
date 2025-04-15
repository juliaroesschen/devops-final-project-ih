# Day 1 – Local Setup & Integration Testing

## Changes Made

### Backend Environment Variables
- **MongoDB Connection String:**  
  - **Before:**  
    `mongodb://root:example@mongo:27017/expensy`
  - **After:**  
    `mongodb://root:example@localhost:27017/expensy?authSource=admin`  
    This change ensures that the backend resolves MongoDB on `localhost` rather than `mongo`, and the added `?authSource=admin` ensures that authentication checks against the admin database where the root user was created by the MongoDB container.

### Integration Testing
- **MongoDB:**  
  - Verified that the backend connects successfully to MongoDB.
- **Redis:**  
  - Confirmed connectivity by pinging Redis (receiving `PONG` from `redis-cli`).
- **Frontend:**  
  - Ran the frontend and tested the complete flow by adding an expense, verifying that the integration between frontend and backend works as expected.

## Rationale
- **Accurate Database Resolution:**  
  Updating the connection string to `localhost` ensures that the MongoDB instance running in a Docker container is correctly reached from the backend.
- **Proper Authentication:**  
  Adding `?authSource=admin` guarantees that the authentication happens against the correct database (admin), where the credentials were set up during container initialization.
- **Reliable Integration:**  
  Successful connections to both MongoDB and Redis, along with a working frontend that can add an expense, confirm that our local development environment is fully integrated and functional.

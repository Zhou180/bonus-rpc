# Build the server image
docker build -t bonus_server_x86 -f Dockerfile.server .

# Build the client image
docker build -t bonus_client_x86 -f Dockerfile.client .


# Run the server container
docker run -d --name bonus_server_container bonus_server_x86

# Run the client container
docker run -d --name bonus_client_container bonus_client_x86


# Create the network
docker network create <network_name>

# Connect the server container to the network
docker network connect <network_name> <server_container_name>

# Connect the client container to the network
docker network connect <network_name> <client_container_name>


docker exec -it <client_container_name> python3 client.py -t testcase
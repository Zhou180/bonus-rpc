# Build the server image
docker build -t bonus_server_arm -f Dockerfile.server .

# Build the client image
docker build -t bonus_client_arm -f Dockerfile.client .

# Run the server container
docker run -d --name bonus_server_container --network host bonus_server_arm

# Run the client container
docker run -d -it --name bonus_client_container --network host bonus_client_arm

# Create the network
# docker network create -d bridge rpc-bridge-network

# Connect the server container to the network
# docker network connect rpc-bridge-network bonus_server_container

# Connect the client container to the network
# docker network connect rpc-bridge-network bonus_client_container

docker exec bonus_client_container python3 client.py 
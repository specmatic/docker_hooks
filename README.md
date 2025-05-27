# Build Docker Image
```shell
docker build -t specmatic_hooks:latest .
```

# Start Stub Server
```shell
docker run --network=host -it -v "$PWD/openapi.yaml:/usr/src/app/openapi.yaml" specmatic_hooks stub openapi.yaml
```

# Run Contract Test
```shell
docker run --network=host -it -v "$PWD/openapi.yaml:/usr/src/app/openapi.yaml" specmatic_hooks test openapi.yaml
```
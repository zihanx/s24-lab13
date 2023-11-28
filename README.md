# Lab 12

## Changes compared to Lab 7

Instead of the development setup with the frontend on port 3000 and a proxy to the backend on port 8080, this implementation now runs the entire code from the backend on port 8080. Similar to HW5, the backend serves the compiled React code from the frontend at `/` and responds to API requests at `/api` addresses on the server.

This is done by `App.java` inherenting from `SimpleWebServer` rather than `NanoHTTPD`, where `SimpleWebServer` already implements how to serve static files from a directory (directory configured through the constructor call). We now overwrite the `serve` function to respond to the `/api` calls but delegate all other addresses to the superclass. The frontend code needs to be relative to the backend code at `../front-end/build`.

The frontend is changed only minimally to expect the API at address `/api`.


## Deployment as fat jar file

We use the `maven-assembly-plugin` plugin for maven to package the Java code with all dependencies into a single jar file when `mvn package` is called. The file can be found in `target/back-end-1.0-SNAPSHOT-jar-with-dependencies.jar`. With the extra declaration of the main class in the pom file `configuration/archive/maifest/mainClass` it is now possible to run the compiled Java code simply with `java -jar target/back-end-1.0-SNAPSHOT-jar-with-dependencies.jar`.

## Building everything

Build the frontend and the backend, then package them with Docker.

```sh
cd back-end
mvn package
cd ../front-end
npm install
npm run build
cd ..
docker build -t lab12 --platform linux/amd64 .
```

You can run the container with `docker run -p 8080:8080 lab12` and should be able to see the server starting on the command line and be able to access it at `http://localhost:8080`.

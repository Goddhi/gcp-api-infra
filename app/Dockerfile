# Stage 1: Build the Go binary
FROM golang:1.23.0-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files and download dependencies
COPY go.mod ./
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -o time-app .

# Stage 2: Use Alpine as the final image
FROM alpine:latest

# Install timezone data
RUN apk add --no-cache tzdata

# Copy the binary from the builder stage
COPY --from=builder /app/time-app /time-app

# Set the entrypoint to the binary
ENTRYPOINT ["/time-app"]

# Expose the application port
EXPOSE 8080
migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/banking?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/banking?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/banking?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/banking?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate
test:
	go test -v -cover ./...

server:
	go run main.go
mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/mohammad-Serpoush/golang-banking-api/db/sqlc Store 
.PHONY: migrateup migratedown sqlc server test mock migratedown1 migrateup1
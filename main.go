package main

import (
	"database/sql"
	"log"

	db "github.com/mohammad-Serpoush/golang-banking-api/db/sqlc"
	"github.com/mohammad-Serpoush/golang-banking-api/util"

	"github.com/mohammad-Serpoush/golang-banking-api/api"

	_ "github.com/lib/pq"
)

func main() {
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load configuration:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}

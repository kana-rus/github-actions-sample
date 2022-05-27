package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

const (
	HOST     = "postgres"
	USER     = "postgres"
	PASSWORD = "password"
	DB_NAME  = "testdb"
)

type User struct {
	ID    int
	Name  string
	Email string
}

var (
	db  *sql.DB
	err error
)

func init() {
	connectionInfo := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=disable", HOST, USER, PASSWORD, DB_NAME)
	db, err = sql.Open("postgres", connectionInfo)
	assert(err, "OpenError")
}

func main() {
	fmt.Println("Hello, migrate!")

	err = db.Ping()
	assert(err, "ConnectionError")

	selectAllFromUsers()

	newUser := User{
		ID: 314,
		Name: "euqlid",
		Email: "euqlid123@xmail.com",
	}
	err = newUser.Create()
	assert(err, "CreateError")

	selectAllFromUsers()
}

func selectAllFromUsers() {
	fmt.Println("users:")

	rows, err := db.Query(fmt.Sprintf("SELECT * FROM %s", "users"))
	assert(err, "SelectError")
	defer rows.Close()

	var (
		id int
		name string
		email string
	)
	for rows.Next() {
		rows.Scan(&id, &name, &email)
		fmt.Printf("%d %s %s\n", id, name, email)
	}
}
func (user *User) Create() error {
	insertQuery := "INSERT INTO users VALUES($1, $2, $3) RETURNING id"
	err = db.QueryRow(insertQuery, user.ID, user.Name, user.Email).Scan(&user.ID)
	return err
}

func assert(err error, msg string) {
	if err != nil {
		log.Fatal(msg, ": ", err)
	}
}

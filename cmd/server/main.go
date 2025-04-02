package main

import (
	"fmt"
	"log"
	"net"
)

func main() {
	listener, err := net.Listen("tcp",":8080")

	if err != nil {
		log.Fatal("can not establish a listener: ", err)
	}

	defer listener.Close()

	for {
		conn, err := listener.Accept()
		if err != nil {
			fmt.Println("error in accepting connection: ", err)
		}

		go handleConnection(conn)
	}
}

func handleConnection(conn net.Conn) {
	buf := make([]byte, 1024)
	_, err := conn.Read(buf)
	if err != nil {
		fmt.Println("can not read network connection", err)
	}
	strBuf := string(buf)
	fmt.Println(strBuf)
	defer conn.Close()
}
package main

import (
	"github.com/sirupsen/logrus"
)

func main() {
	logrus.setFormatter(&logrus.JSONFormatter{})

	containerConf := container.InitContainer()
	defer mysql.Connection(containerConf.Mysqldb)
}

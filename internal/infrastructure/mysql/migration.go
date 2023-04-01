package mysql

import (
	"fmt"
	"rakamin-mini-project/internal/daos"
	"rakamin-mini-project/internal/helper"

	"gorm.io/gorm"
)

func RunMigration(mysqlDB *gorm.DB) {
	err := mysqlDB.AutoMigrate(
		&daos.Book{},
	)

	var count int64
	if mysqlDB.Migrator().HasTable(&daos.Book{}) {
		mysqlDB.Model(&daos.Book{}).Count(&count)
		if count < 1 {
			// mysqlDB.CreateInBatches(booksSeed, len(booksSeed))
		}
	}

	if err != nil {
		helper.Logger(currentfilepath, helper.LoggerLevelError, fmt.Sprintf("Failed Database Migrated : %s", err.Error()))
	}

	helper.Logger(currentfilepath, helper.LoggerLevelInfo, "Database Migrated")
}

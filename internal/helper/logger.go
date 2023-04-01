package helper

import (
	"github.com/sirupsen/logrus"
)

const (
	LoggerLevelTrace = "LoggerLevelTrace"
	LoggerLevelDebug = "LoggerLevelDebug"
	LoggerLevelInfo  = "LoggerLevelInfo"
	LoggerLevelWarn  = "LoggerLevelWarn"
	LoggerLevelError = "LoggerLevelError"
	LoggerLevelFatal = "LoggerLevelFatal"
	LoggerLevelPanic = "LoggerLevelPanic"
)

func Logger(filepath, level, message string) {
	if filepath == "" || level == "" || message == "" {
		logrus.WithFields(
			logrus.Fields{
				"file": "internal/helper/logger.go",
			},
		).Error("All params is required")
	}

	logging := logrus.WithFields(
		logrus.Fields{
			"file": filepath,
		})

	switch level {
	case LoggerLevelDebug:
		logging.Debug(message)
	case LoggerLevelInfo:
		logging.Debug(message)
	case LoggerLevelWarn:
		logging.Debug(message)
	case LoggerLevelError:
		logging.Debug(message)
	case LoggerLevelFatal:
		logging.Debug(message)
	case LoggerLevelPanic:
		logging.Debug(message)
	default:
		logging.Error("Level Invalid")
	}
}

#!/bin/bash

APP_VERSION_MAJOR=`cat ../../../component/common/application/amazon/amazon-freertos-1.4.7/demos/common/include/aws_application_version.h | grep -i VERSION_MAJOR | cut -d " " -f 4`
JSON_VERSION=`cat amebaz2_firmware_is.json | grep -i serial | sed -n 1p | cut -d ":" -f 2 | sed "s/^[ \t]*//g"`

if [ "${APP_VERSION_MAJOR}" != "${JSON_VERSION}" ]
then
	echo "APP_VERSION_MAJOR  = $APP_VERSION_MAJOR"
	echo "serial = $JSON_VERSION"
	echo "!!! Please check FW version setting in \"aws_application_version.h\" and \"amebaz2_firmware_is.json\". The version must same !!!"
	echo "!!! Please check FW version setting in \"aws_application_version.h\" and \"amebaz2_firmware_is.json\". The version must same !!!"
	exit 1
fi

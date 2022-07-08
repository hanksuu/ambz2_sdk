
# Initialize tool chain
# -------------------------------------------------------------------

AMEBAZ2_TOOLDIR	= ../../../component/soc/realtek/8710c/misc/iar_utility

OS := $(shell uname)

CROSS_COMPILE = $(ARM_GCC_TOOLCHAIN)/arm-none-eabi-

# Compilation tools
AR = $(CROSS_COMPILE)ar
CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
NM = $(CROSS_COMPILE)nm
LD = $(CROSS_COMPILE)gcc
GDB = $(CROSS_COMPILE)gdb
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

OS := $(shell uname)

# Initialize target name and target object files
# -------------------------------------------------------------------

all: lib_amazon

TARGET=lib_amazon

OBJ_DIR=$(TARGET)/Debug/obj
BIN_DIR=$(TARGET)/Debug/bin
INFO_DIR=$(TARGET)/Debug/info

# Include folder list
# -------------------------------------------------------------------

INCLUDES =
INCLUDES += -I../inc

INCLUDES += -I../../../component/common/api
INCLUDES += -I../../../component/common/api/platform
INCLUDES += -I../../../component/common/api/wifi
INCLUDES += -I../../../component/common/api/wifi/rtw_wpa_supplicant/src
INCLUDES += -I../../../component/common/api/wifi/rtw_wpa_supplicant/src/crypto
INCLUDES += -I../../../component/common/api/network/include
INCLUDES += -I../../../component/common/application
INCLUDES += -I../../../component/common/application/mqtt/MQTTClient
INCLUDES += -I../../../component/common/example
INCLUDES += -I../../../component/common/utilities
INCLUDES += -I../../../component/common/mbed/hal
INCLUDES += -I../../../component/common/mbed/hal_ext
INCLUDES += -I../../../component/common/mbed/targets/hal/rtl8710c
INCLUDES += -I../../../component/common/network
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/src/include
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/src/include/lwip
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/port/realtek
INCLUDES += -I../../../component/common/network/lwip/lwip_v2.0.2/port/realtek/freertos
#INCLUDES += -I../../../component/common/network/ssl/mbedtls-2.4.0/include
INCLUDES += -I../../../component/common/network/ssl/ssl_ram_map/rom
INCLUDES += -I../../../component/common/drivers/wlan/realtek/include
INCLUDES += -I../../../component/common/drivers/wlan/realtek/src/osdep
INCLUDES += -I../../../component/common/drivers/wlan/realtek/src/core/option
INCLUDES += -I../../../component/common/test
INCLUDES += -I../../../component/soc/realtek/8710c/cmsis/rtl8710c/include
INCLUDES += -I../../../component/soc/realtek/8710c/cmsis/rtl8710c/lib/include
INCLUDES += -I../../../component/soc/realtek/8710c/fwlib/include
INCLUDES += -I../../../component/soc/realtek/8710c/fwlib/lib/include
INCLUDES += -I../../../component/soc/realtek/8710c/cmsis/cmsis-core/include
INCLUDES += -I../../../component/soc/realtek/8710c/app/rtl_printf/include
INCLUDES += -I../../../component/soc/realtek/8710c/app/shell
INCLUDES += -I../../../component/soc/realtek/8710c/app/stdio_port
INCLUDES += -I../../../component/soc/realtek/8710c/misc/utilities/include
INCLUDES += -I../../../component/soc/realtek/8710c/mbed-drivers/include
INCLUDES += -I../../../component/soc/realtek/8710c/misc/platform
INCLUDES += -I../../../component/soc/realtek/8710c/misc/driver
INCLUDES += -I../../../component/soc/realtek/8710c/misc/os

INCLUDES += -I../../../component/os/freertos
#INCLUDES += -I../../../component/os/freertos/freertos_v10.0.1/Source/include
#INCLUDES += -I../../../component/os/freertos/freertos_v10.0.1/Source/portable/GCC/ARM_RTL8710C
#os - freertos 10.3.0 start
INCLUDES += -I../../../component/common/application/amazon/v202007/freertos_kernel/include
INCLUDES += -I../../../component/os/freertos/freertos_v10.3.0/Source/portable/GCC/ARM_CM33_NTZ/non_secure
#os - freertos 10.3.0 end
INCLUDES += -I../../../component/os/os_dep/include

#Amazon Includes
INCLUDES += -I../../../component/common/example/amazon_freertos
INCLUDES += -I../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/aws_demos/config_files
INCLUDES += -I../../../component/common/application/amazon/v202007/demos/include
INCLUDES += -I../../../component/common/application/amazon/v202007/demos/network_manager
INCLUDES += -I../../../component/common/application/amazon/v202007/demos/dev_mode_key_provisioning/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/abstractions/pkcs11/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/abstractions/pkcs11/mbedtls
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/abstractions/platform/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/abstractions/platform/freertos/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/abstractions/platform/freertos/include/platform
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/abstractions/secure_sockets/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/abstractions/wifi/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src/private
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/include/private
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/include/types
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/private
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/serializer/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/freertos_plus/aws/ota/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/freertos_plus/aws/ota/src
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/freertos_plus/aws/ota/src/mqtt
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/crypto/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/pkcs11/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/tls/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/utils/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/jsmn
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/mbedtls/include
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/mbedtls_config
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/mbedtls_utils
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/unity/src
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/unity/extras/fixture/src
INCLUDES += -I../../../component/common/application/amazon/v202007/libraries/3rdparty/pkcs11
INCLUDES += -I../../../component/common/application/amazon/v202007/freertos_kernel/include

# Source file list
# -------------------------------------------------------------------

SRC_C =

#Amazon-freertos-v202007

#amazon - demos
SRC_C += ../../../component/common/application/amazon/v202007/demos/demo_runner/aws_demo.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/demo_runner/aws_demo_version.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/demo_runner/iot_demo_freertos.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/demo_runner/iot_demo_runner.c

SRC_C += ../../../component/common/application/amazon/v202007/demos/network_manager/aws_iot_demo_network.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/network_manager/aws_iot_network_manager.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/dev_mode_key_provisioning/src/aws_dev_mode_key_provisioning.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/shadow/aws_iot_demo_shadow.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/ota/aws_iot_ota_update_demo.c
SRC_C += ../../../component/common/application/amazon/v202007/demos/mqtt/iot_demo_mqtt.c

#amazon - libraries
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/jsmn/jsmn.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src/cborencoder.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src/cborencoder_close_container_checked.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src/cborerrorstrings.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src/cborparser.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src/cborparser_dup_string.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src/cborpretty.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/tinycbor/src/cborvalidation.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/unity/src/unity.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/3rdparty/unity/extras/fixture/src/unity_fixture.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/abstractions/pkcs11/mbedtls/iot_pkcs11_mbedtls.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/abstractions/platform/freertos/iot_clock_freertos.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/abstractions/platform/freertos/iot_metrics.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/abstractions/platform/freertos/iot_network_freertos.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/abstractions/platform/freertos/iot_threads_freertos.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src/aws_iot_shadow_api.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src/aws_iot_shadow_operation.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src/aws_iot_shadow_parser.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src/aws_iot_shadow_static_memory.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src/aws_iot_shadow_subscription.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/aws/shadow/src/aws_shadow.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/logging/iot_logging.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/logging/iot_logging_task_dynamic_buffers.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/taskpool/iot_taskpool.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/taskpool/iot_taskpool_static_memory.c
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/libraries/c_sdk/standard/common/iot_device_metrics.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/iot_init.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/common/iot_static_memory_common.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_agent.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_api.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_network.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_operation.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_serialize.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_static_memory.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_subscription.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/mqtt/src/iot_mqtt_validate.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/serializer/src/cbor/iot_serializer_tinycbor_decoder.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/serializer/src/cbor/iot_serializer_tinycbor_encoder.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/serializer/src/json/iot_serializer_json_decoder.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/serializer/src/json/iot_serializer_json_encoder.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/serializer/src/iot_json_utils.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/c_sdk/standard/serializer/src/iot_serializer_static_memory.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/aws/ota/src/aws_iot_ota_agent.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/aws/ota/src/mqtt/aws_iot_ota_cbor.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/aws/ota/src/aws_iot_ota_interface.c
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/libraries/freertos_plus/aws/ota/src/mqtt/aws_iot_ota_mqtt.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/crypto/src/iot_crypto.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/pkcs11/src/iot_pkcs11.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/tls/src/iot_tls.c

SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/utils/src/iot_pki_utils.c
SRC_C += ../../../component/common/application/amazon/v202007/libraries/freertos_plus/standard/utils/src/iot_system_init.c

#amazon - vendors
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/ports/ota/aws_ota_amebaZ2.c
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/ports/ota/aws_ota_pal.c
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/ports/pkcs11/iot_pkcs11_pal.c
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/ports/secure_sockets/iot_secure_sockets.c
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/ports/wifi/iot_wifi.c
SRC_C += ../../../component/common/application/amazon/v202007/vendors/realtek/boards/amebaZ2/aws_demos/application_code/aws_main.c

#lib_version
VER_C += $(TARGET)_version.c

# Generate obj list
# -------------------------------------------------------------------

SRC_O = $(patsubst %.c,%_$(TARGET).o,$(SRC_C))
VER_O = $(patsubst %.c,%_$(TARGET).o,$(VER_C))

SRC_C_LIST = $(notdir $(SRC_C)) $(notdir $(DRAM_C))
OBJ_LIST = $(addprefix $(OBJ_DIR)/,$(patsubst %.c,%_$(TARGET).o,$(SRC_C_LIST)))
DEPENDENCY_LIST = $(addprefix $(OBJ_DIR)/,$(patsubst %.c,%_$(TARGET).d,$(SRC_C_LIST)))

# Compile options
# -------------------------------------------------------------------

CFLAGS =
CFLAGS += -march=armv8-m.main+dsp -mthumb -mcmse -mfloat-abi=soft -D__thumb2__ -g -gdwarf-3 -Os
CFLAGS += -D__ARM_ARCH_8M_MAIN__=1 -gdwarf-3 -fstack-usage -fdata-sections -ffunction-sections 
CFLAGS += -fdiagnostics-color=always -Wall -Wpointer-arith -Wstrict-prototypes -Wundef -Wno-write-strings 
CFLAGS += -Wno-maybe-uninitialized --save-temps -c -MMD
CFLAGS += -DCONFIG_PLATFORM_8710C -DCONFIG_BUILD_RAM=1
CFLAGS += -DV8M_STKOVF
CFLAGS += -DENABLE_AMAZON_COMMON
CFLAGS += -DMBEDTLS_CONFIG_FILE=\"aws_mbedtls_config.h\"

include toolchain.mk

# Compile
# -------------------------------------------------------------------

.PHONY: lib_amazon
lib_amazon: prerequirement $(SRC_O) $(DRAM_O)
	$(AR) crv $(BIN_DIR)/$(TARGET).a $(OBJ_CPP_LIST) $(OBJ_LIST) $(VER_O)
	cp $(BIN_DIR)/$(TARGET).a ../../../component/soc/realtek/8710c/misc/bsp/lib/common/GCC/$(TARGET).a

# Manipulate Image
# -------------------------------------------------------------------

.PHONY: manipulate_images
manipulate_images:
	@echo ===========================================================
	@echo Image manipulating
	@echo ===========================================================

# Generate build info
# -------------------------------------------------------------------

.PHONY: prerequirement
prerequirement:
	@rm -f $(TARGET)_version*.o
	@echo const char $(TARGET)_rev[] = \"$(TARGET)_ver_`git rev-parse HEAD`_`date +%Y/%m/%d-%T`\"\; > $(TARGET)_version.c
	@$(CC) $(CFLAGS) $(INCLUDES) -c $(VER_C) -o $(VER_O)
	@if [ ! -d $(ARM_GCC_TOOLCHAIN) ]; then \
		echo ===========================================================; \
		echo Toolchain not found, \"make toolchain\" first!; \
		echo ===========================================================; \
		exit -1; \
	fi
	@echo ===========================================================
	@echo Build $(TARGET)
	@echo ===========================================================
	mkdir -p $(OBJ_DIR)
	mkdir -p $(BIN_DIR)
	mkdir -p $(INFO_DIR)

$(SRC_O): %_$(TARGET).o : %.c | prerequirement
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -MM -MT $@ -MF $(OBJ_DIR)/$(notdir $(patsubst %.o,%.d,$@))
	cp $@ $(OBJ_DIR)/$(notdir $@)
	mv $(notdir $*.i) $(INFO_DIR)
	mv $(notdir $*.s) $(INFO_DIR)
	chmod 777 $(OBJ_DIR)/$(notdir $@)

-include $(DEPENDENCY_LIST)

.PHONY: clean
clean:
	rm -rf $(TARGET)
	rm -f $(SRC_O) $(DRAM_O) $(VER_O)
	rm -f $(patsubst %.o,%.d,$(SRC_O)) $(patsubst %.o,%.d,$(DRAM_O)) $(patsubst %.o,%.d,$(VER_O))
	rm -f $(patsubst %.o,%.su,$(SRC_O)) $(patsubst %.o,%.su,$(DRAM_O)) $(patsubst %.o,%.su,$(VER_O))
	rm -f *.i
	rm -f *.s
	rm -f $(VER_C)

# Add inputs and outputs from these tool invocations to the build variables
SRCS_DIR =  $(STM_CUBE_FW_DIR)/Projects/STM32F767ZI-Nucleo/Applications/LwIP/LwIP_HTTP_Server_Netconn_RTOS/Src
BUILDDIR = Application/User

#SRCS = $(wildcard $(SRCS_DIR)/*.c)
SRCS = $(SRCS_DIR)/app_ethernet.c \
$(SRCS_DIR)/ethernetif.c \
$(SRCS_DIR)/httpserver-netconn.c \
$(SRCS_DIR)/main.c \
$(SRCS_DIR)/stm32f7xx_hal_timebase_tim.c \
$(SRCS_DIR)/stm32f7xx_it.c

#$(info $$SRCS is [${SRCS}])

C_SRCS += SRCS
DPDS= $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.d)))

C_SRCS += SRCS

OBJS += $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.o)))

C_DEPS += DPDS

# Each subdirectory must supply rules for building sources it contributes
$(BUILDDIR)/%.o: $(SRCS_DIR)/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


# Add inputs and outputs from these tool invocations to the build variables
SRCS_DIR =  $(STM_CUBE_FW_DIR)/Middlewares/Third_Party/LwIP
BUILDDIR = Middlewares/LwIP/Netif

#SRCS = $(wildcard $(SRCS_DIR)/*.c)
SRCS = $(SRCS_DIR)/src/netif/ethernet.c 
SRCS += $(SRCS_DIR)/system/OS/sys_arch.c 

#$(info $$SRCS is [${SRCS}])

C_SRCS += SRCS
DPDS= $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.d)))

C_SRCS += SRCS

OBJS += $(addprefix $(BUILDDIR)/, $(notdir $(SRCS:.c=.o)))

C_DEPS += DPDS

# Each subdirectory must supply rules for building sources it contributes
$(BUILDDIR)/ethernet.o: $(SRCS_DIR)/src/netif/ethernet.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

$(BUILDDIR)/sys_arch.o: $(SRCS_DIR)/system/OS/sys_arch.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


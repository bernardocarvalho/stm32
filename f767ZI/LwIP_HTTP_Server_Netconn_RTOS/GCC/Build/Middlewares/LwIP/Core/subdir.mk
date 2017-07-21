################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
#https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
#mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
#current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

#$(info $$current_dir is [${current_dir}])

SRCS_DIR =  $(STM_CUBE_FW_DIR)/Middlewares/Third_Party/LwIP/src/core
BUILDDIR = Middlewares/LwIP/Core

SRCS = $(wildcard $(SRCS_DIR)/*.c)

#OBJS1 = $(addprefix Middlewares/LwIP/Core/, $(notdir $(SRCS:.c=.o)))
DPDS= $(addprefix  $(BUILDDIR)/, $(notdir $(SRCS:.c=.d)))
#$(info $$OBJS1 is [${OBJS1}])
#$(info $$DPDS is [${DPDS}])

C_SRCS += SRCS

OBJS += $(addprefix  $(BUILDDIR)/, $(notdir $(SRCS:.c=.o)))
C_DEPS += DPDS


# Each subdirectory must supply rules for building sources it contributes
$(BUILDDIR)/%.o: $(SRCS_DIR)/%.c
#%.o: $(STM_CUBE_FW_DIR)/Middlewares/Third_Party/LwIP/src/core/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	$(CC) $(CFLAGS) $(INCLUDES)  -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


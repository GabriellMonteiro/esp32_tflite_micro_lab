
#
# Main component of TF Micro project 'micro_speech'.
#

idf_component_register(
    SRCS main.cc main_functions.cc constants.cc output_handler.cc model.cc
    PRIV_REQUIRES spi_flash
    INCLUDE_DIRS "")

# O Wokwi nao implementa ESP-NN. A opcao -U, adicionada depois da definicao
# do componente, garante o uso dos kernels de referencia do TFLite Micro.
idf_component_get_property(tflm_component_lib espressif__esp-tflite-micro COMPONENT_LIB)
target_compile_options(${tflm_component_lib} PRIVATE -UESP_NN)

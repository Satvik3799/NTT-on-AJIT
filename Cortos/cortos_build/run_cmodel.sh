#!/bin/sh

echo "################################################################"
echo "#                  RUNNING DEBUG BUILD"
echo "################################################################"
sleep 1;

# run AJIT C Model on the generated mmap file
_MAIN="main";
ajit_C_system_model \
  -R 123456 \
  -n 1 \
  -t 2 \
  -i 0x40000000 \
  -m ${_MAIN}.mmap.remapped \
;

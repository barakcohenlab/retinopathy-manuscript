#!/bin/bash

eval `spack load --sh meme@5.4`

sea --p $1.fa --n $2.fa --m HOCOMOCOv11_core_MOUSE_mono_meme_format.meme --oc $1_vs_$2


::#!/bin/bash

::Use the sign.sh script if you select custom code signing for OTA tests.

::openssl dgst -sha256 -sign C:/<absolute-path-to>/<privare-key-file> -out C:/<absolute-path-to>/<signature-destination> %1
::openssl base64 -A -in C:/<absolute-path-to>/<signature-destination> -out %2

set exepath="C:\Program Files\OpenSSL-Win64\bin\openssl.exe"


set keypath="ecdsa-sha256-signer.key.pem"
set outsha256="firmware_is_sig_tmp.bin"
set image2="..\..\..\..\..\project\realtek_amebaz2_v0_example\GCC-RELEASE\application_is\Debug\bin\firmware_is_pad.bin"
set outsignature="IDT-OTA-Signature"

@echo off

%exepath% dgst -sha256 -sign %keypath% -out %outsha256% %image2%
%exepath% base64 -A -in %outsha256% -out %outsignature%

pause
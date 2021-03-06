#!/bin/bash
# "-----------------------------------------------------------------------"
# "This script creates the Topfield installer."
#
# "Author: Audioniek, based on previous work by person(s) unknown."
# "Date: 07-12-2014"
#
# "Do not run this script witch sudo. fakeroot is OK."

echo -n " Remove previous Topfield installer..."
rm -f $TFINSTALLERDIR/uImage
rm -f $TFINSTALLERDIR/Enigma_Installer.tfd
rm -f $TFINSTALLERDIR/tfpacker
rm -f $CDKDIR/.deps/uboot_tf7700
rm -f $CDKDIR/.deps/tfkernel.do_compile
echo " done."

cd $CDKDIR
echo -n " Build uboot_tf7700..."
make uboot_tf7700 > /dev/null 2> /dev/null
echo " done."
echo -n " Build tfpacker & u-boot.ftfd..."
make tfinstaller/u-boot.ftfd > /dev/null 2> /dev/null
echo " done."
echo -n " Create Enigma_Installer.tfd..."
make -C tfinstaller > /dev/null 2> /dev/null
echo " done."



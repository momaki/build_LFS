#!/bin/bash

#-----------------------------
# 8.75.1. Installation of Vim
#

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

chown -R tester .
sed '/test_plugin_glvs/d' -i src/testdir/Make_all.mak

su tester -c "TERM=xterm-256color LANG=en_US.UTF-8 make -j1 test" \
   &> vim-test.log

grep -e "ALL DONE" vim-test.log
if [ $? -ne 0 ]; then
  cp -v vim-test.log /logs
fi

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install

ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim92/doc /usr/share/doc/vim-9.2.0078

#-------------------------
# 8.75.2. Configuring Vim
#

cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

#vim -c ':options'

#cat >> /etc/vimrc << "EOF"
#set spelllang=en,ru
#set spell
#EOF

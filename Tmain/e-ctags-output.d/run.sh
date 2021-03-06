# Copyright: 2019 Masatake YAMATO
# License: GPL-2
# The original bug is reported by @elecalion in #2014.

CTAGS=$1

tmp="input file.cc"
cp input_file.cc "${tmp}"
"${CTAGS}" --quiet --options=NONE --output-format=e-ctags \
		   --kinds-c++=+p --fields=+iaSs \
		   -o - \
		   "${tmp}" \
		   input_tab.rst input_space.rst
rm "${tmp}"

echo "# WITH SCOPE"
"${CTAGS}" --quiet --options=NONE --output-format=e-ctags \
		   --fields=+s \
		   -o - \
		   input_scope.rst

echo "# WITHOUT SCOPE"
"${CTAGS}" --quiet --options=NONE --output-format=e-ctags \
		   --fields=-s \
		   -o - \
		   input_scope.rst

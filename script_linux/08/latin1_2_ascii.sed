#! /bin/sed -f
# Latin 1 -> ASCII
s/[ְֱֲֳִֵ]/A/g
s/ֶ/AE/g
s/ַ/C/g
s/[ָֹÊֻ]/E/g
s/[ּֽ־ֿ]/I/g
s/ׁ/N/g
s/[ׂ׃װױײ״]/O/g
s/[ÙÚÛÜ]/U/g
s/Ý/Y/g
s/[אבגדה]/a/g
s/ז/ae/g
s/ח/c/g
s/[טיךכ]/e/g
s/[לםמן]/i/g
s/ס/n/g
s/[עףפצר]/o/g
s/[שתûü]/u/g
s/‎/y/g

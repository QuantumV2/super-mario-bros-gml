palselect += shinedir;

// check for value bounds and change direction if necessary
if (palselect >= 2) shinedir = -1;
if (palselect <= 0) shinedir = 1;
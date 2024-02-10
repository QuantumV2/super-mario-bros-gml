palselect += shinedir;

// check for value bounds and change direction if necessary
if (palselect >= 2) self.shinedir = -1;
if (palselect <= 0) self.shinedir = 1;
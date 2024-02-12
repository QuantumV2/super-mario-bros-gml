function scr_padstring(originalString, padString, targetLength) {
    while (string_length(originalString) < targetLength) {
        originalString = padString + originalString;
    }
    if (string_length(originalString) > targetLength) {
        originalString = string_copy(originalString, string_length(originalString) - targetLength + 1, targetLength);
    }
    return originalString;
}
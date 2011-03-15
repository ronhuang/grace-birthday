#! /usr/bin/env python

import sys
import os.path
import struct

MAGIC = 0x746c

def main():
    if len(sys.argv) < 2:
        print "Usage: %s <path to frx>" % (sys.argv[0])
        return

    frxPath = os.path.abspath(sys.argv[1])
    frxBase = os.path.splitext(os.path.basename(frxPath))[0]

    frxFile = open(frxPath, 'rb')
    frxData = frxFile.read()
    frxFile.close()

    offset = 0

    # go in loop till EOF.
    while offset < len(frxData):
        testSize = 0
        headerType = None
        dataType = None
        data = None
        headerSize = 0
        dataSize = 0

        # parse header (type I) with entry size
        testSize = struct.calcsize("<3I")
        if testSize < len(frxData) - offset:
            (entrySize, magic, dataSize) = struct.unpack_from("<3I", frxData, offset)
            if (entrySize - dataSize + 4) == testSize and MAGIC == magic:
                headerSize = testSize
                headerType = 1

        # parse header (type II) with entry size and guid
        testSize = struct.calcsize("<I16sII")
        if headerType is None and testSize < len(frxData) - offset:
            (entrySize, guid, magic, dataSize) = struct.unpack_from("<I16sII", frxData, offset)
            if (entrySize - dataSize + 4) == testSize and MAGIC == magic:
                headerSize = testSize
                headerType = 2

        # parse header (type III) with only data size
        testSize = struct.calcsize("<I")
        if headerType is None and testSize < len(frxData) - offset:
            (dataSize,) = struct.unpack_from("<I", frxData, offset)
            headerSize = testSize
            headerType = 3

        # Determine data type
        if dataSize > 0 and dataSize < len(frxData): # make sure dataSize is within valid range
            if offset + headerSize + dataSize <= len(frxData):
                data = frxData[offset + headerSize:offset + headerSize + dataSize]
                dataType = checkDataType(data)

        # Determine data
        if dataType and dataSize > 0:
            # Save the data.
            fn = "unfrx_%s_%s.%s" % (frxBase, offset, dataType)
            f = open(fn, 'wb')
            f.write(data)
            f.close()
            print "Wrote to %s" % (fn)

            offset += headerSize + dataSize
        elif headerType:
            offset += headerSize + dataSize
        else:
            # No valid data type found
            offset += 1

def checkDataType(data):
    if len(data) <= 4:
        return

    if ("GIF",) == struct.unpack_from("<3s", data, 0) and (";",) == struct.unpack_from("<c", data, len(data) - 1):
        return "gif"
    elif (0xD8FF,) == struct.unpack_from("<H", data, 0) and (0xD9FF,) == struct.unpack_from("<H", data, len(data) - 2):
        return "jpg"
    elif ("BM", len(data)) == struct.unpack_from("<2sI", data, 0):
        return "bmp"
    elif (0x0000, 0x0001) == struct.unpack_from("<2H", data, 0) or (0x0000, 0x0002) == struct.unpack_from("<2H", data, 0):
        c = struct.unpack_from("<H", data, 4)[0]
        o = struct.calcsize("<3H") + c * struct.calcsize("<4B2H2I") #ICONDIRENTRY
        s = struct.unpack_from("<I", data, o)[0]
        if struct.calcsize("<IiiHHIIiiII") == s: #BITMAPINFOHEADER
            return "ico"
    elif (0x0000, 0x0002) == struct.unpack_from("<2H", data, 0):
        c = struct.unpack_from("<H", data, 4)[0]
        o = struct.calcsize("<3H") + c * struct.calcsize("<4B2H2I") #ICONDIRENTRY
        s = struct.unpack_from("<I", data, o)[0]
        if struct.calcsize("<IiiHHIIiiII") == s: #BITMAPINFOHEADER
            return "cur"
    elif ("{\\rtf1",) == struct.unpack_from("6s", data, 0):
        return "rtf"
    else:
        print >> sys.stderr, "Unsupported format: 0x%02X,0x%02X,0x%02X,0x%02X,0x%02X,0x%02X" % struct.unpack_from("<6B", data, 0)
        return "blob"

if __name__ == "__main__":
    main()

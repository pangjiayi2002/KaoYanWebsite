package util;

import java.util.Base64;

public class ImageUtil {
    public static String byteToBase64(byte[] bytes) {
        return Base64.getEncoder().encodeToString(bytes);
    }
}

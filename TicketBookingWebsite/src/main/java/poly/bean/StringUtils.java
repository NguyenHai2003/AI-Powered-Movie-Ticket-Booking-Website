package poly.bean;

public class StringUtils {
    public static String safeSubstring(String input, int maxLength) {
        if (input == null || input.length() <= maxLength) {
            return input;
        }
        int endIndex = input.lastIndexOf(' ', maxLength);
        if (endIndex == -1) {
            endIndex = maxLength; // Nếu không có khoảng trắng, cắt tại maxLength
        }
        return input.substring(0, endIndex);
    }
}

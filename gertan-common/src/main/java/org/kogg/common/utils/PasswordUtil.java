package org.kogg.common.utils;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Base64;

public class PasswordUtil {

    private static byte[] pbkdf2(char[] password, byte[] salt, int iterations) throws Exception {
        // 使用 PBKDF2 算法进行哈希加密
        PBEKeySpec spec = new PBEKeySpec(password, salt, iterations, 256);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        return skf.generateSecret(spec).getEncoded();
    }

    public static String hashPassword(String password) {
        try {
            // 生成随机的盐值
            SecureRandom secureRandom = new SecureRandom();
            byte[] salt = new byte[16];
            secureRandom.nextBytes(salt);

            // 使用 PBKDF2 算法进行哈希加密
            int iterations = 10000;
            byte[] hashedPassword = pbkdf2(password.toCharArray(), salt, iterations);

            // 将盐值和哈希密码转换为字符串保存
            String encodedSalt = Base64.getEncoder().encodeToString(salt);
            String encodedHashedPassword = Base64.getEncoder().encodeToString(hashedPassword);

            return encodedSalt + ":" + encodedHashedPassword;
        } catch (Exception ex) {
            // 处理异常
            return null;
        }
    }

    public static boolean verifyPassword(String password, String storedPassword) {
        try {
            // 从数据库中获取盐值和哈希密码
            String[] parts = storedPassword.split(":");
            String encodedSalt = parts[0];
            String encodedHashedPassword = parts[1];

            // 解码盐值和哈希密码
            byte[] salt = Base64.getDecoder().decode(encodedSalt);
            byte[] hashedPassword = Base64.getDecoder().decode(encodedHashedPassword);

            // 使用相同的 PBKDF2 算法对用户输入的密码进行哈希加密
            int iterations = 10000;
            byte[] hashedInput = pbkdf2(password.toCharArray(), salt, iterations);

            // 比较哈希密码是否匹配
            return Arrays.equals(hashedInput, hashedPassword);
        } catch (Exception ex) {
            // 处理异常
            return false;
        }
    }


    public static void main(String[] args) {
        System.out.println(hashPassword("123456"));

        String hashPwd = "tzFq/PWRm3fLJ0rTlHI/1Q==:K/g9+r+9RvA6I7yF6vJZdpu3IWHg4Ahd5LH2Oxi3CrE=";
        System.out.println(verifyPassword("123456",hashPwd));
    }
}

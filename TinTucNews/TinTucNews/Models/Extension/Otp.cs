using System;

namespace TinTucNews.Models.Extension
{
    public class Otp
    {
        public static string GenerateOtp()
        {
            string num = "0123456789";
            int len = num.Length;
            string otp = string.Empty;

            int otpdigit = 6;
            string finaldigit;
            int getIndex;
            for (int i = 0; i < otpdigit; i++) {
                do
                {
                    getIndex = new Random().Next(0, len);
                    finaldigit = num.ToCharArray()[getIndex].ToString();
                } while (otp.IndexOf(finaldigit) != -1);
                otp += finaldigit;
            }
            return otp;
        }
    }
}

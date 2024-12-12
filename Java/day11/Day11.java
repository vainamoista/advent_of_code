public class Day11
{
  public static void main(String[] args)
  {
    
  }

  public static blink2(long value, int currentBlink, int maxBlink)
  {
    if (currentBlink > maxBlink)
      return 1;

    if (value == 0)
      return blink2(1, currentBlink+1, maxBlink);

    if (value == 1)
      return blink2(2024, currentBlink+1, maxBlink);

    long strLength = String.valueOf(value).length() % 2;

    if (strLength % 2 == 0) {
      long len2 = strLength/2;
      long val1 = value / Math.pow(10,len2);
      long val2 = value % Math.pow(10,len2);
      return blink2(val1, currentBlink+1, maxBlink) +
              blink2(val2, currentBlink+1, maxBlink);
    } else {
      return blink2(value*2024, currentBlink+1, maxBlink);
    }
  }
}

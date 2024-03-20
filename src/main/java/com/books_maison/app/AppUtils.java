package com.books_maison.app;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

public class AppUtils {

  public class Cron {

    private Cron() {}

    public static final String AT_EVERY_MIDNIGHT = "1 0 0 * * *";
  }

  private AppUtils() {}

  public static String formatMoney(BigDecimal amount) {
    Locale vietnamLocale = Locale.forLanguageTag("vi-VN");
    NumberFormat currencyFormat = NumberFormat.getInstance(vietnamLocale);
    currencyFormat.setCurrency(Currency.getInstance(vietnamLocale));
    currencyFormat.setMaximumFractionDigits(0);
    return currencyFormat.format(amount);
  }
}

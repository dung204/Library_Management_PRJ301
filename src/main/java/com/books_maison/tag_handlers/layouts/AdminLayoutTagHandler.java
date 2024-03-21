package com.books_maison.tag_handlers.layouts;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.logging.Logger;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AdminLayoutTagHandler extends TagSupport {

  private Logger logger = Logger.getLogger(AdminLayoutTagHandler.class.getName());

  private String title;

  @Override
  public int doStartTag() throws JspException {
    try {
      pageContext
        .getOut()
        .print(
          """
          <!DOCTYPE html>
          <html lang="en">
          <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>%s | Books Maison Admin</title>
            <link rel="stylesheet" href="/styles/admin.css">
            <link rel="icon" type="image/svg+xml" href="/images/favicon.svg">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
            <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
          </head>
          <body>
          """.formatted(title)
        );
    } catch (IOException e) {
      logger.severe(e.getMessage());
    }
    return EVAL_BODY_INCLUDE;
  }

  @Override
  public int doEndTag() throws JspException {
    try {
      pageContext
        .getOut()
        .print(
          """
          </body>
          </html>
          """
        );
    } catch (IOException e) {
      logger.severe(e.getMessage());
    }
    return EVAL_PAGE;
  }
}

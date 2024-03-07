package com.books_maison.tag_handlers.layouts;

import java.io.IOException;
import java.util.logging.Logger;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.TagSupport;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DefaultLayoutTagHandler extends TagSupport {
  private Logger logger = Logger.getLogger(DefaultLayoutTagHandler.class.getName());

  private String title;

  @Override
  public int doStartTag() throws JspException {
    try {
      pageContext.getOut().print(
          """
              <!DOCTYPE html>
              <html lang="en">
              <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>%s | Books Maison</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
                <link rel="stylesheet" href="/styles/custom.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
                <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
              </head>
              <body>
              """
              .formatted(title));
    } catch (IOException e) {
      logger.severe(e.getMessage());
    }
    return EVAL_BODY_INCLUDE;
  }

  @Override
  public int doEndTag() throws JspException {
    try {
      pageContext.getOut().print(
          """
              </body>
              </html>
              """);
    } catch (IOException e) {
      logger.severe(e.getMessage());
    }
    return EVAL_PAGE;
  }
}

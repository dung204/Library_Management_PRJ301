package com.books_maison.tag_handlers.components;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.logging.Logger;
import lombok.*;

@Setter
@Getter
public class PersonLinesLogoTagHandler extends TagSupport {

  private Logger logger = Logger.getLogger(PersonLinesLogoTagHandler.class.getName());
  private String className;

  @Override
  public int doStartTag() throws JspException {
    try {
      pageContext
        .getOut()
        .print(
          """
          <i class="bi bi-person-lines-fill %s"></i>
          """.formatted(className == null ? "" : className)
        );
    } catch (IOException e) {
      logger.severe(e.getMessage());
    }
    return SKIP_BODY;
  }
}

package com.books_maison.tag_handlers.components;

import java.io.IOException;
import java.util.logging.Logger;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.TagSupport;

import lombok.*;

@Setter
@Getter
public class MusicNoteLogoTagHandler extends TagSupport {
  private Logger logger = Logger.getLogger(MusicNoteLogoTagHandler.class.getName());
  private String className;

  @Override
  public int doStartTag() throws JspException {
    try {
      pageContext.getOut().print(
          """
              <i class="bi bi-music-note-beamed %s"></i>
              """.formatted(className == null ? "" : className));
    } catch (IOException e) {
      logger.severe(e.getMessage());
    }
    return SKIP_BODY;
  }
}
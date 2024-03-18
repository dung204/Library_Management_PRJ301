package com.books_maison.tag_handlers.components;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.TagSupport;
import java.util.logging.Logger;

public class SearchInputTagHandler extends TagSupport {

  private Logger logger = Logger.getLogger(SearchInputTagHandler.class.getName());

  @Override
  public int doStartTag() throws JspException {
    try {
      pageContext
        .getOut()
        .print(
          """
          <div class="input-group">
            <input type="text" class="form-control py-2 px-3 rounded-start-pill" placeholder="Tìm kiếm theo Tiêu đề, Tác giả, ISBN, ...">
            <button class="btn btn-primary rounded-end-pill px-4">
              <i class="bi bi-search"></i>
            </button>
          </div>
          """
        );
    } catch (Exception e) {
      logger.severe(e.getMessage());
    }
    return SKIP_BODY;
  }
}

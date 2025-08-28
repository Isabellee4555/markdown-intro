#' Convert gtsummary table to flextable or gt object 
#' This function is useful for rendering gtsummary tables into html or word documents(with officedown)
#'
#' @param tbl_summary a tbl_summary object
#' @param as_gt a logical value to convert to gt object or flextable object
#'
#' @return a flextable or gt object
#' @export
#'
#' @examples gt_flex_transform(tbl_summary, as_gt = TRUE)
gt_flex_transform <- function(tbl_summary, as_gt = TRUE, flex_width = NULL, flex_vline = NULL, flex_hline = NULL, gt_table_width = NULL, gt_container_width = NULL){
  
  if(as_gt){
    return(
      tbl_summary %>% 
        gtsummary::as_gt() %>% 
        {if(!is.null(gt_table_width)) gt::tab_options(., table.width = gt_table_width) else .} %>%
        {if(!is.null(gt_container_width)) gt::tab_options(., container.width = gt_container_width) else .}
    )
  }else{
    out <- tbl_summary %>% 
      as_flex_table()
    
    if(is.null(out$caption$value)){
      # add caption 
      out <- out %>% 
        flextable::set_caption(" ")
    }
    
    if(grepl("\\*\\*.+?\\*\\*", out$caption$value)){
      out <- out %>% 
        flextable::set_caption(flextable::as_paragraph(
          flextable::as_b(out$caption$value %>% 
                            stringr::str_replace_all("\\*\\*", ""))))
    }
    
    out <- out %>% 
      flex_style(width = flex_width, vline = flex_vline, hline = flex_hline)
    
    return(out)
  }
}

flex_style <- function(flextable, width = NULL, vline = NULL, hline = NULL){
  if(is.null(width)){
    width <- 1
  }
  
  flextable <- flextable %>% 
    flextable::bold(part = "header") %>%
    flextable::set_table_properties(layout = "autofit", width = width, align = "center")
  
  if(!is.null(vline)){
    flextable <- flextable %>% 
      flextable::vline(j = vline, part = "body", 
                       border = officer::fp_border( width = 1, style = "dashed"))
  }
  
  if(!is.null(hline)){
    flextable <- flextable %>% 
      flextable::hline(i = hline, part = "body", 
                       border = officer::fp_border( width = 1, style = "dashed"))
  }
  
  
  return(flextable)
}


dt_colnames_from_labels <- function(df) {
  labs <- labelled::var_label(df)
  labs <- unlist(labs, use.names = FALSE)
  # fall back to original names when a label is missing/empty
  ifelse(is.na(labs) | labs == "", names(df), labs)
}
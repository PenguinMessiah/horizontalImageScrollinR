library(knitr)
library(htmltools)
library(glue)
library(Slick)
library(magick)
library(shiny)
# Main gallery function
my_gallery <- function(images, height = "400px" ){
  # images are character vectors of URLs or local file path
  img_tags <- lapply(images, function(src){
    tags$img(src = src, style = glue(
      "height:{height}; scroll-snap-align:start; flex:0 0 auto; margin-right:15px; border-radius:10px;"
    )
    )
  })
  
  tags$div(
    style = "display:flex; overflow-x:scroll; scroll-snap-rtpe:x mandatory; -webkit-overflow-scrolling:touch; padding:10px 0;",
    img_tags
  )
}

resolve_src <- function(path){
  if(grepl("^https?://", path)){
    return(path)  # This already a url
  } else {
    return(knitr::image_uri(path)) # Embeds local file as base64 so they can be used online
  }
}
library(knitr)
library(htmltools)
library(glue)
library(Slick)
library(magick)
# Main gallery function
my_gallery <- function(images, height = "250px" ){
  # images are character vectors of URLs or local file path
  img_tags <- lapply(images, function(src){
    tags$img(src = src, style = glue("height:{height}; margin-right:10px; border-radius;8px;"))
  })
  
  tags$div(
    style = "display:flex; overflow-x:auto; white-space:nowrap; padding:10px;",
    img_tags
  )
}
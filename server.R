server <- function(input, output) {
  plot_data <- reactiveVal()
  error_message <- reactiveVal(NULL)

  observe({
    set.seed(input$seed)

    # Reset error message at start of each attempt
    error_message(NULL)

    tryCatch(
      {
        streets_x <- as.numeric(unlist(strsplit(input$streets_x, ",")))
        streets_y <- as.numeric(unlist(strsplit(input$streets_y, ",")))

        # Process trat2 input
        trat2_values <- if (input$trat2 != "")
          unlist(strsplit(input$trat2, ",")) else NULL

        result <- AgroR::sketch(
          trat = unlist(strsplit(input$trat, ",")),
          trat1 = unlist(strsplit(input$trat1, ",")),
          trat2 = trat2_values,
          r = input$r,
          add.streets.x = streets_x,
          add.streets.y = streets_y,
          label.x = input$label_x,
          label.y = input$label_y,
          design = input$design,
          ID = input$ID,
          legendsize = input$legendsize,
          axissize = input$axissize,
          labelsize = input$labelsize,
          export.csv = input$export_csv,
          comment.caption = input$comment_caption,
          color.sep = input$color_sep,
          pos = "column"
        )

        plot_data(result)
      },
      error = function(e) {
        error_message(e$message)
        plot_data(NULL)
      }
    )
  })

  output$sketch_plot <- renderPlot({
    if (!is.null(error_message())) {
      # Se houver erro, criar um plot vazio com a mensagem de erro
      plot.new()
      text(0.5, 0.5, paste("Erro:", error_message()), col = "red", cex = 1.5)
    } else {
      # Se não houver erro, mostrar o plot normal
      plot_data()
    }
  })

  output$save_plot <- downloadHandler(
    filename = function() {
      paste("sketch_plot_", Sys.Date(), ".png", sep = "")
    },
    content = function(file) {
      req(plot_data()) # Só permite download se houver um plot válido
      png(file, width = input$plot_width, height = input$plot_height)
      print(plot_data())
      dev.off()
    }
  )
}

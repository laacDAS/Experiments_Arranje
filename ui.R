library(shiny)

# Obter todas as opções de design disponíveis no pacote AgroR
design_options <- c(
        "DIC",
        "DBC",
        "FAT2DIC",
        "FAT2DBC",
        "FAT3DIC",
        "FAT3DBC",
        "PSUBDIC",
        "PSUBDBC",
        "PSUBSUBDBC",
        "STRIP-PLOT"
)

separeted_colors_option <- c("all", "none", "block", "f1", "f2", "f3")

# Interface do usuário
ui <- fluidPage(
        titlePanel("Criar Experimentos"),

        # Criação de abas
        tabsetPanel(
                # Aba para configuração e execução
                tabPanel(
                        "Configuração",
                        fluidRow(
                                column(
                                        3,
                                        numericInput(
                                                "seed",
                                                "Semente (set.seed):",
                                                value = 123
                                        )
                                ),
                                column(
                                        3,
                                        textInput(
                                                "trat",
                                                "Fator 1:",
                                                value = "Level1, Level2"
                                        )
                                ),
                                column(
                                        3,
                                        textInput(
                                                "trat1",
                                                "Fator 2:",
                                                value = "LevelA, LevelB, LevelC"
                                        )
                                ),
                                column(
                                        3,
                                        textInput(
                                                "trat2",
                                                "Fator 3:",
                                                value = ""
                                        )
                                )
                        ),

                        fluidRow(
                                column(
                                        3,
                                        numericInput(
                                                "r",
                                                "Número de repetições:",
                                                value = 4,
                                                min = 1
                                        )
                                ),
                                column(
                                        3,
                                        textInput(
                                                "streets_x",
                                                "Adicione ruas (X):",
                                                value = "1, 2"
                                        )
                                ),
                                column(
                                        3,
                                        textInput(
                                                "streets_y",
                                                "Adicione ruas (Y):",
                                                value = ""
                                        )
                                ),
                                column(
                                        3,
                                        textInput(
                                                "label_y",
                                                "Rótulo Y:",
                                                value = "Room"
                                        )
                                )
                        ),

                        fluidRow(
                                column(
                                        3,
                                        textInput(
                                                "label_x",
                                                "Rótulo X:",
                                                value = ""
                                        )
                                ),
                                column(
                                        3,
                                        selectInput(
                                                "design",
                                                "Design:",
                                                choices = design_options,
                                                selected = "FAT2DBC"
                                        )
                                ),
                                column(
                                        3,
                                        numericInput(
                                                "legendsize",
                                                "Tamanho da legenda:",
                                                value = 16,
                                                min = 14
                                        )
                                ),
                                column(
                                        3,
                                        numericInput(
                                                "axissize",
                                                "Tamanho do eixo:",
                                                value = 16,
                                                min = 14
                                        )
                                )
                        ),

                        fluidRow(
                                column(
                                        3,
                                        textInput(
                                                "comment_caption",
                                                "Comentário:",
                                                value = ""
                                        )
                                ),
                                column(
                                        3,
                                        selectInput(
                                                "color_sep",
                                                "Separação por cores",
                                                choices = separeted_colors_option,
                                                selected = "all"
                                        )
                                )
                        ),

                        fluidRow(
                                column(
                                        3,
                                        numericInput(
                                                "labelsize",
                                                "Tamanho do rótulo:",
                                                value = 6,
                                                min = 1
                                        )
                                ),
                                column(
                                        3,
                                        numericInput(
                                                "plot_width",
                                                "Largura da imagem (px):",
                                                value = 1000
                                        )
                                ),
                                column(
                                        3,
                                        numericInput(
                                                "plot_height",
                                                "Altura da imagem (px):",
                                                value = 600
                                        )
                                ),
                                downloadButton("save_plot", "Salvar Gráfico")
                        ),

                        fluidRow(
                                column(
                                        3,
                                        checkboxInput(
                                                "ID",
                                                "Usar ID?",
                                                value = FALSE
                                        )
                                ),
                                column(
                                        3,
                                        checkboxInput(
                                                "export_csv",
                                                "Exportar tabela CSV?",
                                                value = FALSE
                                        )
                                )
                        ),

                        # Área para exibir o gráfico
                        mainPanel(
                                plotOutput("sketch_plot", width = '100%')
                        )
                ),

                # Aba para documentação
                tabPanel(
                        "Documentação",
                        h3("Documentação da Função AgroR::sketch"),
                        h4("Arguments"),
                        tags$ul(
                                tags$li(
                                        strong("trat:"),
                                        " Vector with factor A levels."
                                ),
                                tags$li(
                                        strong("trat1:"),
                                        " Vector with levels of factor B (Set to NULL if not factorial or psub)."
                                ),
                                tags$li(
                                        strong("trat2:"),
                                        " Vector with levels of factor C (Set to NULL if not factorial)."
                                ),
                                tags$li(
                                        strong("r:"),
                                        " Number of repetitions."
                                ),
                                tags$li(
                                        strong("design:"),
                                        " Experimental design (see note)."
                                ),
                                tags$li(
                                        strong("pos:"),
                                        " Repeat position (line or column)."
                                ),
                                tags$li(strong("color.sep:"), " Color box."),
                                tags$li(
                                        strong("ID:"),
                                        " Add only identification in sketch."
                                ),
                                tags$li(
                                        strong("print.ID:"),
                                        " Print table ID."
                                ),
                                tags$li(
                                        strong("add.streets.y:"),
                                        " Adds streets by separating treatments in row or column. The user must supply a numeric vector grouping the rows or columns that must be together. See the example."
                                ),
                                tags$li(
                                        strong("add.streets.x:"),
                                        " Adds streets by separating treatments in row or column. The user must supply a numeric vector grouping the rows or columns that devem ser juntas. See the example."
                                ),
                                tags$li(strong("label.x:"), " Text in x."),
                                tags$li(strong("label.y:"), " Text in y."),
                                tags$li(strong("axissize:"), " Axis size."),
                                tags$li(
                                        strong("legendsize:"),
                                        " Title legend size."
                                ),
                                tags$li(strong("labelsize:"), " Label size."),
                                tags$li(
                                        strong("export.csv:"),
                                        " Save table template based on sketch in csv."
                                ),
                                tags$li(
                                        strong("comment.caption:"),
                                        " Add comment in caption."
                                )
                        ),
                        h4("Value"),
                        p(
                                "Returns an experimental sketch according to the specified design."
                        ),
                        h4("Note"),
                        p(
                                "The sketches have only a rectangular shape and the blocks (in the case of randomized blocks) can be in line or in a column."
                        ),
                        h4("Design Options:"),
                        tags$ul(
                                tags$li(
                                        'design="DIC" - Completely randomized design'
                                ),
                                tags$li(
                                        'design="DBC" - Randomized block design'
                                ),
                                tags$li('design="DQL" - Latin square design'),
                                tags$li(
                                        'design="FAT2DIC" - DIC experiments in double factorial'
                                ),
                                tags$li(
                                        'design="FAT2DBC" - DBC experiments in double factorial'
                                ),
                                tags$li(
                                        'design="FAT3DIC" - DIC experiments in triple factorial'
                                ),
                                tags$li(
                                        'design="FAT3DBC" - DBC experiments in triple factorial'
                                ),
                                tags$li(
                                        'design="PSUBDIC" - DIC experiments in split-plot'
                                ),
                                tags$li(
                                        'design="PSUBDBC" - DBC experiments in split-plot'
                                ),
                                tags$li(
                                        'design="PSUBSUBDBC" - DBC experiments in split-split-plot'
                                ),
                                tags$li(
                                        'design="STRIP-PLOT" - Strip-plot DBC experiments'
                                )
                        ),
                        h4("Color Separation Options:"),
                        p(
                                'For the color.sep argument, you can choose from the following options:'
                        ),
                        tags$ul(
                                tags$li('For design="DIC": use all or none'),
                                tags$li(
                                        'For design="DBC": use all,"bloco" or none'
                                ),
                                tags$li(
                                        'For design="DQL": use all,"column","line" or none'
                                ),
                                tags$li(
                                        'For design="FAT2DIC": use all,"f1","f2" or none'
                                ),
                                tags$li(
                                        'For design="FAT2DBC": use all,"f1","f2","block" or none'
                                ),
                                tags$li(
                                        'For design="FAT3DIC": use all,"f1","f2","f3" or none'
                                ),
                                tags$li(
                                        'For design="FAT3DBC": use all,"f1","f2","f3","block" or none'
                                ),
                                tags$li(
                                        'For design="PSUBDIC": use all,"f1","f2" or none'
                                ),
                                tags$li(
                                        'For design="PSUBDBC": use all,"f1","f2","block" or none'
                                ),
                                tags$li(
                                        'For design="PSUBSUBDBC": use all,"f1","f2","f3","block" or none'
                                )
                        )
                )
        )
)

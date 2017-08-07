shinyUI(fluidPage(
  fluidRow(
    titlePanel("湖北环境经济投入产出模型系统")
  ),
  fluidRow(
  navbarPage("分析流程",
                   tabPanel("系统介绍",
                            mainPanel(
                              h1("湖北环境经济投入产出模型系统",align="center"),
                              hr(),
                              hr(),
                              h4("湖北经济学院统计学院",align="center"),
                              h4("湖北省环境科学研究院环境经济研究中心",align="center"),
                              h4("联合研制",align="center")
                              
                            )       
                            
                   ),
                   tabPanel("数据导入",
                           
                            
                            fluidRow(
                              
                              column(6,
                                     wellPanel(
                                       h3("直接消耗系数表"),
                                       radioButtons("radio1", 
                                                          label = "数据文件来源", 
                                                          choices = list("本地文件" = 1, "服务器" = 2),
                                                          selected = 1),
                                       fileInput("file1",  '本地文件'),
                                       textInput('file1t', '服务器地址',value = 'ftp://')
                                       # hr(),
                                       # p("Current Value:", style = "color:#888888;"),
                                       # verbatimTextOutput('textOut')
                                     )),
                              
                              column(6,
                                     wellPanel(
                                       h3("上年各行业最终需求向量"),
                                       radioButtons("radio2", 
                                                    label = "数据文件来源", 
                                                    choices = list("本地文件" = 1, "服务器" = 2),
                                                    selected = 1),
                                       fileInput("file2",  '本地文件'),
                                       textInput('file2t', '服务器地址',value = 'ftp://')
                                     )),
                              
                              column(6,
                                     wellPanel(
                                       h3("直接产污系数表"),
                                       radioButtons("radio3", 
                                                    label = "数据文件来源", 
                                                    choices = list("本地文件" = 1, "服务器" = 2),
                                                    selected = 1),
                                       fileInput("file3",  '本地文件'),
                                       
                                       textInput('file3t', '服务器地址',value = 'ftp://')
                                     )),
                              
                              column(6,
                                     wellPanel(
                                       h3("污染物消减因子表"),
                                       radioButtons("radio4", 
                                                    label = "数据文件来源", 
                                                    choices = list("本地文件" = 1, "服务器" = 2),
                                                    selected = 1),
                                       fileInput("file4",  '本地文件'),
                                       textInput('file4t', '服务器地址',value = 'ftp://')
                                     ))
                              
                              
                            )
                           
                   ),
             
                   tabPanel("情景设置",
                            mainPanel(
                              numericInput("k0", label = h4("社会最终总需求变化率"), value = 0),
                              numericInput("k1", label = h4("第一产业最终需求变化率"), value = 0),
                              numericInput("k2", label = h4("第二产业最终需求变化率"), value = 0),
                              numericInput("k3", label = h4("第三产业最终需求变化率"), value = 0)
                            )
#                             mainPanel(
#                               submitButton("Update View"),
#                               hr(),
#                               verbatimTextOutput("calculate")
#                             )
                   ),
                   tabPanel("结果展示",
                            mainPanel(
                              
                                dataTableOutput(outputId="table")
                              
                            )
                   )
    )
  )
  
))

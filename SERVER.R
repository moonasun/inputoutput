shinyServer(function(input, output, session) {
  FLAG_data<<-FALSE;
  output$textOut <- renderPrint({ (input$radio1) })


  output$data_input <- renderText({
        inFile <- input$file1
        
        if (is.null(inFile))
          return(NULL)
        
      
 
    inFile <- input$file2
    
    if (is.null(inFile))
      return(NULL)
    
   
    
   
    
    inFile <- input$file3
    
    if (is.null(inFile))
      return(NULL)
    
    
    
    
    
    inFile <- input$file4
    
    if (is.null(inFile))
      return(NULL)
    
    
    
    str <- paste('文件读取完毕,可以进入情景参数设置')
    # FLAG_data<<-TRUE
    
    
  })
  # You can access the value of the widget with input$action, e.g.
  
  
  output$table <- renderDataTable({
    
    # if(FLAG_data!=TRUE) {output$data_input <- renderText({"数据文件设定错误"});return}
    if(input$radio1==2) d1<-read.csv(input$file1t, header=T, sep=",") else d1<-read.csv(input$file1$datapath, header=T, sep=",")
    if(input$radio2==2) d2<-read.csv(input$file2t, header=T, sep=",") else d2<-read.csv(input$file2$datapath, header=T, sep=",")
    if(input$radio3==2) d3<-read.csv(input$file3t, header=T, sep=",") else d3<-read.csv(input$file3$datapath, header=T, sep=",")
    if(input$radio4==2) d4<-read.csv(input$file4t, header=T, sep=",") else d4<-read.csv(input$file4$datapath, header=T, sep=",")
    
        dY<-rep(0,42)
        k0<-input$k0;
        k1<-input$k1;
        k2<-input$k2;
        k3<-input$k3;   
    if (k0!=0){
      dY<-rep(k0,42)
    }
    if (k1!=0){
      dY[1:8]<-k1
    }
    if (k2!=0){
      dY[9:28]<-k2
    }
    if (k3!=0){
      dY[29:42]<-k3
    }
        A<-as.matrix(d1[2:43,3:44])
        Y<-d2[1:42,2]
        C<-d3[1:42,2:18]
        Lambda<-d4[1:42,2:18]
       
        DY<-dY*Y
        DX<-solve(diag(1,nrow=42)-A)%*%DY
        E<-(matrix(1,nrow=42,ncol=17)-Lambda)*C
        DP<-t(E)%*%DX
        tmp<-rownames(DP)
        tmp<-enc2utf8(tmp)
        data.frame(污染物名称=tmp,值=DP)
  }, options=list(pageLength=20))
})

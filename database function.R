insert.to.db <- function(df,cntrow,dfname) {
  mydb = dbConnect(MySQL()
                   , user='root'
                   , password='123456'
                   , dbname='mis_oba'
                   , host='localhost')
    i <- 1
        if(dfname=="APPIN"){
                
                while(i <= cntrow) {
      
                 sqls <- paste("INSERT INTO mis_oba_appin (ID,APPLICATION_NO    ,CITIZEN_ID,CUSTOMER_NAME,PRODUCT_TYPE,PRODUCT_PROGRAM,PROGRAM_TYPE,CAMPAIGN_CODE,CARD_TYPE,APPLICATION_TYPE,DATE_ENTRY,REGISTER_BY,APPLICATION_STATUS,UPDATE_BY,UPDATE_BY_ROLE,CHANNEL,SALES_CODE,SALES_NAME,GROUP_LEADER_CODE,GROUP_LEADER,COST_CENTER,BRANCH_MANAGER_NAME,BRANCH_PHONE,BRANCH_CD,BRANCH_NAME,ZONE_CD,ZONE_NAME,REGION_CODE,REGION_NAME,MOBILE_NO,CREATE_DATE) VALUES (NULL,","'"
                                ,df$X__1[i],"','"
                                ,df$X__2[i],"','"
                                ,df$X__3[i],"','"
                                ,df$X__4[i],"','"
                                ,df$X__5[i],"','"
                                ,df$X__6[i],"','"
                                ,df$X__7[i],"','"
                                ,df$X__8[i],"','"
                                ,df$X__9[i],"','"
                                ,df$X__10[i],"','"
                                ,df$X__11[i],"','"
                                ,df$X__12[i],"','"
                                ,df$X__13[i],"','"
                                ,df$X__14[i],"','"
                                ,df$X__15[i],"','"
                                ,df$X__16[i],"','"
                                ,df$X__17[i],"','"
                                ,df$X__18[i],"','"
                                ,df$X__19[i],"','"
                                ,df$X__20[i],"','"
                                ,df$X__21[i],"','"
                                ,df$X__22[i],"','"
                                ,df$X__23[i],"','"
                                ,df$X__24[i],"','"
                                ,df$X__25[i],"','"
                                ,df$X__26[i],"','"
                                ,df$X__27[i],"','"
                                ,df$X__28[i],"','"
                                ,df$X__29[i],"','"
                                ,df$CREATE_DATE[i],"');",sep="")
                  tryCatch({dbSendQuery(mydb, sqls)},finally = print(paste("insert data successful ",dfname, "on record No",i,sep=" ")))
                 i <- i+1
                  dbClearResult(dbListResults(mydb)[[1]])
                  
                }
                
                # dbDisconnect(mydb)
        }
    else if(dfname == "PENDING"){
        while(i <= cntrow) {
        
        sqls <- paste("INSERT INTO mis_oba_pending (ID,APPLICATION_NO,APPLICATION_STATUS,APPLICATION_STATUS_DATE,PENDING_ROLE,PENDING_DAY,CHANNEL,MEMO,CREATE_DATE) VALUES (NULL,","'"
                      ,df$X__1[i],"','"
                      ,df$X__11[i],"','"
                      ,df$X__12[i],"','"
                      ,df$X__13[i],"','"
                      ,df$X__14[i],"','"
                      ,df$X__15[i],"','"
                      ,df$X__29[i],"','"
                      ,df$CREATE_DATE[i],"');",sep="")
        tryCatch({dbSendQuery(mydb, sqls)}
                 ,finally = print(paste("insert data successful",dfname,"on record No",i,sep=" ")))
        i <- i+1
        dbClearResult(dbListResults(mydb)[[1]])
        
        }

      
    }
    else if(dfname == "INCOMPLETE") {
      for (i in 1:cntrow) {
        sqls <- paste("INSERT INTO mis_oba_incomplete (ID,APPLICATION_NO,APPLICATION_STATUS,APPLICATION_STATUS_DATE,PENDING_DAY,DAY_OF_INCOMPLETE,REMARK1,REMARK2,CREATE_DATE) VALUES (NULL,","'"
                      ,df$X__1[i],"','"
                      ,df$X__11[i],"','"
                      ,df$X__12[i],"','"
                      ,df$X__13[i],"','"
                      ,df$X__14[i],"','"
                      ,df$X__15[i],"','"
                      ,df$X__16[i],"','"
                      ,df$CREATE_DATE[i],"');",sep="")
        tryCatch({dbSendQuery(mydb, sqls)},finally = print(paste("insert data successful" ,dfname," on record No",i,sep=" ")))
        # i <- i+1
        dbClearResult(dbListResults(mydb)[[1]])
        
      }
      # dbDisconnect(mydb)
    }
    else if (dfname == "APPROVE") {
      for (i in 1:cntrow) {
        sqls <- paste("INSERT INTO mis_oba_approve (ID, APPLICATION_NO, EMBOSS_NAME, CREDIT_LINE, CREDIT_LIMIT, CARD_LIMIT, APPLICATION_STATUS, APPLICATION_STATUS_DATE, USER_NAME_1, USER_NAME_2, PROCESSING_DAY, REMARK1, REMARK2, CREATE_DATE) VALUES (NULL,","'"
                      ,df$X__1[i],"','"
                      ,df$X__4[i],"','"
                      ,df$X__11[i],"','"
                      ,df$X__12[i],"','"
                      ,df$X__13[i],"','"
                      ,df$X__15[i],"','"
                      ,df$X__16[i],"','"
                      ,df$X__17[i],"','"
                      ,df$X__18[i],"','"
                      ,df$X__19[i],"','"
                      ,df$X__20[i],"','"
                      ,df$X__21[i],"','"
                      ,df$CREATE_DATE[i],"');",sep="")
        tryCatch({dbSendQuery(mydb, sqls)},finally = print(paste("insert data successful",dfname," on record No",i,sep=" ")))
        # i <- i+1
        dbClearResult(dbListResults(mydb)[[1]])
        
      }
      
      # dbDisconnect(mydb)
    }
    else if(dfname == "REJECT") {
      for (i in 1:cntrow) {
        sqls <- paste("INSERT INTO mis_oba_reject (ID,APPLICATION_NO,APPLICATION_STATUS,APPLICATION_STATUS_DATE,USER_ROLE,USER_NAME_,PROCESSING_DAY,REMARK1,REMARK2,RULE_A000,RULE_A001,RULE_A002,RULE_A003,RULE_A004,RULE_A005,RULE_A006,RULE_A007,RULE_A008,RULE_A009,RULE_A010,RULE_A011,RULE_A012,RULE_A013,RULE_A014,RULE_A015,RULE_A016,RULE_A017,RULE_A018,RULE_A019,RULE_A020,RULE_A021,RULE_A022,RULE_A023,RULE_A024,RULE_A025,RULE_A026,RULE_A027,RULE_A028,RULE_A029,RULE_A030,RULE_A031,CREATE_DATE) VALUES (NULL,","'"
                      ,df$X__1[i],"','"
                      ,df$X__11[i],"','"
                      ,df$X__12[i],"','"
                      ,df$X__13[i],"','"
                      ,df$X__14[i],"','"
                      ,df$X__15[i],"','"
                      ,df$X__16[i],"','"
                      ,df$X__17[i],"','"
                      ,df$X__32[i],"','"
                      ,df$X__33[i],"','"
                      ,df$X__34[i],"','"
                      ,df$X__35[i],"','"
                      ,df$X__36[i],"','"
                      ,df$X__37[i],"','"
                      ,df$X__38[i],"','"
                      ,df$X__39[i],"','"
                      ,df$X__40[i],"','"
                      ,df$X__41[i],"','"
                      ,df$X__42[i],"','"
                      ,df$X__43[i],"','"
                      ,df$X__44[i],"','"
                      ,df$X__45[i],"','"
                      ,df$X__46[i],"','"
                      ,df$X__47[i],"','"
                      ,df$X__48[i],"','"
                      ,df$X__49[i],"','"
                      ,df$X__50[i],"','"
                      ,df$X__51[i],"','"
                      ,df$X__52[i],"','"
                      ,df$X__53[i],"','"
                      ,df$X__54[i],"','"
                      ,df$X__55[i],"','"
                      ,df$X__56[i],"','"
                      ,df$X__57[i],"','"
                      ,df$X__58[i],"','"
                      ,df$X__59[i],"','"
                      ,df$X__60[i],"','"
                      ,df$X__61[i],"','"
                      ,df$X__62[i],"','"
                      ,df$X__63[i],"','"
                      ,df$CREATE_DATE[i],"');",sep="")
        tryCatch({dbSendQuery(mydb, sqls)},finally = print(paste("insert data successful",dfname, "on record No",i,sep=" ")))
        # i <- i+1
        dbClearResult(dbListResults(mydb)[[1]])
        
      }
      
      # dbDisconnect(mydb)
    }
    else if(dfname == "CANCEL") {
      for (i in 1:cntrow) {
        sqls <- paste("INSERT INTO mis_oba_cancel (ID,APPLICATION_NO,APPLICATION_STATUS,APPLICATION_STATUS_DATE,USER_ROLE,USER_NAME_,PROCESSING__DAY,REMARK1,REMARK2,CREATE_DATE) VALUES (NULL,","'"
                      ,df$X__1[i],"','"
                      ,df$X__11[i],"','"
                      ,df$X__12[i],"','"
                      ,df$X__13[i],"','"
                      ,df$X__14[i],"','"
                      ,df$X__15[i],"','"
                      ,df$X__16[i],"','"
                      ,df$X__17[i],"','"
                      ,df$CREATE_DATE[i],"');",sep="")
        tryCatch({dbSendQuery(mydb, sqls)},finally = print(paste("insert data successful",dfname, "on record No",i,sep=" ")))
        # i <- i+1
        dbClearResult(dbListResults(mydb)[[1]])
        
      }
      
      # dbDisconnect(mydb)
    }
    else if(dfname == "NCB") {
      for (i in 1:cntrow) {
        sqls <- paste("INSERT INTO mis_oba_ncb_reconcile (ID,APP_NO,DATE_OF_BIRTH,PRODUCT_TYPE,DATA_CHECKER_USER,TIMES,STATUS,CREATE_DATE) VALUES (NULL,","'"
                      ,df$X__2[i],"','"
                      ,df$X__5[i],"','"
                      ,df$X__6[i],"','"
                      ,df$X__7[i],"','"
                      ,df$X__8[i],"','"
                      ,df$X__9[i],"','"
                      ,df$CREATE_DATE[i],"');",sep="")
        tryCatch({dbSendQuery(mydb, sqls)},finally = print(paste("insert data successful",dfname, "on record No",i,sep=" ")))
        # i <- i+1
        dbClearResult(dbListResults(mydb)[[1]])
        
      }
      
      # dbDisconnect(mydb)
    }
    dbDisconnect(mydb)
}
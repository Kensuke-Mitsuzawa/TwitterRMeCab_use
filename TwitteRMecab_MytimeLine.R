library(twitteR);
library(ROAuth);
library(RMeCab);


#SSLKey Seting
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

#Twitter　oath
twit.oauth <- OAuthFactory$new(handshakeComplete = TRUE,
                               signMethod = "HMAC",
                               consumerKey = "consumerKey",
                               consumerSecret = "consumerSecret",
                               oauthKey = "oauthKey",
                               oauthSecret = "oauthSecret")
# OAuth認証の登録
registerTwitterOAuth(twit.oauth)
timeLine <- userTimeline("_trip_dancer", n=3200, maxID=NULL, sinceID=NULL,cainfo="cacert.pem")

#getTwitterimeLine
twiList <- "";
timeLineLength <- length(timeLine);                
for (i in 1:timeLineLength) {              
  twiList <- paste(twiList, timeLine[[i]]$text);
  twiList <- paste(twiList,",");
#  print(i)
#  b <- timeLine[[i]]$text
}  

write(twiList,"Timeline/Timeline.csv");

#TimeLine
result <- docMatrix("TimeLine",pos=c("名詞"),minFreq = 2)

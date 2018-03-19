# added 2nd time
source('http://rbenchmark.googlecode.com/svn/trunk/benchmark.R')
getMat<-function(file) {
 load(file)
 nums<-sapply(TRAIN,is.numeric)
 TRAIN=TRAIN[,nums]
 l<-lm(Derece ~ .-Gny-S, data=TRAIN)
 l<-lm(Gny ~ .-Derece-S, data=TRAIN)
 l<-lm(exp(1-S) ~ .-Derece-Gny, data=TRAIN)
}

benchmark(replications=rep(2,5),getMat('a.rda'))


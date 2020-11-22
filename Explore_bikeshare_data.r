
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

library(ggplot2)
summary(chi)
summary(ny)
summary(wash)
chSum = signif(sum(chi$Trip.Duration,na.rm=TRUE) / 86400,digits=2)
nySum = signif(sum(ny$Trip.Duration,na.rm=TRUE) / 86400,digits=2)
whSum = signif(sum(wash$Trip.Duration,na.rm=TRUE) / 86400,digits=2)
xdata <- data.frame("City" =  c ('Chicago','New York','Washington'), "Sum" = c (chSum , nySum , whSum ))
ggplot(data = xdata, aes( City,Sum, fill=City)) + geom_bar(stat="identity") +   geom_text(aes(y =ave(Sum, City, FUN = sum), label=ave(Sum, City, FUN = sum))) + labs (x='Name of Cities') + labs(y='Total of Travel Time (days)') + labs (title = 'Comparison of the total travel in three cities:') 
xdata


  


library(ggplot2)
summary(chi$Trip.Duration)
summary(ny$Trip.Duration)
summary(wash$Trip.Duration)
chMean = signif(mean(chi$Trip.Duration,na.rm=TRUE),digits=2)
nyMean = signif(mean(ny$Trip.Duration,na.rm=TRUE),digits=2)
whMean = signif(mean(wash$Trip.Duration,na.rm=TRUE),digits=2)
x <- data.frame("City" =  c ('Chicago','New York','Washington'), "Mean" = c (chMean , nyMean , whMean ))
ggplot(data = x, aes( City,Mean, fill=City)) + geom_bar(stat="identity") +   geom_text(aes(y =ave(Mean, City, FUN = sum), label=ave(Mean, City, FUN = sum))) + labs (x='Name of Cities') + labs(y='Total of average travel Time (Seconds)') + labs (title = 'Comparison of the average travel time in three cities:') 


library (plyr)
summary(chi)
ChiUserType= count(subset(chi,User.Type!=''),vars='User.Type')
ChiUserType
ggplot(data = ChiUserType, aes( User.Type,freq, fill=User.Type)) + geom_bar(stat="identity") +   geom_text(aes(y =ave(freq, User.Type, FUN = sum), label=ave(freq, User.Type, FUN = sum))) + ggtitle('Chicago') + labs (x='User Type') + labs(y='Total Count') + labs (title = 'Comparison of the count for each user type in Chicago:')

library (plyr)
summary(ny)
nyUserType= count(subset(ny,User.Type!=''),vars='User.Type')
nyUserType
ggplot(data = nyUserType, aes( User.Type,freq, fill=User.Type)) + geom_bar(stat="identity") +   geom_text(aes(y =ave(freq, User.Type, FUN = sum), label=ave(freq, User.Type, FUN = sum))) + ggtitle('New York City') + labs (x='User Type') + labs(y='Total Count') + labs (title = 'Comparison of the count for each user type in New York City:')

library (plyr)
summary(wash)
washUserType= count(subset(wash,User.Type!=''),vars='User.Type')
washUserType
ggplot(data = washUserType, aes( User.Type,freq, fill=User.Type)) + geom_bar(stat="identity") +   geom_text(aes(y =ave(freq, User.Type, FUN = sum), label=ave(freq, User.Type, FUN = sum))) + ggtitle('Washington City') + labs (x='User Type') + labs(y='Total Count') + labs (title = 'Comparison of the count for each user type in Washington City:')

system('python -m nbconvert Explore_bikeshare_data.ipynb')

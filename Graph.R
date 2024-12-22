library(ggplot2)
# Sample data
df <- data.frame(
  Hotstreak = c("0","1","2","3","4","5+"),
  Games = c(24002,8918,3657,1712,882,496),
  Label=c("0","1","2","3","4","5+")
)

# Create a ggplot bar graph without gaps on both axes
ggplot(df, aes(x = Hotstreak, y = Games, fill = Label)) +
  geom_bar(stat = "identity",width=1) + 
  scale_x_discrete(expand = c(0, 0)) +  # Remove gap on x-axis
  scale_y_continuous(expand = c(0, 0)) +  # Remove gap on y-axis+
  scale_fill_manual(values=c("lightseagreen",
                            "lightblue", 
                            "seagreen1", 
                            "thistle",
                            "peachpuff",
                            "salmon")) +
  theme(legend.position = "none")+
  theme(panel.background = element_blank())+
  theme(
    axis.title.x = element_text(family = "sans", face = "bold", size = 14), # X-axis title properties
    axis.title.y = element_text(family = "sans", face = "bold", size = 14))+
  labs(x = "Hot streak length", y = "Matches")


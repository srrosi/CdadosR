rn <- rnorm(2)
sm <- sample(1:2, 2)
sq <- seq(2)
rp <- rep(c(1:2),2)


df <- expand.grid(Rnorms = c(rn),
                  Samples = c(sm),
                  Sequencia = c(sq),
                  Repetição = c(rp))

summary(df)

write_csv(df, "Secao1/df.csv")

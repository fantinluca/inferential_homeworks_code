s = c(30,23,24,45,24,34,50,52)

f = ecdf(s)

for (a in unique(sort(s))) {
  print("-----")
  print("value:")
  print(a)
  print("ecdf:")
  print(f(a))
}
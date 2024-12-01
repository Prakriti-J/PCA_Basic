using .BasicPCA

path = "/home/prakriti/Downloads/PCA_Basic/TrialData.csv"
delim = ' '
dims = 2
df = get_numeric_df(path, delim)
A = get_transform_matr(df, dims)
red_def = converted_df(df, A)
print(red_def)

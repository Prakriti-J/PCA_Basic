using .BasicPCA
using Plots

path = "/home/prakriti/Downloads/PCA_Basic/TrialData.csv"
delim = ' '
dims = 2
df = get_numeric_df(path, delim)
A = get_transform_matr(df, dims)
red_df = converted_df(df, A)
print(red_df)

scatter(df[!,1], df[!,2], df[!,3], title="Original Data")
scatter(red_df[!,1], red_df[!,2], title="Reduced Data")
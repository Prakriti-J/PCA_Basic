# PCA_Basic
A module called BasicPCA that can run PCA on numerical columns of a given csv file.
Can only be used as a local module.

###List of Functions:
- get_numeric_df(csv_file, delimiter): Eliminates non-numeric data from a csv file and returns a numeric dataframe. Can also check if file has a header or not, and handle it accordingly.
- get_transform_matr(df, dims): Given a numerical dataframe and desired number of dimensions, returns a transformation matrix to perform the reduction.
- converted_df(df, transformation_matrix): Given a dataframe and a transformation matrix, returns the reduced dataframe.

For examples of functions performed and syntax, refer UnitTest.jl
Still need to update Unittest.jl so that it contains code to perform actual unit tests, right now it's just a placeholder with an example.

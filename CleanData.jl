using CSV, DataFrames

export numeric_df

function csv_to_df(path::AbstractString)
    df = read(path, DataFrame) # Later add mechanism for reading files with no header
    return df
end

function numeric_df(path::AbstractString)
    df = csv_to_df(path)
    numeric_df = df[:, [col for col in names(df) if eltype(df[!, col]) <: Number]]
    dropmissing!(numeric_df)
    return numeric_df # output = numeric columns only, withh all Null data points removed
end
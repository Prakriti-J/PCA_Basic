using CSV, DataFrames

export get_numeric_df

function csv_to_df(path::AbstractString, delimiter::AbstractChar)
    firstline = readline(path, keep=true)
    firstline = split(firstline, delimiter)
    is_header = all(x -> isnothing(tryparse(Float64, x)), firstline)
    if is_header
        df = CSV.read(path, DataFrame; delim=delimiter) # Added mechanism for reading files with no header
    else
        df = CSV.read(path, DataFrame; delim=delimiter, header=false)
    end
    return df
end

function get_numeric_df(path::AbstractString, delimiter::AbstractChar)
    df = csv_to_df(path, delimiter)
    numeric_df = df[:, [col for col in names(df) if eltype(df[!, col]) <: Number]]
    dropmissing!(numeric_df)
    return numeric_df # output = numeric columns only, with all Null data points removed
end
module {{_name_}}

Base.@ccallable function julia_main()::Cint
    true_main()
end

function true_main()
    {{_cursor_}}
end

end

function I = array_to_letter(a)
    [~,I]=min(abs(1-a));
    if I<9
        I=I+96;
    elseif I==26
        I=46;
    elseif I==27
        I=44;
    else
        I=I+97;
    end
end
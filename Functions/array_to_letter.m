function I = array_to_letter(a)
    [~,I]=min(abs(1-a));
    I=I+39;
end
b=$(pacman -Qu | wc -l);

if [[ "$b" -ne "0" ]]; then 
  printf " $b";
else
	printf " 0";
fi

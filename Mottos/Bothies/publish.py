





import os


ride = "5e7acf0a1945fff9e94d771a790c2a230b646f29288dbe31e8dc5182750e27c2"

#os.system (f"cd /Metro/Mottos/Bothies/Bothy && aptos move publish --assume-yes --named-addresses ride={ ride }");

os.system (f"cd /Metro/Mottos/Bothies/Bothy_Thermoplastic && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Bothies/Bothy_Mwanaanga && aptos move publish --assume-yes --named-addresses ride={ ride }");
#os.system (f"cd /Metro/Mottos/Bothies/Bothy_Tivaevae && aptos move publish --assume-yes --named-addresses ride={ ride }");


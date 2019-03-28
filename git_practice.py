print("Hello world");

print("hotfix1");

print("hello world3");

print("hello world4");

print("hello world5");

#Updates on Local
print("hello world Changed on Local");

#Update on main branch on Github
print("Hello Worlds Update on GitHub");

#Second update on GitHub
print("Hello World Second update on GitHub");


pstr = "cryptographisfun";
plstr = list(pstr);
print(plstr)
setMul26 = [1,3,5,7,9,11,15,17,19,21,23,25];
setAdd26 = list(range(26));
def crypto(p,i):
    key1 = setMul26[i % 12];
    key2 = setAdd26[i % 26];
    return chr(((((ord(plstr[i]) - 97) * key1) + key2) % 26) + 65)
clstr = [];
for idx,p in enumerate(plstr):
    clstr.append(crypto(p,idx));
print(clstr)


ciperT = "XPALASXYFGFUKPXUSOGEUTKCDGFXANMGNVS"
ciperTlist = list(ciperT);
print(ciperT)

def decrypto(x):
    key1 = 5; key2 = 6; key1_inv = -5;
    return chr( (((ord(x)-65)-key2) * key1_inv)%26 +65 )
pl = [];
for c in ciperTlist:
    pl.append(decrypto(c));
print(str(pl))
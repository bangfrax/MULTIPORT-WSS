#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/squidvpn/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/squidvpn/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/squidvpn/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/bangfrax/MULTIPORT-WSS/main/permission/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/bangfrax/MULTIPORT-WSS/main/permission/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/bangfrax/MULTIPORT-WSS/main/permission/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
         �                    �                    `-                    �-                    (                    0                    8                    @                    H                    P                    X         	           `         
           h                    p                    x                    �                    �                    �                    �                    �                    �                    �                    �                    �                    �                    �                    H��H�  H��t��H��� �52  �%4  @ �%2  h    ������%*  h   ������%"  h   ������%  h   �����%  h   �����%
  h   �����%  h   �����%�  h   �p����%�  h   �`����%�  h	   �P����%�  h
   �@����%�  h   �0����%�  h   � ����%�  h   �����%�  h   � ����%�  h   ������%�  h   ������%�  h   ������%�  h   ������%�  h   �����%�  h   �����%�  h   �����%�  f�        1�I��^H��H���PTL�Z  H��  H�=  �V  �D  H�=�   UH��   H9�H��tH�*  H��t]��f.�     ]�@ f.�     H�=�   H�5�   UH)�H��H��H��H��?H�H��tH��  H��t]��f�     ]�@ f.�     �=a    u/H�=�   UH��tH�=�  �����H����9   ]��    ��fD  UH��]�f���UH���-!   �&!  �!  �!  �!  �
!  ��� !  Hc�H��  ���   ����   ��   ��uǐ]�UH��H�}�u�H�E�H�E���   ��   ��Hc�H��  ��E���   �E�Ј�   ��   ����}��Hc�H�E�H���m   Јe   �^   ���R   ��Hc�H�E  �Hc�H�7  ��/   ��Hc�H�   �M���   ���	   �   ���=���H�E�   �m�   �}� �$����]�UH��H�}�u�H�E�H�E���   ��  ����  ��  ��Hc�H��  ��E���  �E�Ј�  ��  ���w  ��Hc�H�j  �Hc�H�\  ��S  ��Hc�H�E  �M���7  ��Hc�H�*  � E�H�E���E�Hc�H�  �1���H�E��H�E��m��}� �'����]�UH��H��@  H������dH�%(   H�E�1�H������H������H��H����  ��y
������   H��`�����   �    H���)���H������H��h���H������H��`���H������H�E���������|����������E�H�� ���H�E�H��(���H�E�H��8���H�E�H��`�����   H���C����    H�M�dH3%(   t������UH��H�}�H�u��H�E�H�}� t/H�E�H� H��t#H�E�H� H9E�u��H�E�H�PH�E�H�H�E�H�}� tH�E�H� H��uِ]�UH��H��P  ������dH�%(   H�E�1������H�H�������5���H��  H�����H)�H�Љ�H�=�����t����@  H�=�  �c���H�������   H���O���H�������   H���2���H������H������H�5c  H�Ǹ    �N���H������H���/���H������H������H���I���������H������ uXH������H������������Hc�H�<��������H��H�5�  �    �����H������H������H���;����    �   H������H������H������H������I��H�5�  H�Ǹ    �n���������������uRH������H������H9�u?��������H�H�P�H������H�H��  H��H�������������������)Ѓ�������H�M�dH3%(   t�D�����UH��]�UH��SH��H�}�H�u�H�E�H� H�E�H�}� uH�=   �����H�E�H�}� u*H�K  H���    �   H�=�  ������   �����E��������E�� ����   H�=  �P����A   H�=Q  �6����   H�=�  �%����z  ��t*H�=o  �����H�ÿ    �����H9�}H�  �  �
   H�=�  ������   H�=Q  ������   H�=�  �����   H�=�  �����   H�=  �����   H�=�  �����   H�=  �y����   H�5�  H�=�  �������tH��  �  �   H�=$  �@����}� yH�  ��  �E���
H��   H������H�E�H�}� u
�    ��  �}� �
  �   H�=k  ������_  ��uH�=�  �������tH��  �  �   H�=  �����P  H�=X  �����   H�=	  �����   H�=�  �����   H�=   �m����   H�5�  H�=�  �������tH��  �  �P  �I���H�E�H�}� u
�    ��  H�Eغ   �    H������H�E�H   �P  H�5�  H��������P��  ��t=�   �����H�E�H�}� u
�    �  H�U�H�E�H�5�  H�Ǹ    ������H�E�H�E��E�    �EЍP�U�H�H��    H�E�H�H�E�H� H��}� t/��	  ��t$�EЍP�U�H�H��    H�E�H�H��	  H���  ��t$�EЍP�U�H�H��    H�E�H�H��  H��EЍP�U�H�H��    H�E�H�H�E�H���  ��t$�EЍP�U�H�H��    H�E�H�H��  H��}�~�E���    �E��;�E̍P�U�H�H��    H�E�H��EЍP�U�H�H��    H�E�H�H�H��E�;E�|��E�H�H��    H�E�H�H�     H�E�H��H�=4  �i���H�(  H��H[]�UH��ATSH���}�H�u�H�E�H�XH�U��E�H�։��5���H�H�E�H��H� H��t
H�E�H�X�H�]  ����� ��t����� ���C���I���L�%?  ������ ��t	H�.  �H�$  H�U�H�H�=N  I��M��H��H�5
  �    �D����   H��[A\]�fD  AWAVI��AUATL�%�  UH�-�  SA��I��L)�H��H���7���H��t 1��     L��L��D��A��H��H9�u�H��[]A\A]A^A_Ðf.�     ��f.�     @ H��H���   �����H��H���             x%lx =%lu %d %lu %d%c _ E: neither argv[0] nor $_ works. <null>  :  %s%s%s: %s
 ;�      �����   �����   ����   ���  s���0  j���P  ^���p  K����  �����  �����  �����  =���  ���8  x����  �����             zR x�      `���+                  zR x�  $      ����p   FJw� ?;*3$"       D   ����              \   ����a    A�C\     |   ;����    A�C�     �   ����    A�C�     �   �����    A�C�     �   ����_    A�CZ     �   �����   A�C�      ����    A�CB       <  �����   A�CE��      `  !����    A�CG��� D   �  ����e    B�B�E �B(�H0�H8�M@r8A0A(B BBB    �  ����              �  ����                                                                                                                                                                                                                                                                                   `                                  �
             �                                                            ���o    �             �             �      
       d                                                                                  �             �             �       	                            ���o          ���o    x      ���o           ���o    4      ���o                                                                                                                  �
                  &      6      F      V      f      v      �      �      �      �      �      �      �      �                  &      6      F                                                                             `�� �]�(�|����Ӫ�h����M���r��b��GS8|�+��Ӂ��T|W�x/�?|t�m��IIy$��]�JT�C���qZ�����u�����+,GP��g_;��h�U�GW�,��m���2�G���LK�0���5ݣ���m#DI@�	*K�]6��ίLi��,L����V|�T���R�l�cW^���=B~��FӇVP*��������"��3�{p4�`��̉���3�\�a�l��	��|(���*��#���~�2I@��Z�C��M��QIGB�q6��+C����+���.��M��><�%��5�'�G]�܉�b4�����iO�Ta~R�]�yػ0Ap�2�Mml�Ӳ�RпSػ�
>Q^�H膞 4�
sTiY�ҊcZ
\�q��\�r;@M%E��z6�&:��Q��?D�#]�?�2���(�����/��1�&�&�[Q`ο%c	��k�8�/�K�kM�葟ɺ��6�4s@)�����<]����,HcH�Fd���,b��=�v���>�#��$̈���8o���-m�h�ѓ)�rq ^���=�L��hyu���~C����QhzR�.�o=���*�&�rMZ8��S'R�l�J�/H��š�Ŀ��QiB\�N��ک"��~~���{$y?�޵sA��2J ������"�}F�s.�c	m�쨥���r��_��nf���}-Y>��W�/��8-��:���W�V�ma=٘ah��3��P.ʴ���(���TLa�2�ݪ������4t�bEqW�tj |(6� R��� l34xVa�q'/�-��=^r�Τ��S�����?_Fjݣ��ѷ�ؕ����t����=o��5gSwPrUAen�_��B\��n�x�wz�ΰly��?]EF�>�f�â��ԧ��8���!bz667��#�>Q�_!����Ғ�JC�-�����vr����7�>a昗#�Q�r"U幒�l*��w�N%Q�9�� �v�aKx��UrGQ2b���D���D%�2�ˢ�
\TZ�]?�0׬5z���i�:@�r�H5�|�}Р��።����a	��	�f�z%[�9\/랩*�	3�dz�.)�&%����YV#|a=�P��D2y�e�9)Jĩuml�4iR�+�f1-���%�KxM� ��ra>q��Kݬr���f��EeU�Z���{'t�rW]x�|�x��d�=�g��KD^j�Zト k�3�<�]��hw�+)tT���!ǽ2��SD�
��R�[�������o'��'�z�@1t�1�X��5A��o�S�C=�����0O�D�: ����
I?��8M�[��?O=��T*��rf�ģ���bI��������/wKR���K���!H���O�sPo|�R�j,(s���
�$�Z+�+�)���A��������@�2 V���0�7X`���ZȽn��4�`���	����e�s9�zZ�C�1@ζU�|�������Č���t>����zk�՗L�|��2|�Q}X��J��菟�0[O^s%�4�[��S�l�F�=z���� /�KK�߸��e��(P�t*r�2��ű��'���{~���Q�J�ԷQu�����|ru�J��7i�."�p@�}1�Gkʐ��8l�ike�
4�ʰD���p�N����:�X]c]	�"��ɒd��BY��i�����3��
$����ʴq���)"6J%+�sO]3�khD��,��ij(l����8hAE4qw�/{&G�0��-P�>Ľ��F�̪E^XW��SB����|�۾f��ݑ+l;(}&X�	��w����em��!ڱ{/�tt�g�n|ZX�`�@T23Ĉ���#����v[s R	��v`�g���)LC͟�����n���P�+�[ke;e���&��ѡ��G�� $
氜�?c�o �<�VrsۊysT�b%t�����z%��D�t��
�m^�8��7���O&uo�7���J^VL.v�%8e��x���Z����j�����f�Ք���4ʯg-�>�91�.��l��|,F�hN��~��ۇ��AP�rÒ�o���1�>	\L��5~�U��Z+�,(�2��d*v�cwN���S���������zG[k�C�"�)r�bk��Q�&��\q� k������Y�����-H��\�L� ��2Ð����|(F*����^���B�a[����?0�hY��?54@�e��>ќ�b�IӺX��8�,׈����*� ��o���m�� i��=�S�N��U�+
=�w�Y����?��=�m�.#Җ/;L�@^���
�#Ui�$JW�;Aۘ�s�g��ӊ���g˺�Nh���@�o:�Cl�"�A�
h��Ks`�yI���fZ��h�g0jp�
������+1�TQ� z�@siSS,�e�̨���zF�I���J���fO?C����yf_����+�����=�v�Ҷ竹��a)�ۏ���u���p�`6�~�O�J�`|H�5Ղ��[r�:j}��<iӜ�kg�ײ�7���1U�Tu;㯥`^�s�	G7��Rl*��a���*7D㋹nh���dCbn��=�*��y��Z�������d\�ȟ<7*�Og�y�g�T�)���@�D^+��=GG�SG*�x���x3a\��!wfk�IV������J�t�c��,
�Ik)`J#װ�z��Z��R-	����u)G�4�=��%�9�Q3��� ��*�ɭ�w"ž��Ү�����oы�'l�Hj�r�;�R��q�CF�T�C�ͳ�Xs�ɋ��c?�sʨ
�f$J:<OD+.����9����H��ջ��nn�4�] x�ф�Re*�dW���.���Bϼ�d��=�(t��� �V.KN�@����wk�A����
�}Gx��
/W
�k`.��-�w$�m�5C���چ�y;����Oںgq6i�[4��i?�M)��'�W�N]�7X�?ʝv3,�h(��h��I�q��NT�����KE"�Ii�71��ͣ0�ވb��8�\+w?v�b���կd��
�c��zE��zY�϶�F�UW�R�S�?:MJ���w+=.�F><�\�q`BS�WLJ���RI�V������Few��������rMB�w^�ܵ�2���`�d�(>�e g"K����QG��E�S=���/���x�Z�&M���~��B�l�ˇ5I�i\���YQ�������6D��⦐S�QGb4!FM̉�v�W�{Nm��K�9О0�$�,u5@�ST���Hr��Ʈ#�O��c����t�NP��E2�O
�Ov�l_�����F�V*�m�Vm��EZ�3�=� GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0  .shstrtab .interp .note.ABI-tag .note.gnu.build-id .gnu.hash .dynsym .dynstr .gnu.version .gnu.version_r .rela.dyn .rela.plt .init .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame .init_array .fini_array .dynamic .data .bss .comment                                                                               8      8                                                 T      T                                     !             t      t      $                              4   ���o       �      �      4                             >             �      �                                 F             �      �      d                             N   ���o       4      4      @                            [   ���o       x      x      P                            j             �      �      �                            t      B       �      �                                ~             �
      �
                                    y             �
      �
      p                            �             P      P                                   �             `      `      �                             �             �      �      	                              �                           X                              �             X      X      �                              �             �      �      (                             �                                                      �                                                      �                           �                           �                         �                             �                             `                              �             `-      `-      H                              �      0               `-      )                                                   �-      �                              
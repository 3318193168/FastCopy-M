FastCopy-M
===========
"M" is Multilanguage

## FastCopy-M feature | FastCopy-M�ص�

* ������֧�ָ��������Ķ��������ʾ���������ֻ��Ҫ�޸���Դ�ļ����ɡ�<br />
FastCopy Chinesization and modify to support other language more overall, add language only need add new resources

* Vista�Ժ�֧���°��ļ�/�ļ���ѡ��򣨿ɶ�ѡ��<br />
After Vista support new Shell common file dialog (Easy-to-use, and can select folder multiple)<br />
![Folder select](http://ww3.sinaimg.cn/large/6c84b2d6gw1ewb4gmu1hij20mc0gjjwt.jpg)
![File select](http://ww1.sinaimg.cn/large/6c84b2d6gw1ewb4guswqvj20lo0g4gqz.jpg)

* �����渴��ʱͼ��Ҳ��ʾ�������������޸Ķ�����֡��<br />
The main window icon displayed animation when runing copy process. And allows to modify the total number of animation frames.<br />
![Main window icon animation](http://ww3.sinaimg.cn/large/6c84b2d6gw1ewbcz4bxdbj20b00hnwhb.jpg)

* ֧�ֵ�������URL��Ϊ�����ļ�����Դ�ļ��ڡ�IDS_FASTCOPYHELP���޸�Ϊ��ҳurl���ɡ�<br />
Support use http url to replace "chm" help files, change "IDS_FASTCOPYHELP" in resource to your URL.<br />
![URL help](http://ww4.sinaimg.cn/large/6c84b2d6gw1ewbd1y0bygj20rw0le4bq.jpg)

* �����չ����ͼ�ꡣ<br />
Shell Extension add icon.<br />
![Shell Extension icon](http://ww3.sinaimg.cn/large/6c84b2d6gw1ewbd5egv8jj20rj0hpjxc.jpg)

### Build | ����
FastCopy-M����VS2015������������滻���̵�ԭʼ�汾�����ֶ��޸��ļ��ڰ汾�ţ�����VS2013��2012�ϱ��롣Ŀǰ�ȹٷ�����Ҫ���á�shlwapi.lib����<br />
FastCopy-M used VS2015, if you want bulid on VS2013 or earlier you can replace the "*.sln", "*.vcxproj" to original version (or modify project version in these file) by your self. Additional Dependencies need include "shlwapi.lib" after ver3.0.4.20.

## Release Download

http://www.mapaler.com/fastcopy-m/

## Auto Change Icon | �Զ�����ͼ�� 

* ��ѹ��FastCopy-M Resources Rebuild & Replace Tools.zip���������ߡ�<br />
Unzip "FastCopy-M Resources Rebuild & Replace Tools.zip" basic tools.
* ����Auto Change Icon Tools.zip����ѹ��������ѹ�������ļ����С�<br />
Unzip this "Auto Change Icon Tools.zip" to previous folder.
* �ڡ�My New Icon���ļ����ڰ���1��2��3������˳������ͼ�꣬���һ��ͼ���ǵȴ�ͼ�ꡣ<br />
Put your customize icon animate group, and rename to "1.ico","2.ico","3.ico"... Attention: The final icon file as wait icon.<br />
![Rename Icon](http://ww2.sinaimg.cn/large/6c84b2d6jw1ewbqj5xriyj20oa0cugoj.jpg)
* Ȼ�󽫡�FastCopy.exe���ϵ���Change Icon.vbs���ϼ��ɡ�<br />
Then drag original "FastCopy.exe" and put on "Change Icon.vbs" . <br />
![Drag](http://ww4.sinaimg.cn/large/6c84b2d6jw1ewbqkhud8aj20hx0b6ace.jpg)
* ���Զ�������滻��Դ�������浽��output\FastCopy.exe����<br />
Then will auto begin rebuild and replace resources.  And generate to "output\FastCopy.exe".<br />
![New Icon](http://ww2.sinaimg.cn/large/6c84b2d6jw1ewbqkq4qh9j20f4089wfa.jpg)

### Download Tools

* [FastCopy-M Resources Rebuild & Replace Tools.zip](https://github.com/Mapaler/FastCopy-M/releases/download/v3.0.4.20/FastCopy-M.Resources.Rebuild.Replace.Tools.zip)
* [Auto Change Icon Tools.zip](https://github.com/Mapaler/FastCopy-M/releases/download/v3.0.4.20/Auto.Change.Icon.Tools.zip)

## Official website | FastCopy�ٷ���վ

http://ipmsg.org/tools/fastcopy.html
 
##Official License | FastCopy�ٷ����
<div class="help_license">
	FastCopy ver3.0 Copyright(C) 2004-2015 by SHIROUZU Hiroaki
	<br />
	<br />
	This program is free software. You can redistribute it and/or modify it under the GNU General Public License version 3(GPLv3).
	<br />
	<a href="http://ipmsg.org/tools/license-gpl3.txt">license-gpl3.txt</a>
	<br />
	<br />
	If you want to distribute your modified version, but you don't want to distribute the modified source code, or you want to request to develop bundle/special versoin, please contact me. (shirouzu@ipmsg.org)
</div>
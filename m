Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C61E140AB28
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Sep 2021 11:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7zDb3jjSz2yMM
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Sep 2021 19:53:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ScR/Ohv9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=lkammath@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ScR/Ohv9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4SVb03Dpz2xlC
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Sep 2021 02:37:58 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 188GXlEx115901; Wed, 8 Sep 2021 12:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : in-reply-to :
 from : to : cc : date : message-id : content-transfer-encoding :
 content-type : mime-version : references; s=pp1;
 bh=L0kqvzSc/yGpS6SHV0h5C3JSSAsStW63Q1E1JoKzNXQ=;
 b=ScR/Ohv9eqNKDcqiRX3C5mampslX6CT6Pby/sZfcbvUjj+wGeRA1TJLzfntx48uggs8j
 hQ8Q43qCtg7LjiWm2zOpqhlhDpTIREbQVzTXbMHJHk0Az1ab/ou0dEuJlSikoqQ6HyN3
 FLrl/d0Pi5CvFQP3ZIRlQ+xyjE2h/aaFUsQSzh8b+ilErj00wL09r33xvuGNMQWaRdTm
 Zurakn82MO/rq8j/E/4TDKxF055zBGnqrsum//OqXw+EfTaPcgZewbU5PgaIH7yvA1z7
 +ZllP/hswOjrLqhtH12L53SHgLQwcxCqf4PvVcLAReDxy+pxK21dEEisixNKWgLqCu4k 9Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3axyf0at03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 12:37:46 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 188GW1Dl019824;
 Wed, 8 Sep 2021 16:37:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3axcnj5ppk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 16:37:45 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 188Gbir229753612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Sep 2021 16:37:44 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B71F6A057;
 Wed,  8 Sep 2021 16:37:44 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB8EF6A054;
 Wed,  8 Sep 2021 16:37:43 +0000 (GMT)
Received: from mww0032.dal12m.mail.ibm.com (unknown [9.208.69.88])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Sep 2021 16:37:43 +0000 (GMT)
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: everest: Add I2C bus 15 muxes
In-Reply-To: <20210903214836.48286-3-eajames@linux.ibm.com>
From: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>
To: eajames@linux.ibm.com
Date: Wed, 8 Sep 2021 16:37:42 +0000
Message-ID: <OF57240B52.94445935-ON0025874A.005B57DA-0025874A.005B57DD@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
MIME-Version: 1.0
References: <20210903214836.48286-3-eajames@linux.ibm.com>,
 <20210903214836.48286-1-eajames@linux.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0032/03/M/IBM at 09/08/2021 16:37:42,
 Serialize complete at 09/08/2021 16:37:42
X-Disclaimed: 28107
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OLNzAXZ1pibgDu8BChVmgqsROeXkHsGv
X-Proofpoint-ORIG-GUID: OLNzAXZ1pibgDu8BChVmgqsROeXkHsGv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_06:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109080103
X-Mailman-Approved-At: Tue, 14 Sep 2021 19:53:01 +1000
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Approved. Tested an=
d working fine</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D=
"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"lt=
r" >Thanks &amp; Regards,<br>Lakshminarayana Kamath<br>--------------------=
---------------------------------------------------------------------------=
---<br>Senior Engineer, Power Firmware Verification and DevOps Enablement (=
FSP &amp; BMC RAS)</div>
<div dir=3D"ltr" >D3 Block, <font size=3D"2" >1st Floor Floor, MD3-1F-B279<=
/font>,<br>Manyata Embassy Business Park,<br>Nagawara Outer Ring Road,<br>B=
angalore - 560045<br>email:lkammath@in.ibm.com<br>+Mobile : +91-9980-902931=
<br>-----------------------------------------------------------------------=
----------------------------</div>
<div dir=3D"ltr" >&nbsp;</div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Eddie James" &lt;=
eajames@linux.ibm.com&gt;<br>To: linux-aspeed@lists.ozlabs.org<br>Cc: linux=
-arm-kernel@lists.infradead.org, joel@jms.id.au, andrew@aj.id.au, lkammath@=
in.ibm.com, "Eddie James" &lt;eajames@linux.ibm.com&gt;<br>Subject: [PATCH =
2/2] ARM: dts: aspeed: everest: Add I2C bus 15 muxes<br>Date: Sat, Sep 4, 2=
021 3:18 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Add the muxes that are attached on I2C bus 15.<br><br>Signed-off-by: E=
ddie James &lt;eajames@linux.ibm.com&gt;<br>---<br>&nbsp;arch/arm/boot/dts/=
aspeed-bmc-ibm-everest.dts | 158 +++++++++++++++++++<br>&nbsp;1 file change=
d, 158 insertions(+)<br><br>diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-e=
verest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts<br>index 2efd7066=
6738..e7da58595d14 100644<br>--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest=
.dts<br>+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts<br>@@ -96,6 +96,=
18 @@ aliases {<br>&nbsp; i2c32 =3D &amp;i2c14mux1chn1;<br>&nbsp; i2c33 =3D=
 &amp;i2c14mux1chn2;<br>&nbsp; i2c34 =3D &amp;i2c14mux1chn3;<br>+ i2c35 =3D=
 &amp;i2c15mux0chn0;<br>+ i2c36 =3D &amp;i2c15mux0chn1;<br>+ i2c37 =3D &amp=
;i2c15mux0chn2;<br>+ i2c38 =3D &amp;i2c15mux0chn3;<br>+ i2c39 =3D &amp;i2c1=
5mux1chn0;<br>+ i2c40 =3D &amp;i2c15mux1chn1;<br>+ i2c41 =3D &amp;i2c15mux1=
chn2;<br>+ i2c42 =3D &amp;i2c15mux1chn3;<br>+ i2c43 =3D &amp;i2c15mux2chn0;=
<br>+ i2c44 =3D &amp;i2c15mux2chn1;<br>+ i2c45 =3D &amp;i2c15mux2chn2;<br>+=
 i2c46 =3D &amp;i2c15mux2chn3;<br>&nbsp;<br>&nbsp; serial4 =3D &amp;uart5;<=
br>&nbsp;<br>@@ -2816,6 +2828,152 @@ eeprom@50 {<br>&nbsp;<br>&nbsp;&amp;i2=
c15 {<br>&nbsp; status =3D "okay";<br>+<br>+ i2c-switch@70 {<br>+ compatibl=
e =3D "nxp,pca9546";<br>+ reg =3D &lt;0x70&gt;;<br>+ #address-cells =3D &lt=
;1&gt;;<br>+ #size-cells =3D &lt;0&gt;;<br>+ i2c-mux-idle-disconnect;<br>+<=
br>+ i2c15mux0chn0: i2c@0 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ #size-c=
ells =3D &lt;0&gt;;<br>+ reg =3D &lt;0&gt;;<br>+<br>+ eeprom@50 {<br>+ comp=
atible =3D "atmel,24c64";<br>+ reg =3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+<b=
r>+ i2c15mux0chn1: i2c@1 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ #size-ce=
lls =3D &lt;0&gt;;<br>+ reg =3D &lt;1&gt;;<br>+<br>+ eeprom@50 {<br>+ compa=
tible =3D "atmel,24c64";<br>+ reg =3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+<br=
>+ i2c15mux0chn2: i2c@2 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ #size-cel=
ls =3D &lt;0&gt;;<br>+ reg =3D &lt;2&gt;;<br>+<br>+ eeprom@50 {<br>+ compat=
ible =3D "atmel,24c64";<br>+ reg =3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+<br>=
+ i2c15mux0chn3: i2c@3 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ #size-cell=
s =3D &lt;0&gt;;<br>+ reg =3D &lt;3&gt;;<br>+<br>+ eeprom@50 {<br>+ compati=
ble =3D "atmel,24c64";<br>+ reg =3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+ };<b=
r>+<br>+ i2c-switch@71 {<br>+ compatible =3D "nxp,pca9546";<br>+ reg =3D &l=
t;0x71&gt;;<br>+ #address-cells =3D &lt;1&gt;;<br>+ #size-cells =3D &lt;0&g=
t;;<br>+ i2c-mux-idle-disconnect;<br>+<br>+ i2c15mux1chn0: i2c@0 {<br>+ #ad=
dress-cells =3D &lt;1&gt;;<br>+ #size-cells =3D &lt;0&gt;;<br>+ reg =3D &lt=
;0&gt;;<br>+<br>+ eeprom@50 {<br>+ compatible =3D "atmel,24c64";<br>+ reg =
=3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+<br>+ i2c15mux1chn1: i2c@1 {<br>+ #ad=
dress-cells =3D &lt;1&gt;;<br>+ #size-cells =3D &lt;0&gt;;<br>+ reg =3D &lt=
;1&gt;;<br>+<br>+ eeprom@50 {<br>+ compatible =3D "atmel,24c64";<br>+ reg =
=3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+<br>+ i2c15mux1chn2: i2c@2 {<br>+ #ad=
dress-cells =3D &lt;1&gt;;<br>+ #size-cells =3D &lt;0&gt;;<br>+ reg =3D &lt=
;2&gt;;<br>+<br>+ eeprom@50 {<br>+ compatible =3D "atmel,24c64";<br>+ reg =
=3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+<br>+ i2c15mux1chn3: i2c@3 {<br>+ #ad=
dress-cells =3D &lt;1&gt;;<br>+ #size-cells =3D &lt;0&gt;;<br>+ reg =3D &lt=
;3&gt;;<br>+<br>+ eeprom@50 {<br>+ compatible =3D "atmel,24c64";<br>+ reg =
=3D &lt;0x50&gt;;<br>+ };<br>+ };<br>+ };<br>+<br>+ i2c-switch@72 {<br>+ co=
mpatible =3D "nxp,pca9546";<br>+ reg =3D &lt;0x72&gt;;<br>+ #address-cells =
=3D &lt;1&gt;;<br>+ #size-cells =3D &lt;0&gt;;<br>+ i2c-mux-idle-disconnect=
;<br>+<br>+ i2c15mux2chn0: i2c@0 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ =
#size-cells =3D &lt;0&gt;;<br>+ reg =3D &lt;0&gt;;<br>+<br>+ eeprom@50 {<br=
>+ compatible =3D "atmel,24c64";<br>+ reg =3D &lt;0x50&gt;;<br>+ };<br>+ };=
<br>+<br>+ i2c15mux2chn1: i2c@1 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ #=
size-cells =3D &lt;0&gt;;<br>+ reg =3D &lt;1&gt;;<br>+<br>+ eeprom@50 {<br>=
+ compatible =3D "atmel,24c64";<br>+ reg =3D &lt;0x50&gt;;<br>+ };<br>+ };<=
br>+<br>+ i2c15mux2chn2: i2c@2 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ #s=
ize-cells =3D &lt;0&gt;;<br>+ reg =3D &lt;2&gt;;<br>+ };<br>+<br>+ i2c15mux=
2chn3: i2c@3 {<br>+ #address-cells =3D &lt;1&gt;;<br>+ #size-cells =3D &lt;=
0&gt;;<br>+ reg =3D &lt;3&gt;;<br>+ };<br>+ };<br>&nbsp;};<br>&nbsp;<br>&nb=
sp;&amp;ehci1 {<br>--<br>2.27.0</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
<BR>

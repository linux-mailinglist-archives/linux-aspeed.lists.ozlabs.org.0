Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 820336787EA
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 21:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P121J0nbMz3cC4
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Jan 2023 07:35:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eg+5K7sq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eg+5K7sq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P121B2V43z30QQ
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Jan 2023 07:35:41 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NKH2on008372;
	Mon, 23 Jan 2023 20:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=io/cDpUh5LugZOE9wLIW/3yUwuueKVoJ2jGZALRbbJI=;
 b=Eg+5K7sqMvRgSWWs3NMnWz0DJwP4rsUjIpGCgifd3kw+agx8UXXKpZRNgNyv310osPq8
 bSMlKwWlG6PC2o51DB53DtYJDoS3PzJWuZG393VVuYd5GgA0tXhW0cgBKrjZYw3FSYa3
 AZKaoR/ZgzjALd9OpnxItAwmEEN13k/Wt9Y41tNyKZAgJs4Gw6O2cr7M42ERA+h5b36v
 Sg0FysBIJWXcWHhyZkS4PMUdJ0MFCRhYeYc3IWDbCrQioPqEkX0KSx8+sSriEp96gDUI
 t8mAJfsW5sc9WbCodmDpCaPtkw8roKAQAi1qPIGr7YG1SQ8kQ/sd7nPzc541fVBEsvO0 +g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na14q0dac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 20:35:23 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30NKQmua014951;
	Mon, 23 Jan 2023 20:35:23 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na14q0da3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 20:35:22 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30NHjwp0019839;
	Mon, 23 Jan 2023 20:35:21 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n87p71xeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 20:35:21 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30NKZKsp9765520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 20:35:20 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B6C25805A;
	Mon, 23 Jan 2023 20:35:20 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCB8D5803F;
	Mon, 23 Jan 2023 20:35:18 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.143.243])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Jan 2023 20:35:18 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Message-Id: <4A9DBC51-596B-47C0-BA4D-9E790EBAE0FC@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_325B3039-6FD0-4B60-B539-7E4A8AD02676"
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: bletchley: rename flash1 label
Date: Mon, 23 Jan 2023 14:34:44 -0600
In-Reply-To: <20221226054535.2836110-2-potin.lai.pt@gmail.com>
To: Potin Lai <potin.lai.pt@gmail.com>
References: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
 <20221226054535.2836110-2-potin.lai.pt@gmail.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BY0FmikMQJ7B9Y2CyoPbAJSoeXZHnlQ_
X-Proofpoint-GUID: rEpzcPk9SueZ4jOYkVChqJBL6avldJAb
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230195
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_325B3039-6FD0-4B60-B539-7E4A8AD02676
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Dec 25, 2022, at 11:45 PM, Potin Lai <potin.lai.pt@gmail.com> wrote:
>=20
> In OpenBMC, phosphor-software-manager use "alt-bmc" for secondary falsh
> label.
> Rename flash1 label to "alt-bmc" to support dual image feature inOpenBMC.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/a=
rm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> index a619eec70633..791f83aaac50 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> @@ -307,7 +307,7 @@ flash@0 {
> 	flash@1 {
> 		status =3D "okay";
> 		m25p,fast-read;
> -		label =3D "flash1";
> +		label =3D "alt-bmc";
> 		spi-max-frequency =3D <50000000>;

This is correct, and I see it=E2=80=99s been merged into 6.3.=20
Just something you may want do to as a follow-up change to add the partitio=
ns to the alternate flash device. Similar to the include line for:

flash@0{
=E2=80=A6
label =3D =E2=80=9Cbmc=E2=80=9D
...
#include "openbmc-flash-layout-128.dtsi=E2=80=9D
};

You probably want an include for the alt partitions and add this include li=
ne at the end:
flash@1{
=E2=80=A6
label =3D =E2=80=9Calt-bmc=E2=80=9D;
...
+ #include "openbmc-flash-layout-128-alt.dtsi=E2=80=9D
};

There=E2=80=99s not a file "openbmc-flash-layout-128-alt.dtsi=E2=80=9D that=
 exists today, so you=E2=80=99d need to create it by copying it the existin=
g "openbmc-flash-layout-128.dtsi=E2=80=9D and just add an =E2=80=9Calt-=E2=
=80=9C prefix to the partition labels, this is the change that was done to =
create the file "openbmc-flash-layout-64-alt.dtsi=E2=80=9D for 64MB flash c=
hips as an example: https://lore.kernel.org/openbmc/Yboga8RUoYrXoPB1@heinle=
in/t/#maca042c23241f765fc2aaaa9d90131ee69b8cf81

The function that you gain by adding =E2=80=9Calt-=E2=80=9C partitions to t=
he secondary flash device is that the phosphor-software-manager code will a=
uto-mount the partitions including the read-write filesystem for syncing/ba=
ckup and also create the d-bus version interfaces for this secondary flash =
device.

This is probably more information that you=E2=80=99d want, but you may had =
noticed that IBM=E2=80=99s 128MB tacoma system "aspeed-bmc-opp-tacoma.dts=
=E2=80=9D does not have partitions for the secondary device, and the reason=
 is that the 2nd NOR chip is not used, instead we have an eMMC card attache=
d and use the u-boot partition from the primary NOR flash device. Otherwise=
 we would had created the "openbmc-flash-layout-128-alt.dtsi=E2=80=9D file =
already.

> 	};
> };
> --=20
> 2.31.1
>=20


--Apple-Mail=_325B3039-6FD0-4B60-B539-7E4A8AD02676
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><br><blockquote type=3D"cite"><div>On Dec =
25, 2022, at 11:45 PM, Potin Lai &lt;potin.lai.pt@gmail.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><div>In =
OpenBMC, phosphor-software-manager use "alt-bmc" for secondary =
falsh<br>label.<br>Rename flash1 label to "alt-bmc" to support dual =
image feature inOpenBMC.<br><br>Signed-off-by: Potin Lai =
&lt;potin.lai.pt@gmail.com&gt;<br>---<br> =
arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 +-<br> 1 file =
changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git =
a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts =
b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts<br>index =
a619eec70633..791f83aaac50 100644<br>--- =
a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts<br>+++ =
b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts<br>@@ -307,7 =
+307,7 @@ flash@0 {<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>flash@1 {<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>status =3D =
"okay";<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>m25p,fast-read;<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>label =3D "flash1";<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>label =3D =
"alt-bmc";<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>spi-max-frequency =3D =
&lt;50000000&gt;;<br></div></div></blockquote><div><br></div><div>This =
is correct, and I see it=E2=80=99s been merged into =
6.3.&nbsp;</div><div>Just something you may want do to as a follow-up =
change to add the partitions to the alternate flash device. Similar to =
the include line =
for:</div><div><br></div><div>flash@0{</div><div>=E2=80=A6</div><div>label=
 =3D =E2=80=9Cbmc=E2=80=9D</div><div>...</div><div>#include =
"openbmc-flash-layout-128.dtsi=E2=80=9D</div><div>};</div><div><br></div><=
div>You probably want an include for the alt partitions and add this =
include line at the =
end:</div><div>flash@1{</div><div>=E2=80=A6</div><div>label =3D =
=E2=80=9Calt-bmc=E2=80=9D;</div><div>...</div><div>+ #include =
"openbmc-flash-layout-128-alt.dtsi=E2=80=9D</div><div>};</div><div><br></d=
iv><div>There=E2=80=99s not a file "openbmc-flash-layout-128-alt.dtsi=E2=80=
=9D that exists today, so you=E2=80=99d need to create it by copying it =
the existing "openbmc-flash-layout-128.dtsi=E2=80=9D and just add an =
=E2=80=9Calt-=E2=80=9C prefix to the partition labels, this is the =
change that was done to create the file =
"openbmc-flash-layout-64-alt.dtsi=E2=80=9D for 64MB flash chips as an =
example:&nbsp;<a =
href=3D"https://lore.kernel.org/openbmc/Yboga8RUoYrXoPB1@heinlein/t/#maca0=
42c23241f765fc2aaaa9d90131ee69b8cf81">https://lore.kernel.org/openbmc/Ybog=
a8RUoYrXoPB1@heinlein/t/#maca042c23241f765fc2aaaa9d90131ee69b8cf81</a></di=
v><div><br></div><div>The function that you gain by adding =E2=80=9Calt-=E2=
=80=9C partitions to the secondary flash device is that the =
phosphor-software-manager code will auto-mount the partitions including =
the read-write filesystem for syncing/backup and also create the d-bus =
version interfaces for this secondary flash =
device.</div><div><br></div><div>This is probably more information that =
you=E2=80=99d want, but you may had noticed that IBM=E2=80=99s 128MB =
tacoma system "aspeed-bmc-opp-tacoma.dts=E2=80=9D does not have =
partitions for the secondary device, and the reason is that the 2nd NOR =
chip is not used, instead we have an eMMC card attached and use the =
u-boot partition from the primary NOR flash device. Otherwise we would =
had created the "openbmc-flash-layout-128-alt.dtsi=E2=80=9D file =
already.</div><br><blockquote type=3D"cite"><div><div> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>};<br> =
};<br>-- =
<br>2.31.1<br><br></div></div></blockquote></div><br></body></html>=

--Apple-Mail=_325B3039-6FD0-4B60-B539-7E4A8AD02676--


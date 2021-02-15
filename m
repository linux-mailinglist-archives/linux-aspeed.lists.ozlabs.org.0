Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEF731B581
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Feb 2021 08:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfFR26Pdnz30Ks
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Feb 2021 18:02:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BmvgTr/9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BmvgTr/9; dkim-atps=neutral
X-Greylist: delayed 830 seconds by postgrey-1.36 at boromir;
 Mon, 15 Feb 2021 18:02:20 AEDT
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfFR040TZz30HH
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Feb 2021 18:02:20 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11F6gCC4021763; Mon, 15 Feb 2021 01:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=01mjCf5r9UfB8eMjgqcThUoAP7wjvUs0Gb8Nug4M0Jw=;
 b=BmvgTr/99QtOCiGHSSdYzvCHEqiI+DKR69f/jY2jBjTtnr6KFOkBCM0k5YT2ozNQJDBb
 jE6KQVsXrHduebPHnA1PVTu8GyW7cYo0UzAjVGwIU7A8x/UTUY1FNo/xqE7Bv75rM/Rv
 urjluVUW6OVJ7ZNbz1sf/ts1JoYBR689ogIsTmwaMbkSW8BKUJX6oifyM9yuHQk2lxWl
 uK1xJlrou0egkA3vCDhrgCbXKvrO2rIf5G0w+f/0FE0aG7DQS30vUWjw7+7ARCvI2FVD
 4FltlOl7HaBY/qx2I9dcQUA31pkOkSBgdqqZeduxokV8/bG89HkTghX4mNUve203UfR3 cA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36qkwur3u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 01:48:23 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11F6gY6C016990;
 Mon, 15 Feb 2021 06:48:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 36p6d8gsnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 06:48:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11F6mJiV25690438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 06:48:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AFADAE053;
 Mon, 15 Feb 2021 06:48:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06457AE051;
 Mon, 15 Feb 2021 06:48:18 +0000 (GMT)
Received: from [9.85.100.29] (unknown [9.85.100.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Feb 2021 06:48:17 +0000 (GMT)
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: rainier: Add leds that are on
 optional PCI cable cards
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://8/
In-Reply-To: <30e6c20b-1f00-4209-960c-8de1d70c8a4e@www.fastmail.com>
X-Apple-Windows-Friendly: 1
Date: Mon, 15 Feb 2021 12:14:41 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <14C0B6E9-0724-42FE-89BA-1FA0262B9BBB@linux.vnet.ibm.com>
References: <1605247168-1028-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <1605247168-1028-6-git-send-email-vishwa@linux.vnet.ibm.com>
 <CACPK8XfttMptuYFsocBaj2v4z1vzNjDUfe18FeDcAbmZjWKjfQ@mail.gmail.com>
 <6CFB3D8D-CF5A-4E33-8D57-6A4034DDC49E@linux.vnet.ibm.com>
 <30e6c20b-1f00-4209-960c-8de1d70c8a4e@www.fastmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-15_01:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150054
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On =
15-Feb-2021, at 4:38 AM, Andrew Jeffery &lt;andrew@aj.id.au&gt; =
wrote:<br><br><br><br>On Wed, 10 Feb 2021, at 21:46, vishwanatha =
subbanna wrote:<br><blockquote type=3D"cite"><br><br><blockquote =
type=3D"cite">On 16-Nov-2020, at 11:43 AM, Joel Stanley =
&lt;joel@jms.id.au&gt; wrote:<br><br>On Fri, 13 Nov 2020 at 05:59, =
Vishwanatha Subbanna<br>&lt;vishwa@linux.vnet.ibm.com&gt; =
wrote:<br><blockquote type=3D"cite"><br>These are LEDs on the cable =
cards that plug into PCIE slots.<br>The LEDs are controlled by PCA9552 =
I2C expander<br><br>Signed-off-by: Vishwanatha Subbanna =
&lt;vishwa@linux.vnet.ibm.com&gt;<br>---<br>arch/arm/boot/dts/aspeed-bmc-i=
bm-rainier.dts | 288 +++++++++++++++++++++++++++<br>1 file changed, 288 =
insertions(+)<br><br>diff --git =
a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>index 67c8c40..7de5f76 =
100644<br>--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>+++ =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>@@ -696,6 +696,70 =
@@<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gpios =3D =
&lt;&amp;pca4 7 GPIO_ACTIVE_LOW&gt;;<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;};<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};<br>+<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;leds-optional-cablecard0 =
{<br></blockquote><br>Is it necessary to have separate nodes for each of =
the different GPIO devices?<br><br>Would it make sense to combine them, =
or is it better to be separate?<br><br>Andrew, Eddie, Brad: please =
review this one before I merge it.<br></blockquote><br>I answered this =
in previous patch set. &nbsp;If I express =E2=80=98em all in one =
<br>node that is =E2=80=9Cleds {", then if any of the GPIO is not seen =
because of <br>not having the card, then the current leds-gpio driver =
knocks off all <br>the ones on which it successfully acquired the GPIOs =
also, leaving <br>nothing.<br></blockquote><br>I'm struggling to follow =
this sentence. Can you please explain what you're <br>trying to say in a =
less colloquial way?<br></blockquote><br><br>Okay.. So, let me give a =
bit of background. We have some cards that are optional. What that means =
is, if the cards are to be inserted, then the system needs to be brought =
down to put =E2=80=98em. Now, there can be N such cards in our system =
and any of =E2=80=98em can be populated or none of =E2=80=98em can be =
populated depending on what user wants.<br><br>Now, let us assume I put =
global =E2=80=9Cleds { , compatible =3D "gpio-leds"; =E2=80=9D section =
and I describe LEDs of all these N cards along with all the other LEDs =
on the planar, then leds-gpio driver would populate all the entries in =
/sys/class/leds/ __if__ all of the N cards that I mentioned are plugged =
in and their GPIOs can be detected.<br><br>However, take for instance =
where 1 or more of those cards are not plugged in, then, because there =
is a failure in detecting those GPIOs, leds-gpio driver will<br>discard =
all other LEDs on which it could successfully acquire the GPIOs. So, =
there will not be anything in =E2=80=9C/sys/class/leds=E2=80=9D. So, the =
way it works is : either -all- or -none-.<br><br>So, what I have done =
:<br><br>- Put a "leds {=E2=80=9C section that contain the LEDs that are =
always present and wired to planar<br>- For each optional cards, have a =
separate section. This will make sure that even if some cards are not =
plugged in, leds-gpio honours rest others since acquiring GIPO on them =
would be successful. <br><br><br><br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite">I did speak to the =
maintainer and it looked like the behaviour <br>was existing since long =
time and changing it would break old code.<br><br></blockquote><br>Break =
how?<br></blockquote><br>In my email to the maintainer, I mentioned if =
this behaviour can be fixed. Meaning, if the driver fails to detect one =
of more of GPIOs, then drop only those entries instead of dropping all =
other GPIOs that were actually present. I was told that the behaviour =
has been existing for a long time and can not be changed.<br><br>I hope =
I answered the questions. Please let me know if there is anything =
else.<br><br>Thank you,<br><blockquote =
type=3D"cite"><br>Andrew<br></blockquote><br></div></body></html>=

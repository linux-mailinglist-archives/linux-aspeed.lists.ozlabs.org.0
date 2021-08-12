Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530C3EE0ED
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Aug 2021 02:32:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpX6R25CJz308Z
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Aug 2021 10:32:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iWfhSLqw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=isaac.kurth@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iWfhSLqw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlzT23Kf4z3cHv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Aug 2021 06:54:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17CKqu8Y039018; Thu, 12 Aug 2021 16:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : message-id : content-transfer-encoding : content-type :
 mime-version : references; s=pp1;
 bh=vR+19GUNGOFmYgIcroxGgh0ciFHZ8DNAwIvOEV9dn1s=;
 b=iWfhSLqwVvBw7zN+kj/JdJ3Kag/YPyayW/wo61Fs47NXFNqypykqgkK5tiIi7kTuffgU
 PWh/ZnygfYLsLLJU7c5uTQW5If5yrHgeUrz32h3Cob7erLRsG/++QTq6KH6Rzt9SOxYF
 vJ09esJAFh5AlZ53PSM1DPnWAbWbBEF91Xs7MLrvDI/L5hSZTko0lND2dKIKDDsd5VT2
 so7Lngt2xCaU0/Bhl/k8wlehkzHPu3eD4gsJoCmvZqztefrKWPtaSlfHtB415INXwoZy
 G0e3p85WUVWcbBcr1UTdcmiy1MC+kWJsxwl/C9qXA7jSje0dL0vH2eBLJeFZewSeDz0g bQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ad1kxgt0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 16:54:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17CKr65E002682;
 Thu, 12 Aug 2021 20:54:20 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3a9htgck7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 20:54:20 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17CKsJNf8061600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 20:54:19 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E700D136061;
 Thu, 12 Aug 2021 20:54:18 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4550136051;
 Thu, 12 Aug 2021 20:54:18 +0000 (GMT)
Received: from mww0572.dal12m.mail.ibm.com (unknown [9.208.0.111])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 12 Aug 2021 20:54:18 +0000 (GMT)
In-Reply-To: <8A669E1A-81B3-40E6-BD0C-342D1566EEC8@linux.ibm.com>
Subject: Re: [PATCH linux dev-5.10] ARM: dts: rainier: Add
 'factory-reset-toggle' as GPIOF6
From: "Isaac Kurth" <Isaac.Kurth@ibm.com>
To: anoo@linux.ibm.com, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 12 Aug 2021 20:54:18 +0000
Message-ID: <OF78B9DE55.B565D549-ON0025872F.00724148-0025872F.0072D5B9@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0572/03/M/IBM at 08/12/2021 20:54:18,
 Serialize complete at 08/12/2021 20:54:18
X-Disclaimed: 32151
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GOXi78qMDC-UFB2J7IAJQTLOMVqQPB-a
X-Proofpoint-ORIG-GUID: GOXi78qMDC-UFB2J7IAJQTLOMVqQPB-a
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_06:2021-08-12,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120133
X-Mailman-Approved-At: Tue, 17 Aug 2021 10:32:11 +1000
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Forwarding=
 this because I was told that I should send these patches upstream for appr=
oval.</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Adriana Kobylak" =
&lt;anoo@linux.ibm.com&gt;<br>To: "Isaac Kurth" &lt;blisaac91@gmail.com&gt;=
, mspinler@linux.ibm.com, "Andrew Geissler" &lt;geissonator@gmail.com&gt;, =
"Joel Stanley" &lt;joel@jms.id.au&gt;<br>Cc: isaac.kurth@ibm.com, "OpenBMC =
Maillist" &lt;openbmc@lists.ozlabs.org&gt;<br>Subject: Re: [PATCH linux dev=
-5.10] ARM: dts: rainier: Add 'factory-reset-toggle' as GPIOF6<br>Date: Thu=
, Jul 22, 2021 9:43 AM<br>&nbsp;
<div><br><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,mon=
ospace" >&gt; On Jul 14, 2021, at 4:47 PM, Isaac Kurth &lt;blisaac91@gmail.=
com&gt; wrote:<br>&gt;<br>&gt; From: Isaac Kurth &lt;isaac.kurth@ibm.com&gt=
;<br>&gt;<br>&gt; The state of this GPIO determines whether a factory reset=
 has been<br>&gt; requested. If a physical switch is used, it can be high o=
r low. During boot,<br>&gt; the software checks and records the state of th=
is switch. If it is different<br>&gt; than the previous recorded state, the=
n the read-write portions of memory are<br>&gt; reformatted.<br>&gt;<br>&gt=
; Signed-off-by: Isaac Kurth &lt;isaac.kurth@ibm.com&gt;<br><br>Reviewed-by=
: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br><br>&gt; ---<br>&gt; arch/arm/=
boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-<br>&gt; 1 file changed, 1 insert=
ion(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/arch/arm/boot/dts/aspeed=
-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>&gt;=
 index 728855c5cb90..81be3a563e6a 100644<br>&gt; --- a/arch/arm/boot/dts/as=
peed-bmc-ibm-rainier.dts<br>&gt; +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rai=
nier.dts<br>&gt; @@ -231,7 +231,7 @@ &amp;gpio0 {<br>&gt; /*C0-C7*/ "","","=
","","","","","",<br>&gt; /*D0-D7*/ "","","","","","","","",<br>&gt; /*E0-E=
7*/ "","","","","","","","",<br>&gt; - /*F0-F7*/ "","","","","","","","",<b=
r>&gt; + /*F0-F7*/ "","","","","","","factory-reset-toggle","",<br>&gt; /*G=
0-G7*/ "","","","","","","","",<br>&gt; /*H0-H7*/ "","bmc-ingraham0","rear-=
enc-id0","rear-enc-fault0","","","","",<br>&gt; /*I0-I7*/ "","","","","",""=
,"","",<br>&gt; --<br>&gt; 2.25.1<br>&gt; </font><br>&nbsp;</div></blockquo=
te>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>
<BR>

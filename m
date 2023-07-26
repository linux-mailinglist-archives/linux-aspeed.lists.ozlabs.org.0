Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAF7628C5
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jul 2023 04:33:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=sEx03 header.b=t+iAQRN/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9dHz4XKvz30Py
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jul 2023 12:33:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=sEx03 header.b=t+iAQRN/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com; envelope-from=chen.pj@inventec.com; receiver=lists.ozlabs.org)
Received: from mail.inventec.com (mail.inventec.com [218.32.67.185])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9dHk2ZRNz2yV9
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jul 2023 12:33:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=sEx03; d=inventec.com;
    h=from:to:cc:subject:date:message-id:content-type:mime-version;
    bh=p+/48Hrye0W5kfiOU2HwIZDrqaqtCOZBSv+4qn9j714=;
    b=t+iAQRN/uT6YwbowB5H5Bsc0vmdSb7M2GprRhMGVaKsmDSLbuxaOllPJAq3ERp
      mDallHneOiIvQP2c2ovACQhceeAcBleri5mfBXuMxeqXuLF7d6Tf3QrJFieCgP
      wZsvkQJ9LtqhfJJz6GI6VVtHURmlVNzY1pNlpNhPNkij5/Y=
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Jul 2023 10:33:28 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 26 Jul 2023 10:33:28 +0800
Received: from IEC1-EX2016-01.iec.inventec (IEC1-EX2016-01.iec.inventec [10.15.2.58])
	by IEC1-MSE-FE2.inventec.com with ESMTP id 36Q2XNjT049693;
	Wed, 26 Jul 2023 10:33:23 +0800 (GMT-8)
	(envelope-from Chen.PJ@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-01.iec.inventec (10.15.2.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Jul 2023 10:33:23 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::751c:76aa:fdb1:ad3e]) by
 IEC1-EX2016-01.iec.inventec ([fe80::751c:76aa:fdb1:ad3e%7]) with mapi id
 15.01.2507.023; Wed, 26 Jul 2023 10:33:23 +0800
From: =?big5?B?Q2hlbi5QSiCzr6xmpfQgVEFP?= <Chen.PJ@inventec.com>
To: Joel Stanley <joel@jms.id.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v7 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
Thread-Topic: [PATCH v7 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
Thread-Index: Adm/Z32gHocBZG5PSh+ZEWadvih+nA==
Date: Wed, 26 Jul 2023 02:33:23 +0000
Message-ID: <c42d64c9942b46f483e4337e23932d56@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.178.90]
Content-Type: multipart/alternative;
	boundary="_000_c42d64c9942b46f483e4337e23932d56inventeccom_"
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 36Q2XNjT049693
X-TM-SNTS-SMTP: 225D6980FF00BCBAE36AB6A74D8CC732F63A3085CC4113459CA40170666DAE8A2000:8
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
Cc: =?big5?B?WWUuVmljILitpnSyTSBUQU8=?= <ye.vic@inventec.com>, =?big5?B?Q2hlbi5QSiCzr6xmpfQgVEFP?= <Chen.PJ@inventec.com>, =?big5?B?SHVhbmcuQWxhbmcgtsCtXq2mIFRBTw==?= <Huang.Alang@inventec.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--_000_c42d64c9942b46f483e4337e23932d56inventeccom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgSm9lbCwgQXNwZWVkIHRlYW1zLA0KDQpJIGhhdmUgc2VuZCBhIHBhdGNoIG9uIGxvcmUua2Vy
bmVsLm9yZy4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDcwMzA2MDIyMi4yNDI2
My0yLWNoZW4ucGpAaW52ZW50ZWMuY29tLw0KDQpBbmQgaXQgaGFzIGJlZW4gYSB3aGlsZSBhbmQg
aXQgc2VlbXMgbWF5YmUgSSBzZW5kIHRvIHRoZSB3cm9uZyBwbGFjZSBhbmQgaGFzIG5vIHJlc3Bv
bnNlLg0KRm9yIHRoZSBhc3BlZWQgZHRzIHBhdGNoLCBpcyChp2xvcmUua2VybmVsLm9yZ6GoIGlz
IHRoZSByaWdodCBwbGFjZSB0byBzZW5kIGNvbW1pdD8NCg0KQmVzdCBSZWdhcmRzDQpQSiBDaGVu
DQoNCg==

--_000_c42d64c9942b46f483e4337e23932d56inventeccom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"=B7s=B2=D3=A9=FA=C5=E9",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Joel, Aspeed teams,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have send a patch on lore.ker=
nel.org.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">https://lore.kernel.org/all/202=
30703060222.24263-2-chen.pj@inventec.com/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And it has been a while and it =
seems maybe I send to the wrong place and has no response.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For the aspeed dts patch, is =
=A1=A7lore.kernel.org=A1=A8 is the right place to send commit?<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">PJ Chen<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_c42d64c9942b46f483e4337e23932d56inventeccom_--

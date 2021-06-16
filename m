Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5053A9060
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Jun 2021 06:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4X1z5krWz308H
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Jun 2021 14:16:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=velankanigroup.com header.i=ramakrishnan@velankanigroup.com header.a=rsa-sha256 header.s=zoho header.b=agiXrhZE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=velankanigroup.com (client-ip=103.117.158.11;
 helo=sender-op-o11.zoho.in; envelope-from=ramakrishnan@velankanigroup.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=velankanigroup.com
 header.i=ramakrishnan@velankanigroup.com header.a=rsa-sha256 header.s=zoho
 header.b=agiXrhZE; dkim-atps=neutral
Received: from sender-op-o11.zoho.in (sender-op-o11.zoho.in [103.117.158.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4X1v6XdXz302g
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Jun 2021 14:16:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1623816991; cv=none; d=zohomail.in; s=zohoarc; 
 b=ZS99tzT/p/Sd9QBTpx85pNAfXGi3eJuBtoKXpuOcEcHJXYrQFO8Sdr/C7I3fEbvmZP1GEODRte5OP6Yisy/jYyr0snwBQvcpfSWZ+MfCHYNnHzRVZcu2oQ7AH7MGcPee2UtyN8d4r5sD4JAcb5bJ27pfsHfz9NoatTnV0Gi5TBg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; 
 t=1623816991; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=AbIHs8i68xfK3/shRMudSiXkNDseKt0+7TGH7ByJbXg=; 
 b=QyTFfHDAehtxqpbBdK3DsMqJFuX27ghxIXRfwXVP5qwA1lx2nK885lBF0EMkMiCPUmhilzJ/A/s9W/FeXglfVrD15/G66NdVZU/6843U6FpBy5/Ty/0VN+Y4nkQFD9fDVZ+OCGNKAKlliu2SnX/sLIgE+OZtynWIpwJqLJz4F+E=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=velankanigroup.com;
 spf=pass  smtp.mailfrom=ramakrishnan@velankanigroup.com;
 dmarc=pass header.from=<ramakrishnan@velankanigroup.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623816991; 
 s=zoho; d=velankanigroup.com; i=ramakrishnan@velankanigroup.com;
 h=Date:From:To:Message-Id:In-Reply-To:Subject:MIME-Version:Content-Type;
 bh=AbIHs8i68xfK3/shRMudSiXkNDseKt0+7TGH7ByJbXg=;
 b=agiXrhZE24drAUW6WHrxpt5D8xgWgDGMFV5nebZy2dSuCB+a5QmxbI8Oob8FzcW1
 LUBJNyXGen4/ryAb3q5Mbjv1/avsOctba/pJGsrHwwtL2kpXEc2TcmWxE9/ArvgF8+s
 OTLPh3W0/pkR102sTV5s9EkpC4r030AlXDyV6onc=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1623816991095353.5773208745345;
 Wed, 16 Jun 2021 09:46:31 +0530 (IST)
Date: Wed, 16 Jun 2021 09:46:31 +0530
From: ramakrishnan <ramakrishnan@velankanigroup.com>
To: "linux-aspeed" <linux-aspeed@lists.ozlabs.org>
Message-Id: <17a1308f173.6938bac93765.4526632294642356057@velankanigroup.com>
In-Reply-To: 
Subject: 32 bit Post Code capture and display in AMD EPYC Daytona platform
 with ATS2500 BMC
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_11239_1053827573.1623816991092"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

------=_Part_11239_1053827573.1623816991092
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,



we are developing openBMC port for the AMD EPYC Daytona platform with ATS 2=
500 BMC.=C2=A0 I=C2=A0 need the following functionality to be implemented.



1. Capture of the LSB of the 32-bit post code=C2=A0 and lit 8 LEDs on the G=
PIOAA port=C2=A0 by configuring SNPWADR with one snooping address of 0x0080=
 and directing the data to the GPIO port pins GPIOAA[7:0].



2. Also read and store the 32-bit Post code as=C2=A0 4 bytes from the=C2=A0=
 the LPC I/O write cycles directed to=C2=A0 Port address 0x0080 , 0x0081, 0=
x0082 and 0x0083=C2=A0 in the root=C2=A0 file system for every power cycle =
and later display on the web GUI by=C2=A0 Configuring=C2=A0 post code contr=
ol register PCCR0-3 for=C2=A0 DMA/FIFO mode.=C2=A0



Could you please let=C2=A0 us know if=C2=A0 implementation for the above sa=
id two is available in=C2=A0 openBMC community else suggest implementation=
=C2=A0 =C2=A0pointers.

=C2=A0

Can any one=C2=A0 provide SW linux kernel 5.x=C2=A0 =C2=A0driver for=C2=A0 =
second functionality=C2=A0 =C2=A0implementation or link to driver, if it ex=
ist , in the open=C2=A0 community.



suggestion to implementation pointer is also welcome.


=C2=A0




Regards,

Ramakrishnan
------=_Part_11239_1053827573.1623816991092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div style=3D"color: rgb(0, 0, 0); font-family: Verdana=
, Arial, Helvetica, sans-serif; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration-thickness: initial; text-decoration-style: initial; =
text-decoration-color: initial; font-size: 13.3333px; background-color: rgb=
(255, 255, 255);">Hi,<br></div><div style=3D"color: rgb(0, 0, 0); font-fami=
ly: Verdana, Arial, Helvetica, sans-serif; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial; font-size: 13.3333px; background=
-color: rgb(255, 255, 255);"><br></div><div style=3D"color: rgb(0, 0, 0); f=
ont-family: Verdana, Arial, Helvetica, sans-serif; font-style: normal; font=
-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration-thickness: initial; text-decorati=
on-style: initial; text-decoration-color: initial; font-size: 13.3333px; ba=
ckground-color: rgb(255, 255, 255);">we are developing openBMC port for the=
 AMD EPYC Daytona platform with ATS 2500 BMC.&nbsp; I&nbsp; need the follow=
ing functionality to be implemented.<br></div><div style=3D"color: rgb(0, 0=
, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; font-size: 13.333=
3px; background-color: rgb(255, 255, 255);"><br></div><div style=3D"color: =
rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial; font-size=
: 13.3333px; background-color: rgb(255, 255, 255);">1. Capture of the LSB o=
f the 32-bit post code&nbsp; and lit 8 LEDs on the GPIOAA port&nbsp; by con=
figuring SNPWADR with one snooping address of 0x0080 and directing the data=
 to the GPIO port pins GPIOAA[7:0].<br></div><div style=3D"color: rgb(0, 0,=
 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial; font-size: 13.3333=
px; background-color: rgb(255, 255, 255);"><br></div><div style=3D"color: r=
gb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; font-size:=
 13.3333px; background-color: rgb(255, 255, 255);">2. Also read and store t=
he 32-bit Post code as&nbsp; 4 bytes from the&nbsp; the LPC I/O write cycle=
s directed to&nbsp; Port address 0x0080 , 0x0081, 0x0082 and 0x0083&nbsp; i=
n the root&nbsp; file system for every power cycle and later display on the=
 web GUI by&nbsp; Configuring&nbsp; post code control register PCCR0-3 for&=
nbsp; DMA/FIFO mode.&nbsp;<br></div><div style=3D"color: rgb(0, 0, 0); font=
-family: Verdana, Arial, Helvetica, sans-serif; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lette=
r-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; font-size: 13.3333px; backg=
round-color: rgb(255, 255, 255);"><br></div><div style=3D"color: rgb(0, 0, =
0); font-family: Verdana, Arial, Helvetica, sans-serif; font-style: normal;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; font-size: 13.3333p=
x; background-color: rgb(255, 255, 255);">Could you please let&nbsp; us kno=
w if&nbsp; implementation for the above said two is available in&nbsp; open=
BMC community else suggest implementation&nbsp; &nbsp;pointers.<br></div><d=
iv style=3D"color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial; font-family: &quot;Lato 2&quot;, sans-seri=
f; font-size: 14px; background-color: rgb(255, 255, 255);"><p style=3D"marg=
in: 0px;" class=3D""><span style=3D"font-size: 10pt; font-family: Verdana, =
sans-serif;">&nbsp;</span><br></p><p style=3D"margin: 0px;" class=3D""><spa=
n style=3D"font-size: 10pt; font-family: Verdana, sans-serif;">Can any one&=
nbsp; provide SW linux kernel 5.x&nbsp; &nbsp;driver for&nbsp; second funct=
ionality&nbsp; &nbsp;implementation or link to driver, if it exist , in the=
 open&nbsp; community.</span><br></p><div><br></div><div><span style=3D"fon=
t-size: 10pt; font-family: Verdana, sans-serif;">suggestion to implementati=
on pointer is also welcome.</span><br></div></div><div style=3D"color: rgb(=
0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wi=
dows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial; font-family: &quot;Lato 2&quot;, sans-serif; font-size: 14px; bac=
kground-color: rgb(255, 255, 255);"><p style=3D"margin: 0px;" class=3D""><s=
pan style=3D"font-size: 10pt; font-family: Verdana, sans-serif;">&nbsp;</sp=
an><br></p></div><div style=3D"color: rgb(0, 0, 0); font-family: Verdana, A=
rial, Helvetica, sans-serif; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial; font-size: 13.3333px; background-color: rgb(25=
5, 255, 255);"><div><br></div><div>Regards,<br></div><div>Ramakrishnan<br><=
/div></div><div><br></div><div data-zbluepencil-ignore=3D"true" id=3D""><di=
v><br></div></div><div><br></div></div><br></body></html>
------=_Part_11239_1053827573.1623816991092--


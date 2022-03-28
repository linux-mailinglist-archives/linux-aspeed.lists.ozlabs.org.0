Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9374ECF39
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 23:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTKyH5WGZz2yjc
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 08:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SDV7rX2Z;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.82;
 helo=mo4-p02-ob.smtp.rzone.de; envelope-from=hns@goldelico.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=goldelico.com header.i=@goldelico.com
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SDV7rX2Z; 
 dkim-atps=neutral
X-Greylist: delayed 169 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 00:34:16 AEDT
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtvr43NLz2xF0;
 Tue, 29 Mar 2022 00:34:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1648474261;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=sZ1KUqmaSZkvxQMt9tFXvZV6MgTFVVShWeU/MOIaOsY=;
 b=SDV7rX2ZPnuzhJ0MvgPIZvEddAnguVTrlsGq7X/oKZ5q3NG+a39HHGUeBXOGqEXqRy
 lcaLowLqIRHPvzeN5D2An6Wks1/f4+qwkuhRepaSKVzys7Gonz3kwjeSXB0BEymMs9RZ
 YQrhfynNFP9dBJu/hDN6B3wMozEcVMfknebijAc53JtZ0udW22GGPv5VnBkDu0eATcj4
 7MdoE/xVBh7KDQdS76cTl7+mQxqEfIoyInp4Mg325ePVQLKDJUiOHBI1qNmFH1wJRoWT
 +G+iRNGVTYaYIiOGTjX6OgvzVhaX69kX8CzEJ4h5djizkjZJsYeHyeFW66qIXLgqr0rf
 5H/A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u32M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.42.1 DYNA|AUTH)
 with ESMTPSA id u3e945y2SDV03BY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 28 Mar 2022 15:31:00 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_99F1F29C-8FA2-4AF9-91B0-BECD1973FA20"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
Date: Mon, 28 Mar 2022 15:30:59 +0200
Message-Id: <ED58E1B7-AA91-4224-B26A-32E7AE5346B8@goldelico.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
To: =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Ansuel Smith <ansuelsmth@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Mailman-Approved-At: Thu, 31 Mar 2022 08:56:02 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_99F1F29C-8FA2-4AF9-91B0-BECD1973FA20
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Am 28.03.2022 um 15:21 schrieb Jonathan Neusch=C3=A4fer =
<j.neuschaefer@gmx.net>:
>=20
> Or maybe bcm instead of broadcom. Not sure which is preferred by
> Broadcom people.

Maybe it should always follow the list of vendor prefixes as we are =
talking about DTS?

just my 2cts,
Nikolaus


--Apple-Mail=_99F1F29C-8FA2-4AF9-91B0-BECD1973FA20
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 28.03.2022 um 15:21 schrieb Jonathan Neusch=C3=A4fer =
&lt;<a href=3D"mailto:j.neuschaefer@gmx.net" =
class=3D"">j.neuschaefer@gmx.net</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Or maybe bcm =
instead of broadcom. Not sure which is preferred by</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Broadcom =
people.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote></div><br class=3D""><div =
class=3D"">Maybe it should always follow the list of vendor prefixes as =
we are talking about DTS?</div><div class=3D""><br class=3D""></div><div =
class=3D"">just my 2cts,</div><div class=3D"">Nikolaus</div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_99F1F29C-8FA2-4AF9-91B0-BECD1973FA20--

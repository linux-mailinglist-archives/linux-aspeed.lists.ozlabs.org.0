Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56A4E9816
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 15:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRtlp2sM5z3c22
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 00:27:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=aKEux+sr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=aKEux+sr; 
 dkim-atps=neutral
X-Greylist: delayed 326 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 00:27:13 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtlj6Hwfz2ynj
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 00:27:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648474029;
 bh=Nm/Ru4v6GD/9m6h8Ema9mdsaUHXiVXieqg+H9J3bSYw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=aKEux+sr+HMmNhu9VLe0T8nMwrcMp6yjAG1vcOTjlbMcnkSLOtdn2kXdYL7MqbJbB
 dkbESSdQDtmRnFU75ivHtftALrNhXGo6dtkFgQcxyaCLmWg9Qr4sBza9n0I/UYIcHe
 FMfM6Rfa/XlWgtarRf+wS/SlaGTEHZ7gvjyie57c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1o9Wy01IDW-00b62U; Mon, 28
 Mar 2022 15:21:10 +0200
Date: Mon, 28 Mar 2022 15:21:08 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkG2RPrtPaBNXb7a@latitude>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x1hzLjR6QNWBL5ri"
Content-Disposition: inline
In-Reply-To: <20220328000915.15041-1-ansuelsmth@gmail.com>
X-Provags-ID: V03:K1:Bioqa+FsRJNTbH3AmylnUOJ5uauHNDFVr5040I9oO0lC3hC8za8
 8toO+l0g55xievdKeTJ469gRnIKOkbsFSsOO+tgGq7irO2EOMhJkwHWcURdNp65efMi2oLY
 L5fGfWljKrJsoHoMaPXHH/ObRkqn8C/sxbzJkrFQPrLB6jphQpHadN6OgYOe3EsTr5qfgRR
 0QxmE3cnPXA2J3+3R2qHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:noafg8pl3yE=:GZZdrPno6/GbbDOZJJuaeS
 fvpoT8jDCy1AcApZOTGNVrpU2XAGkLfU1Cjn0xJ1BrkGQcg4SSF5r99+IwfJptXMRC3oLHX4B
 /B2n64/qcA8snvfRquM4OFAErlJIT7OfYSFrBdZgXO+rI6lOhCk5qz71Drkqm4qsrWjFlclfF
 yv4t81rsFvF2cYhbvnoI88w1dyoOn5kZucpKa7ixApDatSLiKPjxm0Kw1aXTU2wZ+Qt2RUm86
 BkMdDWlQ26XdawxQDKSDCH9T9rUOTFmVFGDMAIhlWUW1LAtGcHdtIHPrC+SEpCjzYPjGSjNnF
 hDyA9q+DhXqm4rg9Jf5Atjw/NOtQuOAP01Vxb8eurBIm5t3MJ7mKdrjlEefaxHxGjjuAhEKjr
 4uuRzsBRIJt0otHkx3Bj16Cgsw6ACbkVG5ZU+VaN5hjYGoJtJjrHv0lpx11XhNRYfWixgmi/f
 RJlDYsNCajws47+ET/DwKmrvpaU+IPgFlRP3VfdxC+tTh1+q1qpwokq1fH7pz0OsLRXZwdHKG
 kUn05de1H/Y7+CN2J57Z1y+2psNbgkBvYIV1CWM0rO1e8TigPKw8SVayhOCUNVHG0nQx0im+X
 BUJvYOghNluFiaDBHVSbIHXfaS4Wel7VeNY891AmChgg1W0XX9xTK4sr7w6dNA5CcUFXNp5N9
 ztaVV9ueFgWoMlAQkfJBJz4oitwRITMhzDptJmWtjwRrOGrtFDk8XdMiwev1uD77be4DfVHWL
 mSCYZVvyIgHqBuW1nBDztQ+fEvrOQBAWq/hCYstjRQ50xVHQGyWqCraS+xZWr2LSFAwDeQKD2
 y35VbGeLNWXEYglpCaPY6bUN7xgByE8KtHQKlTxL1UtjrpyyVtvXTjLEJ0jPykmYMQ48KLTl6
 x5NjBhkRKTz7/bdP0nuFluEBrjBSjNNQU9LM6MbE4hIcRZeu5C8OwlGppcQXu4NSKJOTrtO5o
 RZJWeVzX1/YMhaDAZJ63lB2KGXsDZTx7EcHx2Qu3LWfq9ejetIB+vGXCFSbOQ6xkC9edjj94F
 9MkCGxdabmG+fx/TTv9qhlQd9uzyqiXTKJIyuGb4NNoXQFG21iaGQphXPBfwFMcKEEtiHNspw
 E18I5QAykBX7Yw=
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
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--x1hzLjR6QNWBL5ri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> Hi,
> as the title say, the intention of this ""series"" is to finally categorize
> the ARM dts directory in subdirectory for each oem.
[...]
> [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0

Nice idea, thank you!

A few notes on categorization below.


>  create mode 100644 arch/arm/boot/dts/broadcom/Makefile
>  rename arch/arm/boot/dts/{ => broadcom}/bcm-cygnus-clock.dtsi (100%)

Or maybe bcm instead of broadcom. Not sure which is preferred by
Broadcom people.

>  create mode 100644 arch/arm/boot/dts/dove/Makefile
>  rename arch/arm/boot/dts/{ => dove}/dove-cm-a510.dtsi (100%)

Arguably part of Marvell.

>  create mode 100644 arch/arm/boot/dts/edac/Makefile
>  rename arch/arm/boot/dts/{ => edac}/ecx-2000.dts (100%)
>  rename arch/arm/boot/dts/{ => edac}/ecx-common.dtsi (100%)
>  rename arch/arm/boot/dts/{ => edac}/highbank.dts (100%)

Why edac?
The most obvious name I can see here is calxeda.

>  create mode 100644 arch/arm/boot/dts/freescale/Makefile

Freescale has been part of NXP for a while, so it might make sense to
merge the freescale and nxp directories. I can't speak for
NXP-the-company, so that's just my view as a bystander.

>  create mode 100644 arch/arm/boot/dts/kirkwood/Makefile

The Kirkwood family should probably be sorted into Marvell.

>  create mode 100644 arch/arm/boot/dts/layerscape/Makefile
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-moxa-uc-8410a.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-qds.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-tsn.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-twr.dts (100%)
>  rename arch/arm/boot/dts/{ => layerscape}/ls1021a.dtsi (100%)

The Layerscape family is part of Freescale/NXP.

>  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi

armv7-m.dtsi is a bit confusing, because it contains a few devices at
fixed addresses, so it looks vendor-specific at a first glance into the
file. However, if it is actually as vendor-neutral as the name implies,
I think it should live dts/ directly, rather than in vendor
subdirectories.

>  rename arch/arm/boot/dts/{ => nxp}/lpc18xx.dtsi (100%)

Here we have the NXP LPCxxxx family, which is AFAIK unrelated to the
i.MX family (and thus the bulk of the Freescale legacy).

>  create mode 100644 arch/arm/boot/dts/vybrid/Makefile

Vybrid is another chip family of NXP, with a good deal of Freescale
legacy in it as evidenced by the "fsl," prefix in the devicetrees.



Thanks,
Jonathan

--x1hzLjR6QNWBL5ri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmJBthoACgkQCDBEmo7z
X9sFJw/8DJFQM9nd8arLY6Z//ocARyXbmt5SCXJ4Fe+N9mDLSgBhMW92vbZe9AJj
LXhypAAS4wZv1lpuor2GHufy5pFc0jL+UXBajKabI27cZX6x1KJR5tWglAAzfepf
zI8iaRfdQ1vm+70MGQDgXYMsUAyk+1RXuLYWZYXp3XX0E/0SsyXkc92jdqyurZmI
8PwvWo5cRY+2m35pvPUff8I4RNfrVvCcMUlzD34bnbi6Kt8Iedvn8QCzLglZyKgs
+0JL9pSrbyRvGqbYuaKqryL7bs/msL7CLAqUTzunTi1TFbGV8/dRzlxL9fFYmyFp
NJ9zszuKs8wfW03g+piIjWwN0ZItFXNQvvdBs0y6bfZZLwu6V9QF1MAN+7cnlCRK
94EH4UNH/FGOZkTnrW1IfNRG9hBMgddEWKQQmniGKmdZGefAIfvENQWq/ErV5vb5
vVUwMxG6HqbFZH0C5bFzeyUwd8UjjnCSGJ/Fe3Xdmgqpvk6pdgDESW+/7MEnXYks
9zs9a/M9a7iGH+Dagu5EkP8L2r2R1wTEBjSXrs0ZjfceZbVvYwygfoKPUzW59eRE
szecWAs/qLdxDrLfIVN1Kpr8KmLNSyyYT3kFDAkuupyHj4Qb9Am40KgzcTgYgv0g
ex5m9SbThoor9QWhVT1IDQHbzT0ZKHkaqf0dCJyIPVUekDYbFvA=
=A4ZY
-----END PGP SIGNATURE-----

--x1hzLjR6QNWBL5ri--

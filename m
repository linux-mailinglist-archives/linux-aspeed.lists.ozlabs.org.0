Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C434ECF3B
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 23:56:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTKyQ6cz0z2yh9
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 08:56:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=nIApRcrv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=WuV252Nu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com;
 envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=nIApRcrv; 
 dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.a=rsa-sha256 header.s=key1 header.b=WuV252Nu; 
 dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 01:01:17 AEDT
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRvW13Wkvz3c18;
 Tue, 29 Mar 2022 01:01:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648476078; x=1680012078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayM215iKfS3RVxHHf6+6kiEWl9gC2cMSZOj/C1/hktk=;
 b=nIApRcrvXfZJzBXQDDBJwWAnXVCSqxwOxY4Hl8I/Ogkei6jQymDXuZ5y
 PWaj1+lBleS3CGkH/u0rXu3Br+Uye1kmTSK5bZonc2RTkwcaDmkpZNR1i
 0dZHqxE3fAoJ1jopCATyV2vf6Ob9+9Tlresq7eLd6jgxjKQaxDIJKHgFw
 TCX4GukDFB/rxewAkIOtaftgeGo5mu6pD2TveMVyugT+HV/11aKwngC8d
 ej7/0kD9l171cyUiTccnc9ZPWJKcq0Twl33VYZZLjAvrbYP9JKOKvsR/I
 DrkemJAsjUDJU4vZZA+7/OgGwYw8YcFZjcuAe7iY5cLDefF+8FGce3XKu g==;
X-IronPort-AV: E=Sophos;i="5.90,217,1643670000"; d="scan'208";a="22935295"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 28 Mar 2022 16:00:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 28 Mar 2022 16:00:05 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 28 Mar 2022 16:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648476005; x=1680012005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayM215iKfS3RVxHHf6+6kiEWl9gC2cMSZOj/C1/hktk=;
 b=WuV252Nu+GZzN74VzCmlspBKd0dca8X2+xSzsUDOC+VBkSdAcRJKkpz9
 V6ZhUvtyzJXo40EU/KoKsnsMA+udDgpFrmJjA0OOrI8Du6AE/IqQXvbD0
 l7/oi3cIclt6kdqSsBk62dD3jTXzpYH4IITmDIWCq1j5VlQdR/7ht0rkB
 UzXa+gf9sB2fMmE9Y4BJg30hxvVMBs2s+cV3pKJsYN741b+m12/z4LAVK
 Ghd0BfGmPSMkfRYy9LlDPSTztxPRWJXf02LYJ3AALa7lqL+bNoPBea5QD
 q3OLZ+wYdDSKr/JtyC5EC84xkLnc6lGkLWsLSzPCKdl/McKEhN7OLwWQj g==;
X-IronPort-AV: E=Sophos;i="5.90,217,1643670000"; d="scan'208";a="22935294"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Mar 2022 16:00:05 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 20160280065;
 Mon, 28 Mar 2022 16:00:04 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: (EXT) Re: [RFC PATCH 0/1] Categorize ARM dts directory
Date: Mon, 28 Mar 2022 16:00:02 +0200
Message-ID: <2100132.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Am Montag, 28. M=E4rz 2022, 15:21:08 CEST schrieb Jonathan Neusch=E4fer:
> * PGP Signed by an unknown key
>=20
> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> > Hi,
> > as the title say, the intention of this ""series"" is to finally
> > categorize
> > the ARM dts directory in subdirectory for each oem.
>=20
> [...]
>=20
> > [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> > [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0
>=20
> Nice idea, thank you!
>=20
> A few notes on categorization below.
> [...]
> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
>=20
> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.

Please don't mix the names for arm and arm64. It's very confusing if the=20
vendor directory is named differently for each architecture.

>[...]
> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
>=20
> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.

This seems to be some generic devices common for all ARMv7M CPUs used in=20
Cortex-M CPUs. It's also used by some stm32 .dtsi.

Best regards,
Alexander




Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87A98986D
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 01:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH1541jRTz2yNc
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 09:44:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727653461;
	cv=none; b=LjKr97zV9LOGAPU/be65jBAcm2yiHln6X6BnHxTmw5pqu17iu18nrcT6TqEDnC3u5G4LHvuSEvxsYMSdXIeR0aQtA9A0gGNDtakdWA3C3b3VMxcy4CHLQGkBkITez5Dgy0k7/aAaogt3Vwb+Ju/ULARuhLQlh9uWsBYu+flTKXk47ilgc4mHGHIqDUdmTH5NBgyEB4X8jTSxAXuTtQEpIe4ttlGR43PC3PGlvJMr/rebL+iNEM7wwFsiNTwnToK01mr2YRzKpELKHXrNtJt3vIewOGbas5UQ5Mz0hoVNTpe3rKsC2fqbqNpR+q4wmpp8/Uu9w+yKRij9VuyTbxZV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727653461; c=relaxed/relaxed;
	bh=JwDoGKRxS+YXAWQHk5KGk+HoFswK8C94/IS1YdzMkug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nu4iLpRWB6ZMoZlR4iiY/NMYVPxBOC6gMVGewCjBbMbJhbFekqNyBoGegXYyTZOUs4jZ0lGo1iZxBD3PEyrU4vyT3k+RPS4ckEusn4mHGjNgXbjZszzXR8I/3Wn00jJ501jtBcZMQgr0LweqEZjF7omak4lXB0pqhrDK6PHo5Tm9a7uToymUhg3yjZCO7RjTvGNvu1xhBbqxVChWvOx2qAWv84P/fICSyaUB8wVoPyAYCNVTxQHKxSui7niiRKtrkiwXNppcSWmZbpk9CxUK9V5S7Wpv5oBGJMkfI2jMm8I+CiRkYxqeLDLXaU3Dks6Y2rRFw7WeRgJCQOdOgL7EoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZdMRbD+a; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZdMRbD+a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH1510ftWz2xY6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 09:44:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727653460;
	bh=JwDoGKRxS+YXAWQHk5KGk+HoFswK8C94/IS1YdzMkug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZdMRbD+aBX0vD0MMmOVvIhJ45cVbGYHTPtdoqZoiAopSOUIOd7Uywyj6nYWafm6Bh
	 OEQz5fh95u5j/n8evDnrJfXc1mN38YJO+lf8Ag8Oqd/KYkSzruTEUzRgxkbhyepB5s
	 25ShunBzKpjCZFbXoFUSYa3JsbKzr0WYhWA4fz88UCKMRyAZEM0GsOzws+F3rclQIs
	 dAVKEn3NCLuVjCEUcMZWRhrNY4vazqRrUcKa0CiwClHMCX8Rsow5DJIyonWCm4g78F
	 u8bqJO17C55rGlE/O6mwVqN8DuQcBLyNNAlkpDuZ7FCJ96j3FqZ6S4ubIH/z8xHRO5
	 XjAKRHjiaamGw==
Received: from [192.168.68.112] (ppp118-210-187-56.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.56])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8B57765866;
	Mon, 30 Sep 2024 07:44:18 +0800 (AWST)
Message-ID: <16c89a7b9b85d21f1f23aa0d67742c6bde94a295.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD
 IOE on Spider Board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, Delphine_CC_Chiu/WYHQ/Wiwynn
	 <Delphine_CC_Chiu@wiwynn.com>
Date: Mon, 30 Sep 2024 09:14:17 +0930
In-Reply-To: <Zvdq7o6NFXRVCJqX@heinlein.vulture-banana.ts.net>
References: <20240926024133.3786712-1-Delphine_CC_Chiu@wiwynn.com>
	 <fbdc9efe87a1bed9fea7d0abaf955aa1a3dc24ac.camel@codeconstruct.com.au>
	 <TYZPR04MB5853B51141F3D0610D970265D66B2@TYZPR04MB5853.apcprd04.prod.outlook.com>
	 <Zvdq7o6NFXRVCJqX@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Ricky, Patrick,

On Fri, 2024-09-27 at 22:33 -0400, Patrick Williams wrote:
> On Fri, Sep 27, 2024 at 09:24:11AM +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wr=
ote:
>=20
> > Would like to ask should I base on the openbmc/linux repo to create the
> > remaining patches that have context dependencies and add the lore link
> > of the those patches that I've sent in the cover letter?
>=20
> I believe you're trying to get the patches applied onto the upstream
> tree, so no you should not base on the openbmc/linux repo.  That repo is
> a 6.6 branch.  You need to base the commits on torvalds/linux.
>=20

In my previous email[1] I requested:

> Please assess the remaining yosemite4 devicetree patches (those you
> haven't received a thank-you email for) and send an appropriately
> constructed series so they can all be applied together, based on the
> tree here:
>=20
> https://github.com/amboar/linux/tree/for/bmc/dt

So I'm not sure why there's confusion and speculation as to which tree
should be used :( Note that the for/bmc/dt branch above is currently
based on v6.12-rc1.

[1]: https://lore.kernel.org/all/fbdc9efe87a1bed9fea7d0abaf955aa1a3dc24ac.c=
amel@codeconstruct.com.au/

Anyway, I asked that because I have already applied one of the
Yosemite4 patches there, and developing the remaining patches against
any other tree will again cause conflicts (due to the lack of that
patch).

More broadly though, Patrick is right: If you're sending your patches
upstream, it is required that you develop and test your patches against
an appropriate upstream tree. Usually this is the most recent -rc1 tag,
unless there are reasons otherwise (such as conflicts). The OpenBMC
kernel fork is not an appropriate tree on which to base work you intend
to send upstream.

Thanks,

Andrew

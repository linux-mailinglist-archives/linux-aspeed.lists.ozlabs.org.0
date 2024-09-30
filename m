Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A06989A61
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 08:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH9Sx3kwtz2yRF
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 16:02:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727676127;
	cv=none; b=aRqmDbjC5qHfQ9bl3I6fddOZ3u/tYbF6HpewYSxg+U1kkPh8yh9hsOCTtq7UoHpujx1SEjODE4M1xWwDDL6p3+UpXybx4cz9u3SPmcMMZAzfifAk/AdWoDaI5Y1Mz6IunTtQjRn9Oc83krelwBpCV6mJAvTz55RBEDzGXnKPaSOJGZpTK6jxwOp2Wt+E+HWWCJCq2oQ64kfT4GqgxvJTeF+F6nL+gl3CFXILpY3Q2V3vY2NiDCwRLF32uKQ13jk8kMXGPfOGFezML0ZEK8adx5O8OjVS+znU/NMZqxy7Vm/O35dgKh3i5Uve+AfjXJCRxwacj90tO3cvGvZ4c4i+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727676127; c=relaxed/relaxed;
	bh=0FIVczdjZnCRLTZ3CDy6YJYArxaNWoYo7j0LdVqWlTs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mQJqgkQjZ6q/FUs4akeS1d1I7RWZpWIgdDKr3QK8NmPoti5kF8jKWtdOnD69yTCHZHIzUdC/2pPbFTMOWFVeKRfPdsPTg/xrzXUCzJUjD13yqsD0rwaQl5xAQBOFxYkaO7OY3OwAJo6qlZkhCZnjam4XwrZhZYBWm+MoZJ3gA52oaH93vR7JAn21W/ys2jh5VzSRuJ5UYVZVwPoEC/jBOvFmM/JGshQRmEAwYwROwLQENkKQSzWU/QNFcoYVOWSLMzXUWeJkyRLbutaEtDQdzz1neBvpttso/dzCMieqXDL3Cbqkz9cva4/ko2p1S2UduRLptKgOO4KuzntGwejfCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XLQdj67u; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XLQdj67u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH9Sv0LF8z2yJ9
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 16:02:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727676125;
	bh=0FIVczdjZnCRLTZ3CDy6YJYArxaNWoYo7j0LdVqWlTs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XLQdj67ubHBsQPOaEGpb9XFb3TW3Q0pRmnam5ggOpYNaYCaEzpUVSFchAkT9RZTXw
	 6ooxsvRM2k1wmby0nyBhsjGbQysYXi7gpn7pPUaPKm52IDsv5/sasjdqWxOxl4uCDp
	 BloCEd5jneNt8BKMYAbMUYnJEKlRxFRqIHBdFd3+1GqdCFTgh5Y7ABJpHKmHFR9Yxz
	 PFMdNyD2XZKAqYPWxDqRtIg9GPEAvp+W1NDO1PQ8KT2v694TnCvyutaUuqavt/zGTd
	 PU/bcP1sNHkd4JbyMiTuNkoAuFg8TcEfTC7uZotIAEoTcqrZDWbkZVSaW7h9dSb8Gl
	 h3yDFIDwSqpbA==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E9EFC6511E;
	Mon, 30 Sep 2024 14:02:02 +0800 (AWST)
Message-ID: <81b9916f299bbf29583aba610c0147c8b8afd092.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD
 IOE on Spider Board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, Patrick
	Williams <patrick@stwcx.xyz>
Date: Mon, 30 Sep 2024 15:32:01 +0930
In-Reply-To: <TYZPR04MB5853D743126A23AD41BE3E0DD6762@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240926024133.3786712-1-Delphine_CC_Chiu@wiwynn.com>
	 <fbdc9efe87a1bed9fea7d0abaf955aa1a3dc24ac.camel@codeconstruct.com.au>
	 <TYZPR04MB5853B51141F3D0610D970265D66B2@TYZPR04MB5853.apcprd04.prod.outlook.com>
	 <Zvdq7o6NFXRVCJqX@heinlein.vulture-banana.ts.net>
	 <16c89a7b9b85d21f1f23aa0d67742c6bde94a295.camel@codeconstruct.com.au>
	 <TYZPR04MB5853A70A99CEDE8EB64A317DD6762@TYZPR04MB5853.apcprd04.prod.outlook.com>
	 <ef0e0be6cbdcf410ca7854884f32da0e3cf6b295.camel@codeconstruct.com.au>
	 <TYZPR04MB5853D743126A23AD41BE3E0DD6762@TYZPR04MB5853.apcprd04.prod.outlook.com>
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

On Mon, 2024-09-30 at 05:55 +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>=20
> I have one more question that if I need to add the DTS based on the patch=
es that
> have been applied but haven't been merged in torvalds/linux.
> Should I also based on the branch "for/bmc/dt" from amboar/linux to creat=
e the
> patch?
>=20

You can do that, yes. We can at least then be sure your work won't
generate conflicts when I try to apply it (unless you've
inappropriately split your series).

Cheers,

Andrew


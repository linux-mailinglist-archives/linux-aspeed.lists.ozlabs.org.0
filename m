Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CC54D0C5D
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 01:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCFnh0mM8z3bPJ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 11:00:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Pk4G7Fjg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ObwHECK+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Pk4G7Fjg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ObwHECK+; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCFnV3t6Qz2ywb
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 10:59:57 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7F12D3200B25;
 Mon,  7 Mar 2022 18:59:54 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 07 Mar 2022 18:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=V7i6d1/zoSIj8y
 jrC94ahJsp08pYVQsAAj6J5U58ios=; b=Pk4G7FjgiLwBM+Zjzd2NDKgEZox8Kx
 5LN9D5bAjVml767nD5tWFhZlGUb3xoSF3uwvJD9MsGAqXVkihWCuuaMY62nsbsJT
 8JoD3H0LcWGt132QyEkOB3VNuWjZykvnVO4yHMQgXpBSEU3mhOwhyoaalHb+bhS+
 3GJ2x+dxbwCoFJhVET0Nxl9PQ/uzot+IzAjr6P5zMmBhs2bF5GKNtolK4DJDpj1X
 NE/e//5CbmHaBA5Hlh/Gyt1NY68X+aJdP6DhYGCoIPPxaF7Kko1+rFsbcVzz2py+
 sN94AmbqZnyYwZhIklvIzx/dRbEPxMJmdZOjSx8F6kTp/p+0t9YdzOLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=V7i6d1/zoSIj8yjrC94ahJsp08pYVQsAAj6J5U58i
 os=; b=ObwHECK+TEjc0RWRUZdmdwX7CKOvDgeoO1MRBRmvvSOGHVv1KoycUqSMN
 jgbKOzyxgYQn1doPN/Ha1Bpzo7ROtz748rLEUcSHGbr7HC8P1ECGZ8K+x+DtICRi
 rmeYBvQJeB124H/SgtpUSBE7wNoDG5LnS2lpsw241djqCtJryrRhfoOA/bUV+lzg
 Tcj3BbGriJmxNmOPiGstXpCHwuo91Zi/3+z3w6vK1dUUKhEf25j4gW6/qfi1xl0d
 mEfLThtVzzMRJ6d1or13gsGWmvTeQROkavDzqD09CrrdZWmiw5flDc1sWuSj87lW
 sdbk1Lt9CvfrJOJTfMLInGWeY/emQ==
X-ME-Sender: <xms:eZwmYvVx1gDFSYaBGGGypuURHHPU_0IHDVUdou6_GkpPi_IlTZ6Neg>
 <xme:eZwmYnm_gtFhdMi7E05gCRmdHEhClRKmFIJo-6A505Nrt_fmhd3pOk-CcsFG3CeBx
 ek35g5F3pR5EM5Vww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduhedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:eZwmYraUnhWbFGrcbuNEDrHLxDTx2vmZXucqZoQl-iGpMZ7sVFZVZA>
 <xmx:eZwmYqVBzN6e5uL5PV3MQNP8HuHjAOS9Y0hO_jH-qrdxydb2shDtig>
 <xmx:eZwmYpn1UTYpUuAN9d2-iJl_HJNIxNJ_E0MhvlgccJM8ALMal4YPDA>
 <xmx:epwmYpv8SahdjUnvIi5E8eT5BKok5i7ZZQLKpYgI_R_8mKNik5Cvnw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8C016F6007E; Mon,  7 Mar 2022 18:59:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <22db3bbf-9796-43ac-84a4-081977827ac5@www.fastmail.com>
In-Reply-To: <20220304011010.974863-1-joel@jms.id.au>
References: <20220304011010.974863-1-joel@jms.id.au>
Date: Tue, 08 Mar 2022 10:29:33 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix AST2600 quad spi group
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 4 Mar 2022, at 11:40, Joel Stanley wrote:
> Requesting quad mode for the FMC resulted in an error:
>
>   &fmc {
>          status =3D "okay";
>  +       pinctrl-names =3D "default";
>  +       pinctrl-0 =3D <&pinctrl_fwqspi_default>'
>
> [    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid=20
> function FWQSPID in map table
> =EF=BF=BC
>
> This is because the quad mode pins are a group of pins, not a function.
>
> After applying this patch we can request the pins and the QSPI data
> lines are muxed:
>
>  # cat=20
> /sys/kernel/debug/pinctrl/1e6e2000.syscon\:pinctrl-aspeed-g6-pinctrl/p=
inmux-pins=20
> |grep 1e620000.spi
>  pin 196 (AE12): device 1e620000.spi function FWSPID group FWQSPID
>  pin 197 (AF12): device 1e620000.spi function FWSPID group FWQSPID
>  pin 240 (Y1): device 1e620000.spi function FWSPID group FWQSPID
>  pin 241 (Y2): device 1e620000.spi function FWSPID group FWQSPID
>  pin 242 (Y3): device 1e620000.spi function FWSPID group FWQSPID
>  pin 243 (Y4): device 1e620000.spi function FWSPID group FWQSPID
>
> Fixes: f510f04c8c83 ("ARM: dts: aspeed: Add AST2600 pinmux nodes")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Looks good to me.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

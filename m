Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C823819F4A
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Dec 2023 13:46:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=pUSOCUyw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=p3ozTPuX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwCwr6zQ6z3cF1
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Dec 2023 23:46:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=pUSOCUyw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=p3ozTPuX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 407 seconds by postgrey-1.37 at boromir; Wed, 20 Dec 2023 23:46:07 AEDT
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwCwb4qFxz2ysD
	for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Dec 2023 23:46:07 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id CFF673200A5F;
	Wed, 20 Dec 2023 07:39:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 20 Dec 2023 07:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1703075953;
	 x=1703162353; bh=iFuGp9+YglG9+WeND0DvLC6xEDiN9ijquxV/NP8YOZw=; b=
	pUSOCUywYhIezLCr7rkV7bW99UTKo3XX7u8eMfbmlpqkiy2IQjWDYoYXDZXP+2Ux
	lbO3JyCKENCwHrghYXd/kZBUg7h2L0X9dg74hDbcarFEa87IoKNbs7XVCwF6rB8H
	bDJxlbAR1DmvqQQACQ8Mv73/K2zsaxj1D3ArFBEYxbiap7YBiesedA1wmmICX4Nm
	WFn0R3jbkwXd/9nn3AHgaRwxyplseRn4zsfuYlluzzLsyekvEBR8+Dxt7D1G0r8N
	+3GYupaQCoep8Pu/bv158dgLdHF7+c04b9M7JLXLXtDCpcnmgT8CASoM6Oh84jbx
	CvvWk43JciJAenrvfKdBVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703075953; x=
	1703162353; bh=iFuGp9+YglG9+WeND0DvLC6xEDiN9ijquxV/NP8YOZw=; b=p
	3ozTPuX+HSTM5nIZq8bX4pE+/4OjLCbXejA0khQCwyk9IXAVGXa6GB4J80yA6FAz
	VqHOaXYgZyhAqGv+lC6rYhCRma31gmy8dbIvhu5h9hg6S6pjhXP2Lxhj2vdZ6hQr
	EQVb35FYyEezfVusM859u5GVjKTIZfCmgPLTH3rRVmNpOYQa1I5gPTbZaEFXaLxB
	jYC7ebWGFGfzAo0ChsI6JOooaAVeyGtXoJ0QAPxYZe746zhQJ8rfS7H4pzLRubQa
	xkf/6Uf5ZN+ETyD+FbUgMGUB7//yELSN/Uo9pkvVhxKgWAH3M9I99FslNt/VMiCM
	l+tO6boqg+Q7lVmqBIRcg==
X-ME-Sender: <xms:b-CCZVh6iYSSUG__lMVdbHAtugrv6GVoSZRbikE-lD4dO-AalhCk6Q>
    <xme:b-CCZaBDilOTuh6qMHWBNZ4cylvLAIgRicnv5xMC32F0fCTU_PEEL0dXKJjifI714
    v5qeDoi2O_YdpNWrms>
X-ME-Received: <xmr:b-CCZVHjgNn--lEAwHoi6a-tKnEstVmBKQaegzkOvOE0GoiXU0Czm4vKs5cqzcu1_J9PgIKoowB2QRc0Y69g5Qu0uya-j9e6ZMX1cnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpegtgffhggfufffkfhevjgfvofesthhqmhdt
    hhdtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvddutdeuteegvefhueevgeef
    geeiudefkeekleeiveduueevtdeujeelfefffeetnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:b-CCZaT7qnkBYEqhnjbgzMeZHcmWiWCjQeB4aRK8n-EgI-KzaRr4Hg>
    <xmx:b-CCZSxBVtuhjjxa_XB-UyRYK_nKgr6TsC4Wu1v1qvmsvcyu1NzIYA>
    <xmx:b-CCZQ7kvZ8NtglNkNqts9xHk1Jxn7HdJ_SWuyVJhO_iqUpyJZaSEQ>
    <xmx:ceCCZWdNxt3VcUjHdPnWvPeyI4c9N23sUbOVieEwD1PDgFf-YqPqqw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 07:39:10 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Patrick Williams <patrick@stwcx.xyz>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v8] ARM: dts: aspeed: Adding Facebook Bletchley BMC
Date: Wed, 20 Dec 2023 06:38:59 -0600
Message-Id: <F444BFCC-1D44-4AF6-A0E1-B153A217FFE3@stwcx.xyz>
References: <20231220080733.GA30641@wunner.de>
In-Reply-To: <20231220080733.GA30641@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
X-Mailer: iPhone Mail (21B101)
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Howard Chiu <howard10703049@gmail.com>, potin.lai@quantatw.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Howard Chiu <howard.chiu@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


---
Patrick Williams

> On Dec 20, 2023, at 2:07=E2=80=AFAM, Lukas Wunner <lukas@wunner.de> wrote:=

>=20
> =EF=BB=BFOn Tue, Dec 07, 2021 at 05:49:24PM +0800, Howard Chiu wrote:
>> Initial introduction of Facebook Bletchley equipped with
>> Aspeed 2600 BMC SoC.
> [...]
>> +        tpmdev@0 {
>> +            compatible =3D "tcg,tpm_tis-spi";
>=20
> What's the chip used on this board?  Going forward, the DT schema for TPMs=

> requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".=


Why is this a requirement?  This assumes there is exactly one chip. TPMs are=
 often placed on a pluggable module in which multiple vendors could be used.=
 There is no way in the DTS to specify multiple compatible chips.=20

>> +            spi-max-frequency =3D <33000000>;
>> +            reg =3D <0>;
>> +        };
>> +    };


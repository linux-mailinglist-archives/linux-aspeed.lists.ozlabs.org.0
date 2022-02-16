Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8E64B8EF7
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Feb 2022 18:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzPmG4M4zz3cCS
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Feb 2022 04:17:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=NOU0wvUk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ctDVde6C;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=NOU0wvUk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ctDVde6C; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzPm433Jsz3bc5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Feb 2022 04:17:39 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4EF473200953;
 Wed, 16 Feb 2022 12:17:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 16 Feb 2022 12:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=oNwOSQ3qh0rFRs
 kCwE18LbAyBomZpSW2k/cB0L6ZHJs=; b=NOU0wvUk7VoHj5PaFSko4qNGTm3uMO
 KkrseP68AbFPwl3hv5mR3TeSgd64qS5uSVhAE7YwFcRVIObTa7wDJ/hv9NYMFl2Y
 xyViqXdDUq9H2JCWeuPnHAzTQu1NXm3+rAH33BT5xY535yRXCwsBRaBZ6Ih4S/GH
 F+OYmQgmvlQ2AmtWKnz2RpblExvLktwkPeLeoQLTrbfcYtfKiHFZmNnpHs2o7ht6
 i5wxPlarNIwABym4XOQPnm1uzDVG1phWLDi5WNPrgi3FIoiti88RWNnD3buf/ZnA
 7iJRWpnXPjdyADOuTTbaRbrUUetiAPleUtFR2Ic7exledMrJyNz83xkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=oNwOSQ3qh0rFRskCwE18LbAyBomZpSW2k/cB0L6ZH
 Js=; b=ctDVde6Cwf0HU65uLPJjAxX+sXZBkz/DXdTyz65f3WOPdPe7tFckvxK7X
 RJfNeJLCQOFkm/UkVq4yzMtzkuYqRSEttGmB2DagENcGykstCXIjQ103KPaOXBtP
 dQ3bOr9PtG+XA/nn8HUTwVLCzjb6xeGrDv75uaoXHYvCp80k/zxKtfn+PYNsAwXo
 VQh4cXmjVbxKBIp/LO0NYwEBaJ38ug49v4OfDChC3wKV/JX+ujkomJWD8We+BbDy
 McAlBcYV3cpHIU3XDMkocDeOsx3m6GVKkFd53PaNrwPkabndaq9erbxxq5l89Wsk
 lmowWEufcpoRn1yBnRkAnwQyoQnug==
X-ME-Sender: <xms:rDENYlDyT9vfJQY8EOD_7yWM0xZYEFQrUe0FdKNctMUR8Oebgk8kFQ>
 <xme:rDENYjgodD57Sux7cagIGg9uuPEBwlslPErhh6uoEn3jZP8cmmP1Zhhg8ht_40ZiO
 P9EaI24Pk_ks-Ky-ko>
X-ME-Received: <xmr:rDENYgnIl47-JMGupNvqIvOvJTW4NWnfwENQ49RQqJ4fssc29B02m7Ka8nDod9mjm1SujN1KoQ0hbFTJtPwT1sKQuM4e1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepudfgvdejvedtieeuteffkefgvdef
 geeiheetieeltddvveefhefhgefgudektefhnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:rDENYvyth4-aOVdU-HNSfC_jchLjBikk72ieiKL--3FtACL7CHm8oA>
 <xmx:rDENYqRAqSu5tvsqIr9rVxze1p-2CbmXxVs3SxISlKnePBrQvLgJsg>
 <xmx:rDENYiZ6OvcCiLma39nAfAZbS2YSvx5bAOG8luDh0NZXLErn4OJ2EA>
 <xmx:rTENYpGL3sa8I5gV1Jh5cxACk-K57y7un5WX4G7383oBRxqacyxDIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 12:17:31 -0500 (EST)
Date: Wed, 16 Feb 2022 11:17:29 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 00/10] update Facebook Bletchley BMC
Message-ID: <Yg0xqSV+k/O+vwSs@patrickw3-mbp>
References: <20220215163151.32252-1-potin.lai@quantatw.com>
 <CACPK8Xfs34gw2_XGeduJ6D=-khN7RtMj3LY8hQ8B96fFxMuE8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACPK8Xfs34gw2_XGeduJ6D=-khN7RtMj3LY8hQ8B96fFxMuE8A@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Potin Lai <potin.lai@quantatw.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 05:01:56AM +0000, Joel Stanley wrote:
> On Tue, 15 Feb 2022 at 16:32, Potin Lai <potin.lai@quantatw.com> wrote:
> and given the minor differences from v2, lets add Patrick's review:
>=20
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
>=20
> I've applied these for submission in the v5.18 merge window, and to
> the openbmc tree.

Thank you Joel.  Yes, I concur.

--=20
Patrick Williams

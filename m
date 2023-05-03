Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C496F57CD
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 14:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBGGd1SY6z3ccs
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 May 2023 22:19:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CYoqoLnh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FZgc7BsI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CYoqoLnh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FZgc7BsI;
	dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBGGQ4V6jz2xG9;
	Wed,  3 May 2023 22:19:24 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id EC55B580E9F;
	Wed,  3 May 2023 08:19:18 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 03 May 2023 08:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683116358; x=1683123558; bh=Hc
	O3xa4y7bILuFGXgJl8e3SDSgP/OqMRFRqQtyylyqE=; b=CYoqoLnh1EhLeTmVUE
	5cRpQddLiBctwaYGkSin0ryx9CrGuqmSZktao5G0snVfi/YooxTewL2EhpR2lwIC
	el6E+zbGvbiqHmuYjbabAqXf5iBHsJ2VrCaXxr7tlq1xtz1aH5frRg7A4LZ/qIpv
	p7L1lfFDBGxlzOQw3aNFcHC7XXJMygHv4VlVnWfRHUJyJBQoMYH0YSOWYhP3qKFM
	scuw7Dw1jLTIjx2CyQvh3qdKlgLRwu0w+JHKuwDdKFLJbU3gm5qs+z4ZbkR/G5HT
	cNwQuFdyDG+4kEPzw4BwtDaY/jKaFuz0F9jYwKJ6r2pTmjNYxEml317zevCeh0t6
	N3mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683116358; x=1683123558; bh=HcO3xa4y7bILu
	FGXgJl8e3SDSgP/OqMRFRqQtyylyqE=; b=FZgc7BsIe5I0d4KEwq8QTh4l6DcNu
	V4igPBqmUvcjfdB5Q3L+LyMvrqAd5edxeArYwOixxqz8F8lP415DLXbwXxBV188G
	6pvT7BVgPp9Hcf01sGX5UofU8e70JGom3b69NVt7dklgyy9PPrPK8RjBkkBh3d85
	qMoEWxx3Kp6/KNF0XBNLE882iLPYYBupSrAdnR/GBD/k0ThzW1dAD0isIJFbFUB2
	ATXZaEWKZlOB9A9fflKucksTsekwYRKLNuAzHViCg4HZ6iMwhtQ+1sefPpjiJeSs
	+eFVv7K6tQKeV4pSxLyzVbcpOe7vuQrf2ddoJ0azNE7j7t/jBe3m/DCQA==
X-ME-Sender: <xms:RlFSZG2wIaPMnUCk0D7KqEawInmE1-_L62J3SMA4TIiKKHKzfDgyXQ>
    <xme:RlFSZJEoTCzQnYtgSxDlGxz71cJ60UqBPCZrdIUO7FRmYYIysF7_zfY5NZdszx-a9
    tVhxfpZE7joCMW8F0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RlFSZO7j62MYeAlUvjyPb3-P6o-4wwc37gOw1kgDz6mbK1MgAuf_Mw>
    <xmx:RlFSZH1Mg0LO6HmIMFrk6mCZ0cidUx4fxvD5CE7W8Ze6Bg_1CeyB-w>
    <xmx:RlFSZJGjH26FpmK1DgB3wX_QvRn2oXlx3c4mHacW2b7FJimCP_viOQ>
    <xmx:RlFSZFVn9YA1CIDFg0IEtfl6qrxsa6dB5O8KF0d2IrthVw2W78sneA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9F56BB60086; Wed,  3 May 2023 08:19:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <4e1e70a9-9b28-410b-bd29-fb5f5805798f@app.fastmail.com>
In-Reply-To:  <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
 <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
 <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
 <CAA8EJpq8x5wQa3fMebaSP3hCdMiCsZRaF+B4Y3N3royW_CeXCA@mail.gmail.com>
Date: Wed, 03 May 2023 14:18:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Type: text/plain
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups
 .io>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 3, 2023, at 14:13, Dmitry Baryshkov wrote:
> On Wed, 3 May 2023 at 13:39, Arnd Bergmann <arnd@arndb.de> wrote:

>> So with pxa93x out of the picture, we can simplify it as using
>> 'pxa' as the name for all the above chips with an Intel XScale
>> core, and 'marvell' for all the other ones that have a Marvell
>> core and exist in mach-mmp.
>
> Should it be 'intel' for pxa[23]xx then?

Probably yes, that would put it next to ixp4xx, which makes
a lot of sense (same vintage, same cpu core), though it is
a bit funny to have these together with lsi axxia and
altera socfpga, both of which are also in the intel
directory. socfpga is of course the only one that anybody
at Intel cares about these days.

      Arnd

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0798B062
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkq6CZlz3vXX
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727701000;
	cv=none; b=fQlhvVu/R2HtTzlTiNtEPQoqaAX5mkh9GAcAt0ibpuVw+cwGUqzRWrL3VkLMMPHMMK2sFWqztMv/pewNCY322ikHpkTRkG//LzWDuU2c3KL+oJpsGemq2aWafTkmFVggT6vne7KgsbkkRwL6rmzi/1otQ3Pz36e4IHeYuTS+f6d76K9r27/GSYLA/fm3arjXDyZlbuuLEN23McE9Rx30vTdV1ZcjDHHG/XimcXV9NqPY0L02goSnsYQBCzBLxpnBFdUzgM36PxLRZppesPTU1ukK+wSr/cUO8eFvfOe9KxmrfWt8dLeSUyHypNHsndgnb8FKyujPu+RnAV1MG7Flhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727701000; c=relaxed/relaxed;
	bh=+Y2rA94ZRCsge94Mb2n9rvp+3ph01mmSYoe6xjzea6A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXDHR9qp/BfRSTqEwWwqy9l8D40kRD13Liv6KU4gA5dk1rGQtARONTMbYELkm3N8FwYDVuuL/tsfEDgdQqZZQjeNe+X8C7isFZDD54Zqbod9ERPKkiop57EypLt/PvEksf88bFkjScP2lbLviWJ1th3LL8/BlhlsUckHZZuaxj4mO5iL49IivKCesniN7zw/0sfFtegDgIlTuarqJe4afrOtrMTU69Zdq9RG78gmR/Fa22K6xW5HWZxLbmg6DYDOrCby507fMGSIwWoe4qCnBBntNyUPUnb6H8Pbakoo2Vt4hCD6FA9472UhirJuqv5Tawa+OCPzNP9gZkolsDLF9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rUoVx6PV; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rUoVx6PV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHLgC3cYSz2ysh;
	Mon, 30 Sep 2024 22:56:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14DA45C0FF4;
	Mon, 30 Sep 2024 12:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D88C4CEC7;
	Mon, 30 Sep 2024 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727700996;
	bh=86l+n3oUOCw3cRUKaIVSOwRNK+3sfcj6behnUqpUl4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rUoVx6PV6rUDCc6U4wZInfOCNP8K9UdicEzWn6HmqDWqtSHMeG0hQyJJSrrhT6xmq
	 3u/bHlw9T6wv1VV1oSFimbRei++Uxh8fHUdGmMVbW7+UaoOgNJZh8qIUNx2f38wkDz
	 0i4O+1yL5J6l5J8D0oZqI2JpEKkFIF2F46znp5YvyMYSJ6SjDRQ6/FqZgEdmeHZN9O
	 35XEnqQRb+eXZPluuW71hMkfQdJ/fEhfcRWCOV+TG9VBRyVa0W6TZJqaovdfxZkzMS
	 0ZSJpYFwGpNxgLdckGd45p3qyC3hlcPqPV4kJ1PCA1dVhJ4jsfm8zOGX0J+6Qy0sye
	 OjZviUqSTgiog==
Date: Mon, 30 Sep 2024 14:56:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
Message-ID: <20240930145446.10d832e9@foz.lan>
In-Reply-To: <20240930124619.GG31662@pendragon.ideasonboard.com>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
	<20240930122157.GF31662@pendragon.ideasonboard.com>
	<4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
	<20240930124619.GG31662@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, linux-aspeed@lists.ozlabs.org, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>, Maxim Levitsky <maximlevitsky@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, Mike Isely <isely@pobox.com>, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, Olli Salonen <olli.salonen@iki.fi>, Bingbu Cao <bingbu.cao@intel.com>, Tim Harvey <tharvey@gateworks.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>, Jemma Denson <jdenson@gmail.com>, Michal Simek <michal.simek@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>, Andy Walls <awalls@md.metrocast.net>, Zhou Peng <eagle.zhou@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Em Mon, 30 Sep 2024 15:46:19 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > >> Cocci has located some places where the helpers can be used. This
> > >> patchset uses the diff generated by cocci, plus these changes:  
> > > 
> > > Personally I think most of those helpers just hinder readability for not
> > > much added gain. String de-duplication is done by the linker already.
> > > The only value I see in the helpers is ensuring that the strings are
> > > consistently written, and I think we can do so through other means.  
> > 
> > Just my opinion: I'm OK with these new helpers,  
> 
> Coding style opinions are personal preferences of course :-) My opinion
> is that this hinders readability for no benefit.

Agreed. New code somewhat obfuscates what it does with no benefit
except maybe saving a few bytes on each drive.

Thanks,
Mauro

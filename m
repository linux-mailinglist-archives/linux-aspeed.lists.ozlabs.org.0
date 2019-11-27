Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3410C09C
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Nov 2019 00:27:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NcPN2kh3zDqsN
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Nov 2019 10:27:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CtG0VEmf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DpByWhco"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NcPB61mjzDqgk
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Nov 2019 10:27:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D30B52268A;
 Wed, 27 Nov 2019 18:27:07 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 27 Nov 2019 18:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=yBXiasXxv0gjhYCb054yfAMOsqC33OB
 WoEwFmmhBlDA=; b=CtG0VEmfW54ClNVWa6lkKSLgU4CLCQgybG6EGbYDalGEPMm
 FsfG7J8/ig4x8DxwEx4qV8A0Ee9hyFFq8lWl3gdqqfoR87ebIFaXR44g+OhSlsmJ
 i0k7hHmyN5LIrZ+S26rzmj088HzrgGasbH9fDkmPxMvu9AmvvPKaMYZ/5w/W75DJ
 kysFPwMZzoDoe0gxM7H7fnP1l1mVEHWMTpXMbARASNSlRPlKec1+xAaz1u/upT8K
 DcswakEHKtFx3GETC2SaeHZnQ2dF1O+ixFwNUL6gyxgKwh3kjCHW94PToi0UN3XC
 2DTJ+KQLjGJTiO0Rb3eFZcx7YJRxZqT5QTJi+3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yBXias
 Xxv0gjhYCb054yfAMOsqC33OBWoEwFmmhBlDA=; b=DpByWhcoz5fQJTyByH06/r
 fV2sTlTnBpTfBb1dElxF+kpeEGdEMDuDgAXddJ94Gs4/oVUHHzJH1L1xq4LDGqnD
 aW+CP5ZJs1JliPsmOKcAvG5tTGujC0QzHLLzbu0i6P3oyDT6nyD38Yf2Mgxj09e+
 vWnRXTxMSDTEemm6vlwA0hPCJQ8bh3xyTHRBRXLKrP/LyAnnaIIA2+APKmrKHuCj
 LOPL9gQQxpg2spwsorgVdpj2HhAmt4ubR3JUZFjfa2CDxX4xEGsAphDemb8rLPfm
 fFyGY38TkaUPPSRg6vM6tR6bWq/muWCVl/45L83/bLxvxU/uavkAS5HMwlZYzkYg
 ==
X-ME-Sender: <xms:SgbfXUZ0teA62JsetIiouIbDFZ2wIgIqrkoRupzWmriMeaGyUtpNjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:SgbfXfYtg8mGRSgkaeRQJoYHgqYG_HscXjG5EWhiN1ea-XhZYQldpg>
 <xmx:SgbfXW1-LZMMZWOA9WIfrTeapZOF5tT2yYOuUDAk2IHQM0AssjTJ5A>
 <xmx:SgbfXdUd-QLH1pe_RzGcVR2_qv5okNT5u4viCWCC_2jLajY4XBTsbA>
 <xmx:SwbfXWwI73HKS4JN_feji9NFDdfWof7FuLFkS5jmB9G3Gj7ny05Edw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3CAF8E00A2; Wed, 27 Nov 2019 18:27:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <01b18f38-2faa-4896-9a61-d0c657596c6f@www.fastmail.com>
In-Reply-To: <493e2f9ed5aff112519adcdf2d3044bf54c2d91a.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
 <493e2f9ed5aff112519adcdf2d3044bf54c2d91a.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
Date: Thu, 28 Nov 2019 09:58:35 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Matti Vaittinen" <matti.vaittinen@fi.rohmeurope.com>,
 mazziesaccount@gmail.com
Subject: Re: [PATCH 07/62] gpio: gpio-aspeed: Use new GPIO_LINE_DIRECTION
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 5 Nov 2019, at 20:42, Matti Vaittinen wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Not sure where the series is at, but this looks fine to me:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

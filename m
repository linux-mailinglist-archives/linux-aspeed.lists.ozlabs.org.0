Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A65A4E8C72
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 05:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRd3J2khdz3c1q
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 14:09:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=dSrr5Wga;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Lgdgyi5x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=dSrr5Wga; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Lgdgyi5x; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRd3856Xrz2ymw
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 14:09:39 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F0B1C5C0195;
 Sun, 27 Mar 2022 23:09:35 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 23:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=eRPIQEcIPCs6OMQOOl3G8hBub3YleKz7YBHKRR
 2bzO4=; b=dSrr5WgaQ+E9zSY0UirG2PMsIGQ8xUUFOwmX0/0TRTaszDk1mS4ogM
 P51YaXVoaYEorCjYPB6ZElHUp7GdzqfV6pTxRHNBXdg7O4OIF7ofXmIlmw+Ncthv
 yjCzZpqi6C3PxTektVR69FsFI6Fh+r6MadedeRny6VksNRKof2FPvnrpQCAmagi4
 C4QzQDagnMP+9001lPO3qhVxnf3/y7Q9vc6Y0KHjA8cmlOIgj+Gw3B3c2YxKpwqK
 p1G76AzL6KeRGtwbQXT8tHD8WgeZPw/u4yMJ/qqN6pT5OUFhINkP3XZ0UJUt9rat
 cCLnuFYIFy9FahcCMdY6+oKHPehBPNdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eRPIQEcIPCs6OMQOO
 l3G8hBub3YleKz7YBHKRR2bzO4=; b=Lgdgyi5xoqClvro2HWnNWkCh+WB4VvlN2
 xTSTIkK9ojq6O3uG6pVopd41Xm0ri/MJNvoL8bV3y1fLkthdXPljPM6DSq/Tb1Xt
 uDM1ZZftUN2GTFHhD9lY5NpJVm50HAQTtkp4dCql0I3z341P/wAsywA0ZHRlI7kX
 culLaBjwSJrB5adThEmhQXE1uVem2fQJkD/LTr5bYMmvsJ+9CxyYC6DAOQ/LpqEi
 41NMZVzYnLATLgNTtvO3/00XulppRB1gzT8pZezM7DYKL7eJT8uV4cnEsSUwccmn
 jnakv45EhG72pxDn6rotrwLOtv6FirRQG0lKqbFETqLP/M6dkP4JA==
X-ME-Sender: <xms:7iZBYgImFQdfxBOCx_ewZl_EelRRvAJBLyqC7jbra-TDrqFfuQHZNg>
 <xme:7iZBYgIX9RGF1OV7UwrZwD9znxdsKL24Ufigz0fOqhtFABqTEpCs2A1T2esXdwSrY
 mTy7V1TtpL4E4IqwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:7iZBYgvwPsHLdeJjU90RQnLjP18Dzc9wVQ2NU2t_MXpLNNsRLOtHBg>
 <xmx:7iZBYtaCfex-tRaOmoWCBKgBhRw-_8I_O5fjYWNq0VnQMcmeyxo6Rg>
 <xmx:7iZBYna9iOKJInUW0PMAGVZ3AXufdSbNENYPplDn-3kfMqFQE2up3Q>
 <xmx:7yZBYsMPAJs3UtLasC53J-CYxkQqeqZ-H6CGjxEMZZpq7zSjm6jQAA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C983CF6043F; Sun, 27 Mar 2022 23:09:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <f55316d5-43cb-49cd-ba4b-6730c2a9b91c@www.fastmail.com>
In-Reply-To: <20220325154048.467245-2-quic_jaehyoo@quicinc.com>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
 <20220325154048.467245-2-quic_jaehyoo@quicinc.com>
Date: Mon, 28 Mar 2022 13:39:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed-g6: remove FWQSPID group in
 pinctrl dtsi
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 26 Mar 2022, at 02:10, Jae Hyun Yoo wrote:
> FWSPIDQ2 and FWSPIDQ3 are not part of FWSPI18 interface so remove
> FWQSPID group in pinctrl dtsi. These pins must be used with the
> FWSPI pins that are dedicated for boot SPI interface which provides
> same 3.3v logic level.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Fixes: 2f6edb6bcb2f ("ARM: dts: aspeed: Fix AST2600 quad spi group")
> ---
> Changes in v2:
>  * Rebased it on the latest.
>  * Updated 'Fixes' while rebasing it on the latest.
>
> Note:
>  * Removing 'pinctrl_fwqspid_default' doesn't break any existing DT since
>    it has not been used in any DTs.

Can you please send a patch to the bindings to drop the broken 
function/group given they never worked and no-one could be using them?

Other than that,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

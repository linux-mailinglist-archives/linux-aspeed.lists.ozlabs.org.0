Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D138A4EB829
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:03:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSqVN50w2z2yb7
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 13:03:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=G0cqwnCE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VeEx2Y9l;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=G0cqwnCE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=VeEx2Y9l; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSqVJ2shsz2xt7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 13:03:52 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 63F585C01CC;
 Tue, 29 Mar 2022 22:03:50 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 22:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=3lOGTngDtZabUxHOzMCXhzSDxrBsH7vOqXNJAc
 qBp+Y=; b=G0cqwnCE5uDlLLTDqN/HKduae+kHxE28qv0BYtgOhhH+KSmdSjGTsk
 XIsh9gVuxThQK+wcgntsdjOjIJNr6zDyWhTHuBDWsS+V9qANjDIZoUJeNJhvb/D/
 mprD7FqJoBPd9qZKzRZOmPbWphSKoJZ1VXAtC8WCcJoKlwKV5jIQLl7uAmxdMtpC
 BclsPZknsVwIrMLx4cB3T453RIuKHcpVd0lkVoemLtwjgGyirhjbTgzltT3iMJRF
 b7m0atM9IoRTq7QqOpIt8b2lVGDp7SP7QwxhOR51Qy8phpgUo0IcVqC5r5sPy5w7
 9GhCXdqM4KswqBKCnsxfZg4r4LUi4bdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3lOGTngDtZabUxHOz
 MCXhzSDxrBsH7vOqXNJAcqBp+Y=; b=VeEx2Y9ldIPbFf2jhfs4BrjTzdzGsMDS6
 nREazG+U4z5Cm3MpQatzeTAAjblj+X6IMaId0VsF05uMv0RrLgWpljJiQmR4EjyG
 XWJ7ykbExNWLSqhe/wyZSQ00aTblgGM2MeDa9lLQyUgxGG52wBKBSBIFm8dFA57G
 yaUCpdh3AGsiwOb3BxylcCr3SUJTXkaZ4GE9j//bMNSf6oA02RQN4PebAXnj0eDe
 tCCejeJri5XVSXduX8mOcvMwa1UIrqqaFGyIYL0iJbkWWehMhsJaxRzaMz3WlX9a
 9eiWkNpOg41kg1y4TcnPBWBvGE0WsRl/5ioLpx7kppF0cY/ssUElA==
X-ME-Sender: <xms:hrpDYjt9F6kj6jWlRlvPngvthh1gybt0i4GvX6y8c4zVo6S59jGgYQ>
 <xme:hrpDYkdw3f3__IKIL9-28t_4ym5W8nle5jOPipvJu6sOa8-gOMRT4AKV8sFQJcqyi
 6UkoK6guKTu10bGcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:hrpDYmzw_BR5csG0M7_HCK2LQLWsAkYSwi-hphQO1QgJ3QacDYnYpw>
 <xmx:hrpDYiPSJsDX_Fx-2YiPPSCyx_1Dl28-Oa8CEsJY_Y7-ON4NFU931w>
 <xmx:hrpDYj-v2v_sD5D-YRFObpvJewbctjugEOUD1mtpncBiu1E6Cda01Q>
 <xmx:hrpDYvTLuPbYI_bJXEjUGYScsiwI5WdhSF4AbB4SPcSt5bC8_6mJ4A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3171FF6043F; Tue, 29 Mar 2022 22:03:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <74310f2b-e562-48e0-a3f1-e087eba4b4f9@www.fastmail.com>
In-Reply-To: <20220329173932.2588289-6-quic_jaehyoo@quicinc.com>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <20220329173932.2588289-6-quic_jaehyoo@quicinc.com>
Date: Wed, 30 Mar 2022 12:33:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 5/7] dt-bindings: pinctrl: aspeed-g6: add FWQSPI
 function/group
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



On Wed, 30 Mar 2022, at 04:09, Jae Hyun Yoo wrote:
> Add FWQSPI function/group to support QSPI mode on the dedicated
> FWSPI interface.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

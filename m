Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 622986940DD
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 10:24:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFf6Q25Lfz3c6C
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 20:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AhF7TY9R;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AhF7TY9R;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFf6G6k9vz30Jy
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 20:23:50 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F85420034;
	Mon, 13 Feb 2023 17:23:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676280230;
	bh=8NfI8n6ob4UpJIwWuXqxPyBf2X4KaQKZoWPaNN7OI/o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AhF7TY9RIivSqSFJEZeHw70z/vCFZp4aAp1QY46RqbPjJsZIlMygkbz5vJ25Yp0BC
	 uSIjVQ8vwf+ZxBu21PnOlyz6fMEZXsHX2aR5kXTA02ZYvnysgPVyTUESTcnYZre5QY
	 UFIpJoVPnlz0lhT4ELJpWSudbKuQGOPdnubkKYPOQIXgPpKBzRdk7eyozPsioS6ENT
	 kU5j0g+ZIoKqSLGxIMb7soibcSDL3pa7qyo8D/n0JM6YzhJwbZ0UfmFMu1T48HvPza
	 vwWfNLwj8qaaZ/+pywsfK2CrT/KIHnJgZ8aCiH+iEycCH7KuvussmuLNcoii5dnArV
	 y57z05Xo3nLKg==
Message-ID: <34b2ebb4781c6157496012efce392743e1821c8a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 13 Feb 2023 17:23:50 +0800
In-Reply-To: <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
	 <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
	 <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
	 <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
	 <2a3f5c20-3bfb-c1b8-f9df-d1908022509d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> There was clk already, wasn't it? What do you want to change?
> I asked why do you call it in the same patchset aspeed and as2600?

There was "clk" and "dts", where the latter should have probably been eithe=
r
also "clk" or "dt-bindings".

I'll unify the "aspeed" to "ast2600".

Cheers,


Jeremy

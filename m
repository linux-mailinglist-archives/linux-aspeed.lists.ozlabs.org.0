Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61106694017
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 09:55:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFdTz1BMKz3c7B
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 19:55:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LPbOy8m+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LPbOy8m+;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFdTr32Dmz3bT0
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 19:55:44 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5A8B220034;
	Mon, 13 Feb 2023 16:55:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676278542;
	bh=805Rlyhp1RvwvPx1kSRwx0ocdJBODymtJNL4keLIhvU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LPbOy8m+vOz21u/ZqcRYCITsCWtw7iYAuiL1myx3Wgio46FlBaOzOqWy47RTb3GPx
	 SIQxGux4Opl63nFvFOYNzVH+tjuxRKFqRc5+1Qld3UdD5SWHhSD+U90wGY3Gp0Ls1R
	 F95K2xOkfa74/izkYFVPCm5nZaCoV759ul8K6l28QptgU5trN1n4lQSNFCtMB6BfMJ
	 QVpeD1FwhvyykqveK7ztd9i5cwbY5DlXIC2L2jviHP1CXH1D5hFOXW0rrW3z8trKms
	 BdIkPxEnOU9rqrSn+0aqEVB+e+6EzTu+XLzz9tQ/Nw+/Nz49KoWE7gJYRMGlLmOvrM
	 /VoTtQsTYZZRQ==
Message-ID: <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	devicetree@vger.kernel.org
Date: Mon, 13 Feb 2023 16:55:38 +0800
In-Reply-To: <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
References: 	<5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
	 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> 1. Do not use "This commit/patch".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/sub=
mitting-patches.rst#L95

OK.

> 2. Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the
> directory your patch is touching).

So "dt-bindings: i3c:" instead of just "d-bindings:" here.

> 3. Subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.

OK.

> 4. Where is the driver? Where is the DTS? Why do we want unused
> binding in the kernel?

The driver is coming next, but I wanted to sort out the structure of the
binding before committing to how the driver consumes the DT data - hence
the RFC.

Cheers,


Jeremy

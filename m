Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E66940CB
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 10:21:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFf3g5Dbzz3c6G
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 20:21:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RHsyzzFM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RHsyzzFM;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFf3Z28lyz30Jy
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 20:21:30 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4175120034;
	Mon, 13 Feb 2023 17:21:29 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676280089;
	bh=xL/m04ySNSpKjFqiSAw/VBahvIfDK5HdjeVbiBcmgfk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RHsyzzFMmdmPkXEwVqXe/xZ47K+EgUknJgR/ve0ZqNOSXCOmvkc+pgrDWwKxy8gU7
	 zewJhb4ECO+dObwxXSY0Vqoe9P4VXt+mKSIXHnQUlt+R/GrG+Z6bt58K4B70qZI9A/
	 vsVtoQLlWPNpkZDxJmUFtnd6V3fuLvfOD9D5RWZ0O77yUNvLa/FrS/DP+R5pKVtxuU
	 kzI1I8zymRjC5EzVGj5K90cDAuNr6YoWX3lC5bKy49F0+nG0kVjjhX2yuWTJqnyEYq
	 Sf/E4gPRR3LWtUBlSsGEfHYCPK9nuik6/Q8PrJguRlzJ8cVmhreylKHF0mMwCWujqq
	 lh6xnorcpp6ZQ==
Message-ID: <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	devicetree@vger.kernel.org
Date: Mon, 13 Feb 2023 17:21:28 +0800
In-Reply-To: <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
References: 	<5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
	 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
	 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
	 <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
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

> You should clearly communicate that driver is coming...

OK.

> Anyway binding comes with the driver, otherwise how can we check that
> you actually implemented it?

I'll include this with the driver once we're past the RFC reviews.

> Please send patches, not RFC. RFC means you are uncertain this is even
> correct and you ask for generic discussion.

Yes, that's essentially what I'm looking for with this change -
particularly with the pullup config, which (as you say) could arguably
be a pinctrl config instead.

If we do decide to do this with pinctrl config, we'll need a separate
driver (and minimal binding) for the global register set to act as the pin
controller. That fundamentally changes the structure here - hence RFC.

> generic discussion comment - implement how other recent i3c bindings
> are implemented. This is basic device, there is nothing special here.

I'd say the global register set makes the binding layout a bit quirky,
as you've identified already.

> Since you did not respond to rest of comments, I assume you are going
> to implement them fully - including dropping the questioned
> properties.

Yep! Some of those will then be unneeded in this binding after going to a
pinctrl approach, and I'll make the fixes as you suggested.

Cheers,


Jeremy

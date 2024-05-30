Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1358D429A
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 02:56:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PhjK3SC4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqSP46GJ3z79wG
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 10:51:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PhjK3SC4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqSP06nptz79tt
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2024 10:51:16 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 060912012A;
	Thu, 30 May 2024 08:51:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030276;
	bh=I+Jt+udxkxLDKi4W/Bzi1caUOt8FQXDEn4VOX4aEVRU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PhjK3SC4A8NA+0dUQW7/PxHfqhTqOmLfS0LUmZtAmYgU9g84HS9NDxLylx2ooEOhq
	 9QXi0rQiw15L5gh/Uar85HJBRPF/vZCmY95lDQuUETo1KgHf28DI09FXfvFgRa7+Jt
	 Z4N1eicE90MIkEbJmDGHSkrcasv2rXYahN1+r5ioVz8fFP9nZxUt+aWkcsU9OoGJ7D
	 sidaVkD8ipqgYheETX7tN0wCwFoczSwdmOUyxjqUwbwSihM5HPc5aHOSyO8qNTStcR
	 v7HNVtquzssw/CYm6VTWKJamrs7VXmWDoGto4zGnoQ/2zv4XNsAXaJJVjYBZcFpBfQ
	 33XqJkEXLtEng==
Message-ID: <91f9d528649b967e7499f1e85b83da03b8a0f5d0.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: aspeed,sgpio: Specify
 gpio-line-names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 30 May 2024 10:21:15 +0930
In-Reply-To: <5d0016f1-ccdc-4645-9840-6f8c2870ef6c@kernel.org>
References: 	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-2-91c42976833b@codeconstruct.com.au>
	 <5d0016f1-ccdc-4645-9840-6f8c2870ef6c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-05-29 at 09:27 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > Some devicetrees specify gpio-line-names in the sgpio node despite it
> > not being defined by the binding. It's a reasonable thing to do, so
> > define the property to squash warnings such as:
> >=20
> > ```
>=20
> No need for ```
>=20
> This is just commit log. Not markdown.

I'm going to do a v2 anyway, so I'll drop the markup.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,

Andrew

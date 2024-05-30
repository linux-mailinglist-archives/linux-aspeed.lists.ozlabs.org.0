Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 252168D429F
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 03:01:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T6bqyRov;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqSQX00vDz7B2B
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 10:52:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T6bqyRov;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqSQR6wQpz3vk0
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2024 10:52:31 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3384E2012A;
	Thu, 30 May 2024 08:52:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030351;
	bh=n01f9haUhpidbjvmciLoZrlzyDDS830l30cbA3EuZJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T6bqyRov8LcXQkQXJ0uCFoJfmBQzNsyePRnJ2UWV6Ud+Eni2Dafr+3yPFhupAE9U0
	 DkvbDTKacaBVLodFczqds0yNp0G6knPS6eh8uFxoZq6iNpUV2C3BAL6PkL/0dDXRch
	 nIvyvB5+lUQVl8M6qFWE2mgfCqDVNhIyQSKnavemtntuFQjj1H4mZ+HMJD0Ud02fk7
	 mRN+g5pXbt8xhk24c7eFtUsdb8D5MewXlilLP2TkZFVOzHS50smi1rRcKA9XyuQw7m
	 vTQkzvvx7Kxwzb9Dy8ZlQeY++BMcbhH8Qmbi3aXjdIGcMLm01goRd8Zx/R+JwkjdGA
	 tk7vFxxUuJPEw==
Message-ID: <032b986258c92b6d400b2514cc018b8622ecf355.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/4] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 30 May 2024 10:22:29 +0930
In-Reply-To: <e40041ef-fb1e-4348-97b5-64487859a7f9@kernel.org>
References: 	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-3-91c42976833b@codeconstruct.com.au>
	 <e40041ef-fb1e-4348-97b5-64487859a7f9@kernel.org>
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

On Wed, 2024-05-29 at 09:28 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > Squash warnings such as:
> >=20
> > ```
> > /home/andrew/src/kernel.org/linux/build.aspeed_g5/arch/arm/boot/dts/asp=
eed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#interrupt-cells' does not mat=
ch any of the regexes: 'pinctrl-[0-9]+'
>=20
> Please trim the log from unnecessary path components.

Ack.

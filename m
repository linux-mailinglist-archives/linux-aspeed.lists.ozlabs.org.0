Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 251808A8C35
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Apr 2024 21:37:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ghgGf2f4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKWPp2tL0z3cQX
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 Apr 2024 05:37:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ghgGf2f4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKWPZ3ZYGz3cG6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Apr 2024 05:36:47 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 897C81C0004;
	Wed, 17 Apr 2024 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713382596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7evEF4M6GPcsPmLEVtaklRbN3oddZv23iJJ5uZYo1w=;
	b=ghgGf2f45IeZTXjBpsGdPMuWd1ncRBP1tqlf2U9a+XPR5jSAhD4+4upvFNHMlyVPsCQSXS
	ZPMUAxlsZe3Poc2g1mfKVxsHZjKyzZcY/CSKtT+wx13A8fDkhPEb5OBekyEVmGq2Vi3IxQ
	HkCZ1eX5JNxCCh2Bx2gfvDdeI4XIxZrWbMKh9s1R/eoKAqhaZteRCf7jhRvpDk00wfo9fL
	ukWFfn4bFOfXq8NxS4XWkIaJFfj9dArEtefST2GeJiGv6jbjmWvlpWehVC+fM9nTM62le2
	vhXQnW/jGpc9fBEz0qUqKZHeEmP0LtHv/0qxVErouShhNPVwHO3jsflfEiWGeQ==
Date: Wed, 17 Apr 2024 21:36:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: (subset) [PATCH v3 0/4] rtc: convert multiple bindings into
 dtschema
Message-ID: <171338250318.37347.8193747079895691565.b4-ty@bootlin.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 13 Apr 2024 22:22:15 +0200, Javier Carrasco wrote:
> This series converts the following bindings into dtschema, moving them
> to trivial-rtc whenever possible:
> 
> - google,goldfish-rtc: trivial-rtc, referenced in mips arch.
> - lpc32xx-rtc: trivial-rtc, referenced in arm arch.
> - maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
> - orion-rtc: trival-rtc, referenced in arm arch.
> - pxa-rtc: add missing properties and convert. Referenced in arm arch.
> - rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
> - st,spear600-rtc: trivial-rtc, referenced in arm arch.
> - stmp3xxx-rtc: add compatibles and convert, referenced in arm arch.
> - via,vt8500-rtc: trivial-rtc, referenced in arm arch.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: rtc: pxa-rtc: convert to dtschema
      https://git.kernel.org/abelloni/c/bbd3e43662d7
[4/4] dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
      https://git.kernel.org/abelloni/c/c3a0ee85f6e3
[2/4] dt-bindings: rtc: convert trivial devices into dtschema
      https://git.kernel.org/abelloni/c/1c431b92e21b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

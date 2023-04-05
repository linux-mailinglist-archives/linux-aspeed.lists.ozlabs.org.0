Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C176D7369
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Apr 2023 06:35:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrsHS5mDTz3cF7
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Apr 2023 14:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IXb2wDEd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IXb2wDEd;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrsHK4D67z30Lt
	for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Apr 2023 14:34:53 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4E08120034;
	Wed,  5 Apr 2023 12:34:46 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680669290;
	bh=/JY2GxUV8U7PZngfK9sN6bkoR5ACX/UvT6PfeNBweuM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IXb2wDEdqFp90wdXnhW8iMMEHY8wgKoHLl7EYL59NXC0Wd/Z+LQP9si5bE78O4Hpu
	 jgoyRd1c8MVesV4H8maoFsrFl48WhplmDRpRbTEiF0vQtsdi7SaN+TkN+WYSvm54IX
	 Pi766232ohCgD1zl4lsOIit1FdEjvgI3k3mtTqHTiAhAeSfTRY7X3TsyMgmKCLWhPQ
	 C/spOsDuM3q1MlJ83SW3pYgbQb2BNvEoL5cdZ7WQH83DKxm1MkudoUpKBLbEcuCNzD
	 kpp6y9D2Ld8V42fbjI9bTaZVzI9/Z2r9/txrOrz4GkTnYJJog/Ua6Q2pJRjUStX7rp
	 axgm7LdCgP/Dw==
Message-ID: <94e941a2895bbb40d7b87acd7de6525b8596b096.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c
 controller
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 05 Apr 2023 12:34:45 +0800
In-Reply-To: <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
	 <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com>
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, Jack Chen <zenghuchen@google.com>, Matt Johnston <matt@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

> Given we have acks on the bindings, I think it's safe to send the
> device tree changes now so we can merge what you have in the upcoming
> merge window. If there's changes we can modify or revert.

OK, I'll get those into shape.

There is one dependency on this though, and unfortunately it requires
solving *two* of the known-hard problems in computer science:

Do we start at i3c0 or i3c1?

[i3c1 would match the schematic...]

Cheers,


Jeremy

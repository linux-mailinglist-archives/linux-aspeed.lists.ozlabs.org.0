Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A6975E60
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 03:13:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3zwK07G3z2yR5
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 11:13:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726103614;
	cv=none; b=ZKp2lR8DGaEM2UStb/XDv6K1TZH4dUKszjTKZxloW9A0O0fsVYMrY085nQIv2NKheZH2kZd1b/k5z0f1ZwmUrxwP4TOWs1nWQhRv2o8OCQbXMyO7N+IZrBwuRrcxdzQrEdMYpMk/KwJYrCsPOGkXUK5dOVqcVGJUOTwv9H8NNOmxLUYUCaS6BmjHdWw1fJaa5FbC080u909I/2ZaQV0ZoF+VwAIlNCeoGNKgYcbmzPu6p9dqjlZkJf2MxDr8+/dCGDjC706N62BNGvyVTyPEMSiOd1KbfMB8dieJHWx6iSS61oJ0rMwpMRsFeyCx0u3IX0uR8OOml6s4dhnMgQMCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726103614; c=relaxed/relaxed;
	bh=S+MbdhdVOhOMSghEANs8RIXiI0K1AciZRyT3zzRZOq0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lde7u7kSwirpDCdEOHIo36YcZSPGyugb5FKxlxk7XJeWLKozTP+GeWNnLj/SjbE/dTpxKzMxtx+YWVkrr5m4bnhlDJhaQ8suYzOYVUH5e18SzFqQF0xcLkK6+HlupB7FathI2OqdJlzwSCb5JK6o9Rj2T1cMAb/YpslQYpEi0AewWmRCufFSxPYBeZN3YBQXjikbAe6IeUdkLC7K44U1Zi09j30usGFu0oYGg5BDNiLh5z2Y4dWE8zCybNzUUf4eSiUwBORdWJIJU20en15lJeT6lQRnhM1hdVftI3yM97uRJBqya0psqTgJsPmjSimsQGpfaBDW0/JhtAr3vOMPBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cru5l5Y2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cru5l5Y2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3zwG32Ffz2xk7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 11:13:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726103613;
	bh=S+MbdhdVOhOMSghEANs8RIXiI0K1AciZRyT3zzRZOq0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Cru5l5Y2rBnuxKzpakQ/JaAECYPKlIOBOpGYvbSlvhvSTEcTVF1oLZpaQgdYrRHAf
	 Gsj+cbl2e+gfdes6mIsQdyphkQNPkNBWpQi0NzBfPdwPl3enSGwi4Mf0kmX3daoEaY
	 4DW5Hce8vsqEYuk22jAsPHNgTRaE8AAAa9YfD8hJeAXo/XxwIbwdHRCc+vm235DaLP
	 8ckVh6devlrBy9B3y1/248dNltGYJjfisPznYpgTPfvselxIkFbqS6s1V+Fa0RCe8V
	 KmlasRJk0JbldRS12HmKF9hEVVxQwKgtpYIu+IL9FvIzPo3yzb5hc7WSAmC2AGRQIF
	 iNRNmKChMchyg==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1202F650AD;
	Thu, 12 Sep 2024 09:13:33 +0800 (AWST)
Message-ID: <7c5a2a91fad3c52733beb5cd192ad4c90d48f82c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Remove temperature
 sensors on Medusa Board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Thu, 12 Sep 2024 10:43:32 +0930
In-Reply-To: <20240910085701.3595248-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910085701.3595248-1-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-09-10 at 16:57 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Remove two temperature sensors on Medusa Board according to hardware
> change.
>=20
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Thanks, I've applied this to be picked up through the BMC tree.

Andrew

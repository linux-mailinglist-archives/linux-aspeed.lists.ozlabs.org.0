Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657B8B99C9
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2024 13:10:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=g2MrRezj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVWSQ4v7kz3cX0
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2024 21:10:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=g2MrRezj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVWSG2dYsz2yGk
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2024 21:10:22 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 80DE020009;
	Thu,  2 May 2024 19:10:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714648219;
	bh=/EV7QTZeTfQy4aM6c9V7M+q9IBE33PIbhjLzwvZTesg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g2MrRezjUoMYZkCJRjbMGrLeMb0Yt0Re+IzEbflrcuLQX0OIY2nliDkG+0mdavYgU
	 mpyaHAqkOUeYJIXITL4juMy52uAW5HLl1pUEKTBpwVjDxMjoCr+iTkO9MqsQUaN09F
	 bY8uQPCZyTlTSQv6nlHsdo3p5KbZWeCD22J9FKkZvW80LMR7xY6lJVJBBPs/VllhVm
	 Vm31iMfbk7f0CFL3Ri680/hSJuiQdc6dSQ3ehHb97OHuKo93gLig675d1lxtgoYLZR
	 5OgihvrxByxnvERAV5wfyW/SiFnAto5zGP2i8GbCVpB+f5chVnToUQpUhHqI6jJYDe
	 MhG5v8J6TV7DQ==
Message-ID: <f14b79f4771a4216be6eb2de4352f9f1dda0eafc.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: Add nodes for i3c controllers
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Date: Thu, 02 May 2024 19:10:19 +0800
In-Reply-To: <c5331cf8-7295-4e6a-ba39-e0751a2c357e@kernel.org>
References: <20240501033832.1529340-1-jk@codeconstruct.com.au>
	 <65af46c3-e48f-4eae-8390-2bc01332ccbf@kernel.org>
	 <09ed10182e2282d7e408a4fef7994da010fe058e.camel@codeconstruct.com.au>
	 <c5331cf8-7295-4e6a-ba39-e0751a2c357e@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krysztof,

> Your first node is empty and that is not readable.

I'd argue that separating the i3c definitions makes the source more
readable (granted, at the cognitive expense of having to dereference a
label), but ok.

I'll send a v2 with the bus definitions inline, but first reworking the
existing i2c definitions to use the same format.

Cheers,


Jeremy

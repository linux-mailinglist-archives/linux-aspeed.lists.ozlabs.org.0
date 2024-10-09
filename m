Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19113995D85
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 03:57:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNbc44WY8z30MR
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 12:57:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728439026;
	cv=none; b=axfopTUzDVEihLhowjiy641o3ckg6NqucOB4deM3tsgTlWYOouV6ywkydHM3L2s8hN2pd3A7XnMiar2wfq/MLF2MwT14g1iucqnJWFkjRph4UJRyss247zIUWbNP49eAQMT22E2X5wyxaace6cabrJWN6xKGpgdid8TLtUYV8evVAA+lj6WAmCTA4Nk8JczuiTwz9yqrS2mf5VESUrHor3Ymorqwfwc56ni1GmSOIUsEL7UFL8xTv6E/90SbSX2NlujJz1VpyZ4RydvgjSZhTgFyihmde2BVyqwHv0pegFN0aXHfl4qi5HbT8iQOIg9gvzs17gwV5f71nVwieZh0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728439026; c=relaxed/relaxed;
	bh=0qIf2Ra8Gj4K+mN2QHbUYTSzc881tgucRsibpFVJjHY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NMLKf3cnVZH9GItK5+lbjIJ8f5fDHbC33p9LE4prURa3GvmPEoPAqxJvg9d6BacvTNyBpA1vRQtb4eEYlt5ZWdFzW+M3LBz/JEG8mRUiLoCX81c60N2pWuOKoL/+D4f/W9KbOOtkSPCMhvo0cBPT3xCY15co6UusWrZ6gdIrdTCoY6ofWYd9NR/qI9qzB4m9utdajoMQmqDFUthCVGNPhcH5Otm71psJvyeLR3jbs2zeSol1tant8Gc4ZC+0IWfKvpvFVq1wWUvofRkr9Rn8ZL8Gncn8TtyQ3se6exv/T0cAHlm4Eh+qV2n0lnE0S4qkQRKtSqmGPAwxtuMXKvofvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wrw3pHZL; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wrw3pHZL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNbc05RyYz2xtb
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 12:57:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728439024;
	bh=0qIf2Ra8Gj4K+mN2QHbUYTSzc881tgucRsibpFVJjHY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Wrw3pHZLxa/6sZT06tIslv8qoZa2AOEiAy/CO0Gb9yi+rdClr/wzQLXlwxrOqtBNm
	 dZpM+LB507nlDwPl9LoZbUbJIWw173I39js4qAL4PoXHnWwc7YfaU01iG4xEK1JF3P
	 extxiTWqNB2+PPi5Ckol25bWJxrVYY228entsvxPJcoKhLg4vklzGF03ZYA1YnsP5E
	 QGBm1hJzGz4YQe4Jt/yHCKDi5bab6KiOJs69EAeqL5i4xDGM3bwosAzdc8DGhRfvbT
	 pOHpTaepqqiHiEVcFlIOXLqpt+DuIL36jBDR5O7oR4iATKCexfg5lFMA+yqJFpNv3E
	 UR7UsRU5k1AXg==
Received: from [192.168.68.112] (ppp118-210-190-105.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.105])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 58DCD6497F;
	Wed,  9 Oct 2024 09:57:02 +0800 (AWST)
Message-ID: <38c72aa9f4cbd3d4a6dc9f8baac20e9bd87db644.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 5/7] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Wed, 09 Oct 2024 12:27:01 +1030
In-Reply-To: <20241008081450.1490955-6-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
	 <20241008081450.1490955-6-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-10-08 at 16:14 +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for GPIO
> registers and the coprocessor request/release. With this abstraction
> layer, the driver can separate the hardware and software logic, making it
> easier to extend the driver to support different hardware register
> layouts.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I've applied the series to here and booted it on a AST2600. I did some
brief testing with a logic analyzer and gpio{get,set} and didn't see
anything surprising, so:

Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au> # AST2600

Thanks Billy!

Andrew

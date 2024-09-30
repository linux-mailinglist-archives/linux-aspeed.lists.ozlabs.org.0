Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8BB9899C4
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 06:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH7bY2n63z2yQj
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 14:37:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727671061;
	cv=none; b=ny8DsfnMLfQKcnyrt7SVW8XA5bqs6AIV+QsbR9LT1AbGdlJOZZck0aZMJlC5Liz0AoKn2NLOikVFZiUMOcJJaDq/ULBV/kYArK/8jknQKQ84ZqW+ST90RscLKukTq9IC1gEkg70l3+ZHCzFYrBsNJK54US8oh5CRELcOtYHExtaFHV9fBi0uGx205EZuMKdrJKLIzPLOCwC5Oc/eIfhrYfzELgK7dfl81AVCfT2SqdKYMOPxcz9tTvMHdyAq4zkoR67VhfVsTxkXu9NQ4JbVC+Qd87UimbYk4PPZCV30VOQ+aA4ML8eGXml9lRJwjcjlfEvrX4nKVVopxtjmh6WVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727671061; c=relaxed/relaxed;
	bh=bvNCgG5pDPCrJ9FPzlk4/5b/7wAGKiINpTHJvUlbEt4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zp0nsW1n7/z3ZmNdHU6A4ztw7zAAjGJLxGartf0rureFLJUwzJXH2gE3EOJ1dv1ul+A7DihePZA/3WwnnEAzirqCNsSd1bjEzZmZGVWUX3QbSBz47qkQxd0wyCnh8aG+TtuEGn6qa96T6kbAEQ/e5GXgwdvCm752mEBjdlL2MRKMYo3MgFWNSJSesqzuTGaPxHuyGglv89UN1SzuMuuv97CgcSq3h5TI9DmayKAYnD71qSQnigInYZ/FKxv8mlBa9q5YQvZZ9gwjV9U7raM3XptPHBoUdvf4I+AEyOrcTf2FSP7CsMgj9r6X5oFf/+exbxCgL5dCr/YSQIpqO5mJVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a7K/pn8o; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a7K/pn8o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH7bT5xnVz2xpk
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 14:37:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671061;
	bh=bvNCgG5pDPCrJ9FPzlk4/5b/7wAGKiINpTHJvUlbEt4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=a7K/pn8oOX1LfnnGFls8ZPATsQ2330fK1bPIn7KFcvQLQ2WtatKDuTcwpk8QMtgHz
	 8PKUv+2ppcDQJlAo6y4XGeg4+ICHUxi4LPZDhZ0axFtRZ6rsztaE/e30ZRQg2Jz8v6
	 oi6vUtgGZQyRQKZG0QqOhhqDenXJMIHV+NWwQpjR6aeAwUo7ZMXgogvli0YIhiHjio
	 kaqctOE4bh+o0y9ukxAiMMXP0p8bhyfYBxaZI6LRyFj13RvZW4ISO3jaEbfpoZu/Ii
	 a3ltVqUXjWU4mlIs6aiwo0bQmtjCr7XJKkwbM26PIt5xCq7k8kGHuMV92DyRKhGpwx
	 fpDsrsXTwjrwg==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0C30A6511E;
	Mon, 30 Sep 2024 12:37:39 +0800 (AWST)
Message-ID: <506c41f97dc0243ed156f1775006ef30fe4a3f54.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 5/7] gpio: aspeed: Change the macro to support
 deferred probe
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 14:07:39 +0930
In-Reply-To: <20240927111744.3511373-6-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-6-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
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

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
> Use module_platform_driver() to replace module_platform_driver_probe().
> The former utilizes platform_driver_register(), which allows the driver t=
o
> defer probing when it doesn't acquire the necessary resources due to prob=
e
> order. In contrast, the latter uses __platform_driver_probe(), which
> includes the comment "Note that this is incompatible with deferred
> probing." Since our GPIO driver requires access to the clock resource, th=
e
> former is more suitable.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Seems okay to make it less of a deviant, though maybe we should fix the
sgpio drive as well? Anyway:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Andrew

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B6D989868
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 01:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH0m46v4Lz2yNf
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 09:29:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727652579;
	cv=none; b=Poho7cGQ+uFzmGMZ5oEX24iWoK1rY1FI5N0N5QrF5COPN8RNhyKVh6kD8/IJYPS1nZORVXV8fjKiCdaZqlocv818t4Vu5Y/j6KD2B/1TuGTMjqObkxYn0rxCd1mvb3moJGj1DCMXgMOCWWJwQr3wZxkjjApvWnk02kCcgvjizb4efLwJMu6mBa5OzcdUVpEZguV7Lq4tAQOAS+5wSZHoGPqXpQR+yTLkQOSyWaM2CmmP/xQJ6Zmkqe90ZcqcoE/ZNXq8r1eu7AmNxUhk0ZjuLoNWXzCHPrmrqO5mpvITBHzyJ3qGpggU26FA2dvFSkfLzLkMdW2AGArwQoGDOjVhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727652579; c=relaxed/relaxed;
	bh=xSpe1d7cQVMTNSIqoym1nDp/5/hAhTRAAuBR8M6wIKA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BdMjJzIis2b/1HNTO0knJRupf1mdjfUvWvS97fTh0Ec42dyzefCAHPPb3z0ONQ7Db4P7XdS35ys6iZmSwmtcjBHGzjNJWoh2HUv16csVVraulwcy4Se2Y9d0Dcwx0Zp2fjZSV3czHZOo6mv64JgJRoqnnqc6qboERpYTS8DrRO0POYjKLfV9j8i9bod1skRV7C2wOFtnuW13O/cemztRWt1z4Gf4lw6do6xvO7UrTgsq3PyNaWGGFudQgRBsJOG/NGB7iljI2FwxY9T3zuVlRl7HOfzjFV8rQGgmpHrywGfmqzr0EZt5NPpU9LSmWSvt+f3xFIhTksN+JKnvzDgVHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CTj3BBL2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CTj3BBL2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH0m242lzz2xMQ
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 09:29:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727652575;
	bh=xSpe1d7cQVMTNSIqoym1nDp/5/hAhTRAAuBR8M6wIKA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CTj3BBL2f55wdDTXiZktnMK3dqSnOUZ7VnxaXoVQw6BD/HL8Q+Youfoqf29Dgn0XR
	 y8eYvQ2Yh8uZ59+02zUkYEhOcrdYtshyUcQ3xPm2hPaCFN0reqapLHKDwo3Uvgx36M
	 6LzMUte85tIRNiMS8rB86VYj/4quaCYpOjN6Zu84V5efLu8eVx8iyqeg/AdVyMB71m
	 vw7PxLGyzBKRRIH+j6gIlQ1Mt+C02diAf/KE3Ar1jyVvg1e7lXoRqlX39sq2V0Yxms
	 J4nmphqq9ZBoNWsP/g2Z9X9kWJgL1eaj9OX2zhCsU2EkAUvhGwvg/4xfy2R7Q8hLgi
	 CUy+mifxz5qeQ==
Received: from [192.168.68.112] (ppp118-210-187-56.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.56])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A1CC06511E;
	Mon, 30 Sep 2024 07:29:32 +0800 (AWST)
Message-ID: <d63ce770e3f633292b771b46a45ffb46a70e5521.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: Add check devm_kasprintf() returned value
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Charles Han <hanchunchao@inspur.com>, benh@kernel.crashing.org, 
	gregkh@linuxfoundation.org, joel@jms.id.au
Date: Mon, 30 Sep 2024 08:59:31 +0930
In-Reply-To: <20240929031423.40630-1-hanchunchao@inspur.com>
References: <20240929031423.40630-1-hanchunchao@inspur.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, felipe.balbi@linux.intel.com, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 2024-09-29 at 11:14 +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure but this
> returned value in ast_vhub_init_dev() is not checked.
>=20
> Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

You should consider Greg's bot's reply to your other patch here also:

https://lore.kernel.org/all/2024092910-mobility-waking-758f@gregkh/

Andrew
